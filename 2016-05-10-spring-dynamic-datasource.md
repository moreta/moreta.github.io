---
title: Spring dynamic datasource
data: 2016-05-10
tags: java, spring-framework, datasource
---

# 検討class

+ AbstractRoutingDataSource
+ IsolationLevelDataSourceRouter

## AbstractRoutingDataSource


+ [Dynamic DataSource Routing](https://spring.io/blog/2007/01/23/dynamic-datasource-routing/)

複数のdatasourceを定義後使用するDatasourceをThreadlocalに保存し、
AbstractRoutingDataSourceのLookupでThreadlocalにあるDatasourceを利用する方式

### spring blogの内容サマリ

+ [Dynamic DataSource Routing](https://spring.io/blog/2007/01/23/dynamic-datasource-routing/)

```java
public class CustomerContextHolder {

   private static final ThreadLocal<CustomerType> contextHolder = new ThreadLocal<CustomerType>();

   public static void setCustomerType(CustomerType customerType) {
      Assert.notNull(customerType, "customerType cannot be null");
      contextHolder.set(customerType);
   }

   public static CustomerType getCustomerType() {
      return (CustomerType) contextHolder.get();
   }

   public static void clearCustomerType() {
      contextHolder.remove();
   }
}
```

```xml
<bean id="catalog" class="blog.datasource.Catalog">
   <property name="dataSource" ref="dataSource"/>
</bean>

<bean id="dataSource" class="blog.datasource.CustomerRoutingDataSource">
   <property name="targetDataSources">
      <map key-type="blog.datasource.CustomerType">
         <entry key="GOLD" value-ref="goldDataSource"/>
         <entry key="SILVER" value-ref="silverDataSource"/>
      </map>
   </property>
   <property name="defaultTargetDataSource" ref="bronzeDataSource"/>
</bean>
```

# References

+ [Spring + MyBatis 에서 여러 개의 DataSource Routing 하는 방법](http://sidnancy.kr/post/spring-mybatis-eseo-yeoreo-gaeyi-datasource-routing-haneun-bangbeob)
