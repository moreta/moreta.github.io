---
title: Spring Framework Annotations
date: 2016-08-13
tags: java, spring-framework, annotation
---


# `@Autowired`と`@Resource`の違いについて

+ `@Resource`は `@Autowired + (@Qualifier)`だと考えればいい
+ Bean名とクラス名が同じ場合には違いはない
+ Bean名とクラス名違う場合には以下のように書く

```
@Resource(name="testbean")
private ExampleService exampleService;

@Autowired
@Qualifier("testbean")
private ExampleService exampleService;
```

# `@Configuration` and `@Component` and `@Bean`

[Spring @Configuration vs @Component](http://dimafeng.com/2015/08/29/spring-configuration_vs_component/)


+ `@Configuration`
  + classをannotationすると、そのclassはcan be used by the Spring IoC container as a source of bean definitions.
  + *springのcontextファイルだと考えればいい*
+ `@Bean`はbean
  + `@Configuration`はcontext xmlならその中のbean
+ `@Component`
  + `@ComponentScan`によってbeanとして登録される
  + classに付けることが多いが、`@Bean`と同じレベルで考えればいい

## Sample

```java
@Configuration
public static class Config {

    @Bean
    public SimpleBean simpleBean() {
        return new SimpleBean();
    }

    @Bean
    public SimpleBeanConsumer simpleBeanConsumer() {
        return new SimpleBeanConsumer(simpleBean());
    }
}
```

 + これは完全にまちがい
 + SimpleBeanConsumer will get a link to singleton SimpleBean. But unfortunately, it **doesn’t work in signed enviroment.**
```java
@Component
public static class Config {

    @Bean
    public SimpleBean simpleBean() {
        return new SimpleBean();
    }

    @Bean
    public SimpleBeanConsumer simpleBeanConsumer() {
        return new SimpleBeanConsumer(simpleBean());
    }
}
```


+ `@Component`を使うの場合にはこれがただしい
```java
@Component
public static class Config {
    @Autowired
    SimpleBean simpleBean;

    @Bean
    public SimpleBean simpleBean() {
        return new SimpleBean();
    }

    @Bean
    public SimpleBeanConsumer simpleBeanConsumer() {
        return new SimpleBeanConsumer(simpleBean);
    }
}
```


# conditionの種類

+ class
+ bean
+ property
+ resource
+ web application
+ SpEL

# spring bootの `@Conditional` & `@ConditionalOnXXX`

<http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-developing-auto-configuration.html>

## Class conditions

+ @ConditionalOnClass
  + allows configuration to be included based on the presence of specific classes.
+ @ConditionalOnMissingClass
  + allows configuration to be included based on the absence of specific classes.

## Bean conditions

+ @ConditionalOnBean
  + allow a bean to be included based on the presence of specific beans
+ @ConditionalOnMissingBean
  + allow a bean to be included based on the absence of specific beans

## Property conditions



# `@SpringBootApplication`

これは以下の３つのannotationを合わせたもの


| annotation                 | description                                                                                                                             |
|:---------------------------|:----------------------------------------------------------------------------------------------------------------------------------------|
| `@Configuration`           | tags the class as a source of bean definitions for the application context.                                                             |
| `@EnableAutoConfiguration` | tells Spring Boot to start adding beans based on classpath settings, other beans, and various property settings.                        |
| `@ComponentScan`           | tells Spring to look for other components, configurations, and services in the the class package allowing it to find the batch details. |

# `@Qualifier`

`@autowired`を利用する場合 同じinterfaceをもつ実装クラスが複数ある場合、どの実装クラスをinjectするかspringがわからなくなる。

<http://javatechnology.net/spring/qualifier/>

```java
@Autowired
@Qualifier("testbean")
private ExampleService exampleService;
```


# `@RestController`

+ New from Spring 4
+ 指定すると methodが domain objectをreturn
  + 通所は(@Controller)viewをreturn
+ `@Controller` and `@ResponseBody`の合体


# `@Scope`

# `@Component`、`@Service`、`@Repository`、`@Controller`の違い

+ 全部おなじ
+ 役割を区分したいからだけ
