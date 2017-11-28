---
title : Java Maven
data: 2014-07-28
tags: maven, java
---

## dependency tree

`mvn dependency:tree`

## setting.xml path指定

`mvn install --settings ./settings.xml`

## goal

<http://www.techscore.com/tech/Java/ApacheJakarta/Maven/7/>

「ゴール」とは、Maven のプラグインが持つ機能のことです。例えば、 5 章で紹介した tomcat-maven-plugin は start, stop, deploy, undeploy などの機能 (＝ゴール) を持っています。

## install

ローカル repository (通常`~/.m2/repository`)へインストール

```
mvn install
mvn clean install
```

## package(パッケージ)

``

ファイルを生成する際には、念の為にcleanも一緒に指定して、targetをクリアしてから実行するのが良い。
（targetの下にゴミが残っている可能性があるから、クリアする）

```
mvn package # 通常
mvn clean package
mvn package -DskipTests=true # testスキップ
```

### spring batch 例

<http://spring.io/guides/gs/batch-processing/>

`mvn clean package && java -jar target/gs-batch-processing-0.1.0.jar.`

### run the batch job (jar 実行する場合)

`java -jar target/gs-batch-processing-0.1.0.jar`
`mvn spring-boot:run`


# version

+ マルチスタイルのプロジェクトで共有するようなライブラリ*5はdependencyManagement句でバージョンを定義しておく

```
<dependencyManagement>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.8.1</version> <!-- ここで version 指定 -->
    </dependency>
  </dependencies>
</dependencyManagement>
```

```
<dependencies>
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <scope>test</scope>
  </dependency>
</dependencies>
```


# Maven Resous
