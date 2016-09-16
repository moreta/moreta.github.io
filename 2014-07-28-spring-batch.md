---
title : Spring Batch Basic
data: 2014-07-28
tags: spring-framework, java, batch, spring-batch
---

# step & chunk


<http://docs.spring.io/spring-batch/reference/html/configureStep.html>

![spring-batch-step](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-step.png)

Stepは以下のようにflowになっている

![chunk-Oriented Processing](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring_batch_chunk_oriented_processing.png)

+ Stepはchunk単位
+ ItemReaderで読んで ItemProcessorで処理して、処理された**リスト**をItemWriterに渡す


#  Job Configuration

#### architecture

![spring-batch-reference-model](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-07-28/spring-batch-reference-model.png)

#### configuring

必須

1. a name
2. JobRepository
3. and a list of Steps.

```
<!-- idがjobRepositoryのrepositoryはdefault -->
<job id="footballJob">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
</job>
```

これは以下と同じ

```
<!-- idがjobRepositoryのrepositoryはdefault -->
<job id="footballJob" job-repository="jobRepository">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
</job>
```


##### Restartablility

falseにするとthis Job does not support being started againを意味する

```
<!-- idがjobRepositoryのrepositoryはdefault -->
<job id="footballJob" job-repository="jobRepository" restartable="false">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
</job>
```

コード上で強制的にもう一度startしようとすると`JobRestartException`が発生する

##### Intercepting Job Execution(job before, job after)


```
<!-- idがjobRepositoryのrepositoryはdefault -->
<job id="footballJob" job-repository="jobRepository" restartable="false">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
    <listeners>
        <listener ref="sampleListener"/>
    </listeners>
</job>
```

##### Inheriting from a Parent Job

baseJobはabstract Jobなのでlistenersのみ指定できる

```
<job id="baseJob" abstract="true">
    <listeners>
        <listener ref="listenerOne"/>
    <listeners>
</job>

<job id="footballJob" job-repository="jobRepository" restartable="false" parent="baseJob">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
    <listeners>
        <listener ref="listenerTwo"/>
    </listeners>
</job>
```

##### JobParametersValidator

```
<job id="baseJob" abstract="true">
    <listeners>
        <listener ref="listenerOne"/>
    <listeners>
</job>

<job id="footballJob" job-repository="jobRepository" restartable="false" parent="baseJob">
    <step id="playerload"          parent="s1" next="gameLoad"/>
    <step id="gameLoad"            parent="s2" next="playerSummarization"/>
    <step id="playerSummarization" parent="s3"/>
    <listeners>
        <listener ref="listenerTwo"/>
    </listeners>
    <validator ref="paremetersValidator"/>
</job>
```

##### Java annotation config

+ `@EnableBatchConfiguration`

##### Configuring a JobRepository

```
<job-repository id="jobRepository"
    data-source="dataSource"
    transaction-manager="transactionManager"
    isolation-level-for-create="SERIALIZABLE"
    table-prefix="BATCH_"
    max-varchar-length="1000"
/>
```

![meta-data-erd](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-07-28/meta-data-erd.png)

######  In-Memory Repository

```
<bean id="jobRepository"
  class="org.springframework.batch.core.repository.support.MapJobRepositoryFactoryBean">
    <property name="transactionManager" ref="transactionManager"/>
</bean>
```

##### Configuring a JobLauncher

```
<bean id="jobLauncher"
      class="org.springframework.batch.core.launch.support.SimpleJobLauncher">
    <property name="jobRepository" ref="jobRepository" />
</bean>
```

![job-lanucher](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-07-28/job-launcher-sequence-sync.png)

*async*

![job-lanucher](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-07-28/job-launcher-sequence-async.png)

```
<bean id="jobLauncher"
      class="org.springframework.batch.core.launch.support.SimpleJobLauncher">
    <property name="jobRepository" ref="jobRepository" />
    <property name="taskExecutor">
        <bean class="org.springframework.core.task.SimpleAsyncTaskExecutor" />
    </property>
</bean>
```

#####  Running Jobs from the Command Line - CommandLineJobRunner

`bash$ java CommandLineJobRunner endOfDayJob.xml endOfDay schedule.date(date)=2007/05/05`

```
<job id="endOfDay">
    <step id="step1" parent="simpleStep" />
</job>

<!-- Launcher details removed for clarity -->
<beans:bean id="jobLauncher"
         class="org.springframework.batch.core.launch.support.SimpleJobLauncher" />
```

`endOfDayJob.xml`のendOfDayをjobで`schedule.date(date)=2007/05/05`をJobParametersで


##### Running Jobs from within a Web Container

ポイントは

*launch the job asynchronously*

コードではこのように実行するば`jobLauncher`はnonblockingなので、処理が終わるまで`HttpRequest`は待たない
```
@Controller
public class JobLauncherController {

    @Autowired
    JobLauncher jobLauncher;

    @Autowired
    Job job;

    @RequestMapping("/jobLauncher.html")
    public void handle() throws Exception{
        jobLauncher.run(job, new JobParameters());
    }
}
```

![launch from request](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-07-28/launch-from-request.png)


#### JobRegistry(option)


`<bean id="jobRegistry" class="org.spr...MapJobRegistry" />`

##### AutomaticJobRegistrar

```
<bean class="org.spr...AutomaticJobRegistrar">
   <property name="applicationContextFactories">
      <bean class="org.spr...ClasspathXmlApplicationContextsFactoryBean">
         <property name="resources" value="classpath*:/config/job*.xml" />
      </bean>
   </property>
   <property name="jobLoader">
      <bean class="org.spr...DefaultJobLoader">
         <property name="jobRegistry" ref="jobRegistry" />
      </bean>
   </property>
</bean>
```

#### JobOperator

* JobExplorer provides read-only operations on the meta-data
* JobRepository provides CRUD operations on the meta-data

# ItemReader & ItemWriters

+ <http://moreta.github.io/2016/04/08/spring-batch-itemreader-itemwriter/>


# Annotation

+ [Spring Batch 3.0うごかす](http://kagamihoge.hatenablog.com/entry/2015/02/14/144238)
  + <https://github.com/kagamihoge/springbatchstudy>

### @EnableBatchProcessing


### @ComponentScan

`@ComponentScan` annotation tells Spring to search recursively through the hello package and its children for classes marked directly or indirectly
with Spring’s `@Component` annotation.
This directive ensures that Spring finds and registers BatchConfiguration,
because it is marked with `@Configuration`,
which in turn is a kind of `@Component` annotation

### spring batch 例

<http://spring.io/guides/gs/batch-processing/>

`mvn clean package && java -jar target/gs-batch-processing-0.1.0.jar.`

### run the batch job (jar 実行する場合)

`java -jar target/gs-batch-processing-0.1.0.jar`
`mvn spring-boot:run`


# Listener

+ JobExecutionListener & StepListenerがある
+ job単位で処理するか、
+ step単位で処理するか。

## StepListener

<http://www.mkyong.com/spring-batch/spring-batch-listeners-example/>


In Spring batch, there are six “listeners” to intercept the step execution
1. StepExecutionListener
2. ItemReadListener
3. ItemProcessListener
4. ItemWriteListener
5. ChunkListener
6. SkipListener


# References

+ [Spring Batch - Official Github Repository](https://github.com/spring-projects/spring-batch)
+ [Creating a Batch Service tutorial](http://spring.io/guides/gs/batch-processing/)
+ [documentはここのreleaseの横にリンクがある reference & api](http://projects.spring.io/spring-batch/)
+ [Spring Batch 3.0うごかす](http://kagamihoge.hatenablog.com/entry/2015/02/14/144238)
