---
title: spark
date: 2015-06-04
tags: spark, hadoop
---


# 概要

* ポストHadoop
* スループット重視 : Hadoop
* レスポンス重視 : Spark


## 特徴
* 高速：インメモリとディスクの両方において、MapReduceよりも最大で100倍速いデータ処理を実現
* パワフル：”map”と”reduce”の実行という点のみを考慮することなく、Java、ScalaやPython上の精巧な並列アプリケーションを迅速に実行
* 統合性：Sparkは、CDHと深く統合されており、HDFSなどでデプロイされたどんなデータも実行することが可能

# install (mac)

<http://spark.apache.org/downloads.html>

上記のリンクからダウンロード。以下のように選択し、ダウンロードする。

## hadoop built version

1. Choose a Spark release: 1.4.1 (Jul 15 2015)
2. Choose a package type:  Pre-built for Hadoop 2.6 and later
3. Choose a download type:  Direct Download
4. Download Spark: spark-1.4.1-bin-hadoop2.6.tgz

## cloudera built version

Pre built for CHD 4


## ファイルをダウンロードしたら

downloadされたファイルを適切な場所へ移動し、圧縮ファイルを解凍する。

```sh
tar -xf spark-1.4.1-bin-cdh4.tgz
```

# 起動


```sh
cd your_spark_folder
bin/spark-shell
```

以下のような感じにある
```
log4j:WARN No appenders could be found for logger (org.apache.hadoop.metrics2.lib.MutableMetricsFactory).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
15/08/13 18:23:25 INFO SecurityManager: Changing view acls to: JP11785
15/08/13 18:23:25 INFO SecurityManager: Changing modify acls to: JP11785
15/08/13 18:23:25 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users with view permissions: Set(JP11785); users with modify permissions: Set(JP11785)
15/08/13 18:23:25 INFO HttpServer: Starting HTTP Server
15/08/13 18:23:25 INFO Utils: Successfully started service 'HTTP class server' on port 59324.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 1.4.1
      /_/

Using Scala version 2.10.4 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_11)
...
...
SQL context available as sqlContext.

scala>
```

# running the examples and shell

`examples/src/main`の場所にある

## [ソース実行] javaやscala programeを実行する方法
```
./bin/run-example <class> [params]
./bin/run-example SparkPi 10
```

## [interactive shell]

`--master`は

```
./bin/spark-shell --master local[2]
```

## Web UI
스팍은 자체적으로 클러스터를 모니터링 할 수 있는 차체적인 Web UI가 있다.

+ <http://localhost:4040>

 접속하면 다음과 같이 스팍 클러스터에 대한 모니터링 화명을 얻을 수 있다.

## Launching on a Cluster

Cluster上で起動する際には 以下のものなどを利用

* Amazon EC2: our EC2 scripts let you launch a cluster in about 5 minutes
* Apache Mesos



# RDD(Resilient Distributed Dataset)

不変で分散処理可能なコレクション

## RDD에서는 딱 두 가지 오퍼레이션만 지원한다.
+ Transformation : 기존의 RDD 데이타를 변경하여 새로운 RDD 데이타를 생성해내는 것. 흔한 케이스는 filter와 같이 특정 데이타만 뽑아 내거나 map 함수 처럼, 데이타를 분산 배치 하는 것 등을 들 수 있다.
+ Action : RDD 값을 기반으로 무엇인가를 계산해서(computation) 결과를 (셋이 아닌) 생성해 내는것으로 가장 쉬운 예로는 count()와 같은 operation들을 들 수 있다.


## Spark persistence

SparkはTransformation Operationを実行しても Transformation段階でなく、Actionが実装される段階でロードされる。


스파크에서는 RDD 를 저장해놓고 사용하는 기능으로 persist()와 cache() 라는 두 가지 오퍼레이션을 지원한다.
스파크는 RDD를 저장함에 있어서,  메모리와 디스크 두 가지 영역을 사용하며, 옵션에 따라서 RDD의 저장 영역을 지정할 수 있다.

기본 디폴트는 메모리에 저장하고, 옵션으로 디스크를 지정할 수 있다. 디스크를 지정하면, 메모리에서 모지란 부분을 마치 swapping 하듯이 디스크에 데이타를 저장한다.

![spark storage level](https://dl.dropboxusercontent.com/u/21522805/blog/data_analyzing/spark_storage_level.png)



### メモリ常駐使用

RDD를 메모리에 상주하고 계속해서 재 사용하고 싶다면 `RDD.persist()`라는 메서드를 이용하면, RDD를 메모리에 상주 시킬 수 있다.

# Quick Start

## One common data flow pattern is MapReduce, as popularized by Hadoop. Spark can implement MapReduce flows easily:

```scala
scala> val wordCounts = textFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey((a, b) => a + b)
wordCounts: spark.RDD[(String, Int)] = spark.ShuffledAggregatedRDD@71f027b8
```


# tutorial

## maximum-temperature-year-using-spark-sql

+ [maximum-temperature-year-using-spark-sql](http://www.dattamsha.com/2014/09/maximum-temperature-year-using-spark-sql/)
+ [Apache Sparkで始めるお手軽リアルタイムウインドウ集計](http://www.intellilink.co.jp/article/column/bigdata-kk01.html)


# Map & Reduce

<http://codezine.jp/article/detail/2448>

## Mapフェーズ

情報の分析＆抽出

## Reduceフェーズ

情報の集計＆計算


# mac install

```
brew install scala
brew install apache-spark

# spark home - bash
export SPARK_HOME=/usr/local/Cellar/apache-spark/1.6.1/libexec

# spark home - fish
set -x SPARK_HOME /usr/local/Cellar/apache-spark/1.6.1/libexec
```
# 実行方法

<http://www.task-notes.com/entry/20160103/1451810637>

syntax

```
$ ${SPARK_HOME}/bin/spark-submit \
  --master <master-url> \
  --class <main-class>
  --name <name>
  ... # other options
  <application-jar> \
  [application-arguments]
```

example

```
$ mvn package
$ spark-submit \
  --master local \
  --class com.example.spark.SimpleApp \
  target/simple-project-1.0.jar \
  /usr/local/Cellar/apache-spark/1.5.2
...
Lines with a: 60, Lines with b: 29
```

# trouble shooting

## Can't assign requested address

```
16/07/21 10:21:43 ERROR Executor: Exception in task 0.0 in stage 0.0 (TID 0)
java.net.ConnectException: Can't assign requested address
	at java.net.PlainSocketImpl.socketConnect(Native Method)
```

の場合には以下をセット

```
export SPARK_MASTER_IP=127.0.0.1
export SPARK_LOCAL_IP=127.0.0.1
```
