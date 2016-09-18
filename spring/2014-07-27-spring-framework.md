---
title : Spring Framework
data: 2014-07-27
tags: spring-framework, java
---



# tutorial集

<http://www.java2s.com/Tutorial/Java/0417__Spring/Catalog0417__Spring.htm>

# core

## xml設定file読み込み

<http://www.java2s.com/Tutorial/Java/0417__Spring/ClassPathResource.htm>

プログラム実行時のカレントディレクトリに依存

`org.springframework.core.io.FileSystemResource`

*クラスパスが通っているディレクトリをルートとする相対または絶対指定でファイルパスを指定*

`org.springframework.core.io.ClassPathResource`

なるべく `ClassPathResource`を使ったほうがいい

```
ClassPathResource res = new ClassPathResource("/com/package/spring/di/context.xml");
// or
ClassPathResource res = new ClassPathResource("context.xml");
XmlBeanFactory factory = new XmlBeanFactory(res);
Person yamada = (Person) factory.getBean("yamada");
```
#### ほか、低レベルリソースへのアクセスの抽象化

<http://andore.com/money/trans/spring_ref_p5_ja.html#doc6_resources-classpathresource>


# Spring Annotation

See: spring-anootation

# Transaction Manager

+ ResourcelessTransactionManager
+ DataSourceTransactionManager

## ResourcelessTransactionManager

なにもしないtransaction manager

```xml
<bean id="transactionManager" class="org.springframework.batch.support.transaction.ResourcelessTransactionManager" />
```

DBにinsert,updateをする作業をする場合には`DataSourceTransactionManager`
ファイルなどに書き込みする場合には`ResourcelessTransactionManager`を使うことで考えればいい

spring batchでitemReader-itemProcessor-ItemWriterの構造の場合
commi-intervalの数だけデータをあつめ、問題無い場合commit, そうでないとrollbackだが。
ItemWriterがJdbcBatchItemWriterのようにDBへの書き込むするか、
それともItemProcessorでもDBの値を変更する作業ならこれらは`TransactionManager`によって管理されるべき。
しかし、`FlatFileItemWriter`を使う場合のようにTransactionalな処理が必要ない場合`ResourcelessTransactionManager`でも大丈夫

もう一つの例として
DBでなく、memoryにjob履歴を記録する`MapJobRepositoryFactoryBean`を使うときにもJobRepository内でのtransctionは意味がないので、`ResourcelessTransactionManager`をJobRepository管理使える
