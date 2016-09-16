---
title: Spring config and autowired
date: 2016-07-28
tags: spring, autowired, config
---


# `@Import` and `@ImportResource`

### @Import

+ Indicates one or more @Configuration classes to import. For import Java code-based configuration. e.g.

```java
@Configuration
@Import({ DataSourceConfig.class, TransactionConfig.class })
public class AppConfig { ... }
```

See more in Using the [@Import annotation](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/beans.html#beans-java-using-import)

### @ImportResource

+ Indicates one or more resources containing bean definitions to import. For import XML-based configuration or other non-@Configuration bean definition resources. e.g.

```java
@Configuration
@ImportResource({"classpath:spring-security.xml"})
public class SecurityConfig { ... }
```

See more in [@Configuration class-centric use of XML with @ImportResource.](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/beans.html#beans-java-combining-java-centric)

# Springの@Autowiredが失敗した時

+ @Componentの付け忘れてないか
+ @Componentされたクラスが`@ComponentScan`の範囲外になっていないか
  + `@ComponentScan`が付いているclassのパッケージ以下しか自動スキャンしない
  + 必要ならbasePackagesに設定する)
+ @Componentされたクラスの名前が他と重複している。試しにクラス名を変えると上手くいくかも


# springのデフォルトスコープをprototypeにする

+ springのDIでデフォルトのScopeは**singleton**
+ このscopeを変更する方法は２つ
  + @Scopeアノテーションを使う
  + component-scanの設定時にscope-resolverに「org.springframework.context.annotation.Jsr330ScopeMetadataResolver」を指定する

# References

+ [Springの@Autowiredが失敗した時のチェックポイント](http://qiita.com/yakumo/items/4f69ca0dba6ba0207ba4)
+ [springのデフォルトスコープをprototypeにする](http://qiita.com/tterasawa/items/6595e88d0957a67bd673)
+ [What is the difference between the use of @Import and @ImportResource annotations in Spring framework?](http://stackoverflow.com/questions/28381957/what-is-the-difference-between-the-use-of-import-and-importresource-annotation)
+ [アノテーションについて](http://www.riem.nagoya-u.ac.jp/~ohta/etc/springboot-5.html)
