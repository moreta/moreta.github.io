---
title: JDBC Connection
date: 2016-09-20
tags: java, jdbc, dbcp
---

#  Apache Commons DBCP

## testOnBorrow

+ connection pool에서 connection을 가져올 때 해당 connection이 유효성 검사 여부
+ 기본값은 false이며, 일반적으로 기본값을 사용한다. true설정하게 되면 매번 validationQuery를 수행하기 때문에 약간의 성능저하를 감수해야 한다.
+ DBへのコネクションが切断されちゃってた場合、再接続

```xml
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
  ...
  <property name="validationQuery" value="select 0 from dual" />
  <property name="validationQueryTimeout" value="5" />
  <property name="testOnBorrow" value="true" />
</bean>

```

## validationQuery

+ connection 유효성 검사시에 사용할 쿼리문
+ DB 리소스를 최대한 적게 사용하는 쿼리를 사용하는게 좋다.

| db                   | query                                            |
|:---------------------|:-------------------------------------------------|
| hsqldb               | select 1 from INFORMATION_SCHEMA.SYSTEM_USERS    |
| Oracle               | select 1 from dual                               |
| DB2                  | select 1 from sysibm.sysdummy1                   |
| mysql                | select 1                                         |
| microsoft SQL Server | select 1 (tested on SQL-Server 9.0, 10.5 [2008]) |
| postgresql           | select 1                                         |
| ingres               | select 1                                         |
| derby                | values 1                                         |
| H2                   | select 1                                         |
| Firebird             | select 1 from rdb$database                       |


# References

+ [DBCP - validationQuery for different Databases](http://stackoverflow.com/questions/10684244/dbcp-validationquery-for-different-databases)
  + [DBCP - validationQuery for various Databases]http://vondrnotes.blogspot.jp/2012/05/validationquery-for-different-databases.html)
+ [DBCP의 일반적인 설정값 가이드...](http://dimdim.tistory.com/entry/DBCP%EC%9D%98-%EC%9D%BC%EB%B0%98%EC%A0%81%EC%9D%B8-%EC%84%A4%EC%A0%95%EA%B0%92-%EA%B0%80%EC%9D%B4%EB%93%9C)
