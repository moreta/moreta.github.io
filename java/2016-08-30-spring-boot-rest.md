---
title: Spring Boot REST
data: 2016-08-30
tags: spring, rest, spring-boot
---

# tutorial

```xml
<dependencies>
      <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-data-rest</artifactId>
      </dependency>
      <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-data-jpa</artifactId>
      </dependency>
      <dependency>
          <groupId>com.h2database</groupId>
          <artifactId>h2</artifactId>
      </dependency>
      <dependency>
          <groupId>org.projectlombok</groupId>
          <artifactId>lombok</artifactId>
          <version>1.16.6</version>
          <scope>provided</scope>
      </dependency>
  </dependencies>
```

+ modelには`@Entity`をつける
+ repositoryには `@RepositoryRestResources`をつける


# Annotation

## `@RepositoryRestResource`




# References

+ <http://peyton.tk/index.php/post/94>
