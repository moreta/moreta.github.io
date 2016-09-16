---
title : Mybatis
data: 2016-09-12
tags: java, mybatis
---

# ifでjavaのclass methodを使う方法

```
<if test="@org.springframework.util.StringUtils@isEmpty(id)">
  AND id = #{id}
</if>
<if test="@org.springframework.util.StringUtils@isEmpty(id) == false">
  AND id = #{id}
</if>

```


```
<if test="@org.apache.commons.lang3.StringUtils@isNotEmpty(id)">
  AND id = #{id}
</if>
```
