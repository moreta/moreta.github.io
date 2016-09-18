---
title : Oracle Hint
data: 2016-04-12
tags: oracle, sql, hint
---

# よく使うもの

+ ordered
+ leading
+ inxex
+ full
+ use_nl
+ use_hash

# ORDERED

SQLに書いた順に結合

```sql
SELECT /*+ ORDERED */ EMP2.ENAME ,DEPT.DNAME ,EMP2.JOB
 FROM DEPT
     ,EMP EMP2
     ,EMP EMP1
WHERE EMP1.MGR = EMP2.EMPNO
  AND EMP2.DEPTNO = DEPT.DEPTNO
  AND EMP1.ENAME = 'TURNER';
```

# LEADING

指定したテーブル順に結合します。


```sql

```

# References

+ <http://tryerror.net/tryerror/wordpress/post-223>
