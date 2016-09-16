---
title : Spring Batch - JobParameterExtractor
data: 2016-07-11
tags: spring-framework, java, batch, spring-batch
---

# JobParameterExtractor


「JobParameterExtractor」は、特定のJobに対してパラメータリストを外部から設定できる


# stepのjobから次のstepのjobにデータを渡す

+ メインフローで処理を行い、処理を行った結果をJobParameterExtractorに出力。
+ メインフロー完了後、サブフローを呼び出し、JobParameterExtractorを渡す。
+ サブフローでは、JobExecutionDeciderによってJobParameterExtractorに記録されたパラメータ分処理を繰り返す。


## job-parameter-extractorを設定

```xml
<bean id="subFlowParameterExtractor" class="com.yourdomina.SubFlowParameterExtractor" />

<batch:step id="mainFlowJob.subFlowJob.call">
  <batch:job ref="subFlowJob" job-parameters-extractor="subFlowParameterExtractor" />
</batch:step>
```


# tasklet, chunk, reader, processor, writer

+ chunk : 一連の処理の塊


```xml

<!-- reader, processor, writerを使う方法 -->
<job id="ioSampleJob">
    <step name="step1">
        <tasklet>
            <chunk reader="fooReader" processor="compositeProcessor" writer="foobarWriter"
                   commit-interval="2"/>
        </tasklet>
    </step>
</job>

<!-- MethodInvokingTaskletAdapterを使う方法 -->
<job id="ioSampleJob2">
  <step id="step1">
    <tasklet ref="ioSampleJob2Tasklet" />
  </step>
</job>
```


# References

+ [omotenashi-mind : spring-batchはここを参考に](http://www.omotenashi-mind.com/)
