---
title : Mybatis
data: 2016-09-12
tags: java, mybatis
---

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

[Migration to MyBatis 3](https://github.com/mhisoft/ibatis2mybatisConverter/wiki/Migration--to-MyBatis-3)
