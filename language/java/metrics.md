
Metrict
===========


関連 library

```xml
<dependency>
  <groupId>commons-modeler</groupId>
  <artifactId>commons-modeler</artifactId>
</dependency>
<dependency>
  <groupId>io.dropwizard.metrics</groupId>
  <artifactId>metrics-core</artifactId>
</dependency>
<dependency>
  <groupId>com.ryantenney.metrics</groupId>
  <artifactId>metrics-spring</artifactId>
</dependency>
```

# Spring boot actuator

+ [Spring Boot Actuator でサーバの状態を確認する](http://www.techscore.com/blog/2014/05/04/spring-boot-actuator/)
+ []()

## endpoint

endpoint 一覧
+ <http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#production-ready-endpoints>
+ <http://localhost:8080/autoconfig>のように使う

### endpoint detail

+ actuator
  + 自動設定 (auto-configuration) の候補とそれらが自動設定された/されなかった理由。
+ auditevents
+ autoconfig
+ beans
  + Spring コンテナに登録されている Bean の一覧。
+ configprops
+ dump
  + スレッドダンプ。
+ env
+ flyway
+ health
+ info
+ loggers
+ liquibase
+ metrics
+ mappings
  + @RequestMapping のマッピング情報。
+ shutdown
  + シャットダウン。デフォルトでは無効化されている。
+ trace

spring mvcを使うと以下も追加される

+ docs
+ heapdump
+ jolokia
+ logfile


# References

+ [50. Metrics](https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-metrics.html)
