Spring Batch Parallelization
=============================

Spring Batch provides a number of parallelization options

There are four different ways to parallelize.

*single jvm上の処理では*

+ dividing work via multithreaded steps
+ parallel execution of full steps

*multiple jvm上の処理では*

+ remote chunking
+ partitioning

がある

# MULTITHREADED STEPS

+ Single JVMでの処理
+ 10,000 recordがあったとして、
+ commit intervalが 50なら以下のように処理をする。
  + 1~50 - chunk1
  + 51~100 - chunk2
  + ...
+ これらのchunkをparallelで処理して、performanceを増加する

![MULTITHREADED STEPS](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-multithreaded_step.png)

# PARALLEL STEPS

+ Single JVMでの処理
+ step間に干渉しないならstepをparallelを実行可能
+ parallelで進行するstepは他のstepが完了するまで待機する

![PARALLEL STEPS](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-parallel-step.png)

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
