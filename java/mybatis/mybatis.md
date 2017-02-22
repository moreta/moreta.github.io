---
title : Mybatis
data: 2016-09-12
tags: java, mybatis
---

# Batch 処理

+ <http://qiita.com/opengl-8080/items/a9b5d4038f19d4813ee6>
+ <http://lancerme.tistory.com/32>

## ibatis

```java
public void executeUpdate(final List<bookinfobean> list) throws DataAccessException {
    getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
         
        public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
             
            executor.startBatch();
             
            Iterator<BookInfoBean> it = list.iterator();
            while (it.hasNext()) {
                BookInfoBean bean = it.next();
                executor.update("kr.lancerme.insertBookInfo", bean);
            }
             
            executor.executeBatch();
            return null;
        }
    });
}
```

## mybatis

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration PUBLIC "-//mybatis.org//DTD Config 3.0//EN" "http://mybatis.org/dtd/mybatis-3-config.dtd">
 
<configuration>
  
    <settings>
        <setting name="cacheEnabled" value="true" />
        <setting name="lazyLoadingEnabled" value="false" />
        <setting name="multipleResultSetsEnabled" value="true" />
        <setting name="useColumnLabel" value="true" />
        <setting name="useGeneratedKeys" value="false" />
        <!-- <setting name="defaultExecutorType" value="SIMPLE" /> -->
        <setting name="defaultExecutorType" value="BATCH" /> <!-- この設定だけでbatch処理が可能 -->
        <setting name="defaultStatementTimeout" value="25000" />
    </settings>
 
    <!-- java.util.Date 로 변경 -->
    <typeHandlers>
        <typeHandler javaType="java.sql.Timestamp" handler="org.apache.ibatis.type.DateTypeHandler"/>
        <typeHandler javaType="java.sql.Time" handler="org.apache.ibatis.type.DateTypeHandler"/>
        <typeHandler javaType="java.sql.Date" handler="org.apache.ibatis.type.DateTypeHandler"/>
    </typeHandlers>
         
</configuration>
```

```java
public Object insertBookInfo (BookInfoBean bean) {
    return bookInfoDao.insertBookInfo (bean);
}
 
public void insertBookInfos(List<BookInfoBean> list) {
    Iterator<BookInfoBean> it = list.iterator();
    while (it.hasNext()) {
        bookInfoDao.insertBookInfo(it.next());
    }
}
 
public void insertBookInfo(BookInfoBean[] beans) {
    for (int i = 0; i < beans.length; i++) {
        bookInfoDao.insertBookInfo(beans[i]);
    }
}
```

# ifでjavaのclass methodを使う方法

```xml
<if test="@org.springframework.util.StringUtils@isEmpty(id)">
  AND id = #{id}
</if>
<if test="@org.springframework.util.StringUtils@isEmpty(id) == false">
  AND id = #{id}
</if>

```


```xml
<if test="@org.apache.commons.lang3.StringUtils@isNotEmpty(id)">
  AND id = #{id}
</if>
```

# migration from ibatis

##  isPropertyAvailable -> if

```xml
<!-- iBatis -->
<isPropertyAvailable property="displayPriceType" >
<![CDATA[
desc
]]>
</isPropertyAvailable>

<!-- mybatis -->
<if test="displayPriceType!=null">
  <![CDATA[
    desc
   ]]>
</if>
```

## iterate -> foreach

```xml
<!-- ibatis -->
<dynamic prepend="IN">
   <iterate property="appAdminIDs" open="(" close=")" conjunction=",">
    #appAdminIDs[]#
  </iterate>
</dynamic>

<!-- mybatis -->
IN
<foreach item="item" index="index" collection="appAdminIDs" open="(" separator="," close=")">
    #{item}
</foreach>
```


# References

+ [Migration to MyBatis 3](https://github.com/mhisoft/ibatis2mybatisConverter/wiki/Migration--to-MyBatis-3)
+ [MyBatis 使い方メモ](http://qiita.com/opengl-8080/items/a9b5d4038f19d4813ee6)