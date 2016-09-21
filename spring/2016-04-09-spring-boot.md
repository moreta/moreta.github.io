---
title : Spring Boot
data: 2016-04-09
tags: spring-framework, java, spring-boot
---

# spring-boot-devtools

<http://qiita.com/IsaoTakahashi/items/f99d5f761d1d4190860d>

# jar & war

Spring bootを利用するときにjarとwar packageに大きな違はない。
単にwarにするとContainerにアップできるぐらい


# commands

## main methodを実行

```
mvn spring-boot:run
```

## jarをつくる

```
mvn clean package
```

## jarを実行

```
java -jar target/studyspringbatch-0.0.1-SNAPSHOT.jar
```


# Other starter

## mybatis-spring-boot-starter

+ [mybatis-spring-boot-starterの使い方](http://qiita.com/kazuki43zoo/items/ea79e206d7c2e990e478)
+ [MyBatis integration with Spring Boot](https://github.com/mybatis/spring-boot-starter)


# mutiple datasourceを利用する方法

```yml
#==========================
# Datasources
#==========================
datasource:
  a:
    url: xxx
    username: xx
    password: xx
    driverClassName: org.postgresql.Driver
  b:
    url: xxx
    username: xx
    password: xx
    driverClassName: org.postgresql.Driver
  c:
    url: xxx
    username: xx
    password: xx
    driverClassName: org.postgresql.Driver

```

```java
@Configuration
public class DataSourceConfig {

    /**
     * for JP billing oracle database(slave)
     */
    @Primary
    @Bean(name = "aDataSource")
    @ConfigurationProperties(prefix="datasource.a")
    public DataSource billDataSource() {
        return DataSourceBuilder.create().build();
    }

    /**
     * for Spring Batch repository
     */
    @Bean(name = "bDataSource")
    @ConfigurationProperties(prefix="datasource.b")
    public DataSource batchDataSource() {
        return DataSourceBuilder.create().build();
    }

    /**
     * for Local test
     */
    @Bean(name = "cDataSource")
    @ConfigurationProperties(prefix="datasource.c")
    public DataSource localDataSource() {
        return DataSourceBuilder.create().build();
    }
}
```




# References

+ [Spring Bootハンズオン](http://jsug-spring-boot-handson.readthedocs.io/en/latest/index.html)
