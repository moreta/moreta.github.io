Spring Batch Parallelization
=============================

Spring Batch provides a number of parallelization options

## Distribute Complex processing

There are four(five?) different ways to parallelize.


*single jvm上の処理では*

+ Multi-threaded steps - dividing work via multithreaded steps
+ Parallel Step - parallel execution of full steps
+ Local partitioning

*multiple jvm上の処理では*

+ Remote chunking
+ Remote partitioning
  + <https://www.youtube.com/watch?v=CYTj5YT7CZU>

がある

## Asynchronous Item processing support !!!!!!!!!!!

+ AsyncItemProcessor
+ AsyncItemWriter

references

+ <http://docs.spring.io/spring-batch/trunk/reference/html/springBatchIntegration.html#asynchronous-processors>
+ <http://stackoverflow.com/questions/27801989/multithreading-in-spring-batch>

# MULTITHREADED STEPS

+ Single JVMでの処理
+ 10,000 recordがあったとして、
+ commit intervalが 50なら以下のように処理をする。
  + 1~50 - chunk1
  + 51~100 - chunk2
  + ...
+ これらのchunkをparallelで処理して、performanceを増加する
+ 順番は担保されない

![MULTITHREADED STEPS](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-multithreaded_step.png)
![MULTITHREADED STEPS 2](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-multithreaded_step_02.png)

*example*

+ `taskExecutor`は直接実装するか、一番簡単なSimpleAsyncTaskExecutorを利用
+ `throttle-limit`はdefault4だけ調整する、DataSourceの許容範囲で設定すること

```xml
<step id="loading">
  <tasklet
    task-executor="taskExecutor"
    throttle-limit="20">...</tasklet>
</step>


<step id="processImages">
  <tasklet task-executor="taskExecutor">
    <chunk reader="itemReader" processor="itemProcessor" writer="itemWriter" commit-interval="500"/>
  </tasklet>
</step>

<bean id="taskExecutor" class="org.springframework.core.task.SimpleAsyncTaskExecutor" />
```
## multithreaded stepで注意

以下のlinkに既存cursor item readerを使ってMulti-threadedへ変更したときのケースが載っている
<http://stackoverflow.com/questions/28719836/spring-batch-problems-mix-data-when-converting-to-multithread>

+ item readerはthread safeではない

# partitioning Step

![Partitioning Step](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-partitioned-step.png)

tutorial

<https://www.mkyong.com/spring-batch/spring-batch-partitioning-example/>

# PARALLEL STEPS

+ Single JVMでの処理
+ step間に干渉しないならstepをparallelを実行可能
+ parallelで進行するstepは他のstepが完了するまで待機する

![PARALLEL STEPS](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-parallel-step.png)

*example*

+ (step1, step2)が１つ、それと並列で step3が実行される

```xml
<job id="job1">
    <split id="split1" task-executor="taskExecutor" next="step4">
        <flow>
            <step id="step1" parent="s1" next="step2"/>
            <step id="step2" parent="s2"/>
        </flow>
        <flow>
            <step id="step3" parent="s3"/>
        </flow>
    </split>
    <step id="step4" parent="s4"/>
</job>

<bean id="taskExecutor" class="org.springframework.core.task.SimpleAsyncTaskExecutor" />
```
## Parallel stepを使うときには`<flow>`も合わせて使う

+ [5.3.5 Split Flows](http://docs.spring.io/spring-batch/reference/html/configureStep.html#split-flows)も合わせて確認しよう。
+ `<flow>`はstepをグループ化したもの。
+ 上ではflowにidをつけてないが、idつけて別jobから再利用することができる

[flowの再利用例](http://docs.spring.io/spring-batch/reference/html/configureStep.html#external-flows)

```xml
<job id="job">
    <!-- 2. 定義されているflowをparent指定して使う -->
    <flow id="job1.flow1" parent="flow1" next="step3"/>
    <step id="step3" parent="s3"/>
</job>

<!-- 1. flowを定義 -->
<flow id="flow1">
    <step id="step1" parent="s1" next="step2"/>
    <step id="step2" parent="s2"/>
</flow>
```

# REMOTE CHUNKING

+ Multi JVMでの処理
+ ItemReaderをmaster nodeで処理し
+ 他の remote slave ItemProcessorへ送信
  + sent via a form of durable communication(JMS for example)
+ slave nodeで処理した結果をmaster nodeのItemWriterへ送信

Because this approach reads the data at the master, processes it at the slave, and then sends it back, it's important to note that it can be very *network intensive*.

This approach is good for scenarios *where the cost of I/O is small* compared to the actual processing.


# PARTITIONING

+ Multi JVMでの処理
+ master/slaveの構造は必要
+ masterはslave stepたちをcontrolするだけ
  + master serves only as a controller for a collection of slave steps
+ slave stepは単独でdeployされているときのように設定し、処理する
  + each of your slave steps is self-contained and configured the same as if it was locally deployed
+ 通常はjobから仕事をもらうが、partitioningでのslave stepはmaster nodeから仕事をもらうのは違う。
  + The only difference is that the slave steps receive their work from the master node instead of the job itself
+ When all the slaves have completed their work, the master step is considered complete
+ partitioningはnetworkを心配する必要がない。なぜならJobRepositoryで管理されるため
  + This configuration doesn't require durable communication with guaranteed delivery because the JobRepository guarantees that no work is duplicated and all work is completed—unlike the remote-chunking approach

![PARTITIONING](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-partitionning.png)


# References

+ [7. Scaling and Parallel Processing](http://docs.spring.io/spring-batch/reference/html/scalability.html)
+ [SpringBatch：設定だけでできる処理の並列化 ](http://www.omotenashi-mind.com/index.php?title=SpringBatch%EF%BC%9A%E8%A8%AD%E5%AE%9A%E3%81%A0%E3%81%91%E3%81%A7%E3%81%A7%E3%81%8D%E3%82%8B%E5%87%A6%E7%90%86%E3%81%AE%E4%B8%A6%E5%88%97%E5%8C%96)
+ [10.並行処理（split）のサンプル](https://sites.google.com/site/soracane/home/springnitsuite/spring-batch/9-heikou-shori--split-no-sanpuru)
+ [Parallel batch processing with spring batch slideshare by accenture](http://www.slideshare.net/mortenag/parallel-batch-processing-with-spring-batch-slideshare)

## sample source

+ [SpringOne2GX-2014/spring-batch-performance-tuning](https://github.com/SpringOne2GX-2014/spring-batch-performance-tuning)

## stack overflow

+ [Spring Batch : Tasklet with multi threaded executor has very bad performances related to Throttling algorithm](http://stackoverflow.com/questions/18262857/spring-batch-tasklet-with-multi-threaded-executor-has-very-bad-performances-re)
+ [Spring Batch: Which ItemReader implementation to use for high volume & low latency](http://stackoverflow.com/questions/20386642/spring-batch-which-itemreader-implementation-to-use-for-high-volume-low-laten)
