Oracle Parallel
================

# hint

```sql
SELECT
  /*+ PARALLEL(2) */
  *
FROM FOO
```

# dmlのparallel

+ parallel dmlはalter session enable parallel dmlしないとだめ？？

# References

+ [津島博士のパフォーマンス講座　第20回 パラレル実行について](http://www.oracle.com/technetwork/jp/database/articles/tsushima/index-1741351-ja.html)
