---
title : Spring Batch ItemReader, ItemWriter
data: 2016-04-08
tags: spring-framework, java, batch, spring-batch
---

# 概要

+ Spring BatchはJobとStepに
+ Stepは
  + ItemReader, ItemProcessor, ItemWriterを持つか
  + またはTaskletをもつ
+ chunk
  + chunkは一つのtransactionの中で処理するreadの単位を設定。
  + 3なら３つのitemをよみ、一つのtransactionでwriteする

ここではItemReader, ItemProcessor, ItemWriterについて扱う。

![spring-batch-step](https://dl.dropboxusercontent.com/u/21522805/blog/java/spring-batch-step.png)

## Item Reader

TODO: 整理

http://blog.ksug.org/48

JdbcCursorItemReader
DrivingQueryItemReader
IbatisDrivingQueryItemReader

## Item Writer



# Configuring Step

```java
@Configuration
public class StepConfiguration {

    private static final String STEP_NAME = "StepName";

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Autowired
    private StepBuilderFactory stepBuilderFactory;

    @Bean
    public Step Step() {
        return stepBuilderFactory.get(STEP_NAME)
            .<InputType, OutputType>chunk(1)
            .reader(sampleItemReader())
            .processor(sampleItemProcessor())
            .writer(sampleItemWriter())
            .build();
    }

    @Bean
    public ItemReader<InputType> sampleItemReader() {
        MyBatisPagingItemReader<InputType> reader = new MyBatisPagingItemReader<InputType>();
        reader.setSqlSessionFactory(sqlSessionFactory);
        reader.setQueryId("mapper.package.path.MapperClass.MethodName");

        return reader;
    }

    @Bean
    public ItemProcessor<InputType, OutputType> sampleItemProcessor() {
        return new SampleItemProcessor();
    }

    @Bean
    public ItemWriter<OutputType> sampleItemWriter() {
        MyBatisBatchItemWriter<OutputType> writer = new MyBatisBatchItemWriter<OutputType>();
        writer.setSqlSessionFactory(sqlSessionFactory);
        writer.setStatementId("mapper.package.path.MapperClass.MethodName");

        return writer;
    }

}
```

## Chunk Oriented Processing

Chunkとは「大きな塊」を意味し、Spring Batchでは一つの入力ファイルからの読込み・チェック・加工・出力までの一連の処理を一つの「Chunk」として定義するスタイルを採用しています。

簡単なChunk定義の例

```xml
<chunk reader="itemReader" processor="itemProcesor" writer="itemWriter" commit-interval="2"/>
```

例では、入力ファイルからの読込みには「itemReader」を指定し、
入力後データの(チェックや加工)処理には「itemProcessor」、
最終的な出力には「itemWriter」を設定しています。

バッチ製造者は仕様に応じて、適切な「itemReader」、「itemProcessor」、「itemWriter」を実装し、Chunkに設定するだけでバッチ処理の実装が行える構造となっています。


### 5.1.1 Configuring step

```xml
<job id="sampleJob" job-repository="jobRepository">
    <step id="step1">
        <tasklet transaction-manager="transactionManager">
            <chunk reader="itemReader" writer="itemWriter" commit-interval="10"/>
        </tasklet>
    </step>
</job>
```

+ reader - The ItemReader that provides items for processing.
+ writer - The ItemWriter that processes the items provided by the ItemReader.
+ transaction-manager - Spring's PlatformTransactionManager that will be used to begin and commit transactions during processing.
+ job-repository - The JobRepository that will be used to periodically store the StepExecution and ExecutionContext during processing (just before committing). For an in-line <step/> (one defined within a <job/>) it is an attribute on the <job/> element; for a standalone step, it is defined as an attribute of the <tasklet/>.
+ commit-interval - The number of items that will be processed before the transaction is committed.


### 5.1.2 Inheriting from a Parent Step / parent stepを承継

複数のstepが同じことをするのであればparent stepで設定を共有できる。

方法としては
+ Overriding
  + Inheriting step(or abstract step)
+ Merging
  + listenersのようにリストの場合にはmergeされる


```xml
<step id="parentStep">
    <tasklet allow-start-if-complete="true">
        <chunk reader="itemReader" writer="itemWriter" commit-interval="10"/>
    </tasklet>
</step>

<step id="concreteStep1" parent="parentStep">
    <tasklet start-limit="5">
        <chunk processor="itemProcessor" commit-interval="5"/>
    </tasklet>
</step>
```

+ reader: itemReader
+ writer: itemWriter
+ processer: itemProcesor
+ commit-interval: 親をoverrideして5


以下はlistenersがmergeされて listenerOneとlistenerTwoがmergeされる。

```xml
<step id="listenersParentStep" abstract="true">
    <listeners>
        <listener ref="listenerOne"/>
    <listeners>
</step>

<step id="concreteStep3" parent="listenersParentStep">
    <tasklet>
        <chunk reader="itemReader" writer="itemWriter" commit-interval="5"/>
    </tasklet>
    <listeners merge="true">
        <listener ref="listenerTwo"/>
    <listeners>
</step>
```

### 5.1.3 The Commit Interval

```xml
<job id="sampleJob">
    <step id="step1">
        <tasklet>
            <chunk reader="itemReader" writer="itemWriter" commit-interval="10"/>
        </tasklet>
    </step>
</job>
```

1. transactionが開始し、itemReaderでitemが読まれる
2. 10個のitemが読まれたら itemWriterにわたされ
3. transactionが完了する

# References

+ [Configure Step](https://docs.spring.io/spring-batch/reference/html/configureStep.html)
+ [ItemReader and ItemWriter](http://docs.spring.io/spring-batch/trunk/reference/html/readersAndWriters.html)

+ [The Domain Language of Batch](http://docs.spring.io/spring-batch/reference/html/domain.html)
+ [Spring Batch를 이용한 기본적인 Batch Application](https://dayone.me/1Sm6zrv)
+ [Spring batch s- 스프링배치 연재(5) ItemReader와 ItemWriter](http://blog.ksug.org/48)
+ [egovframe ItemReader](http://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte2:brte:batch_core:item_reader)
