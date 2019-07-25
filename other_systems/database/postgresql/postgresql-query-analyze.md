# Being a Better Developer With EXPLAIN - Louise Grandjonc

<https://www.youtube.com/watch?v=IwahVdNboc8>

いい動画

# pg_stat_statements

extenstionを追加して、performanceには大きな影響はない
保存するlog数も指定できるのでstorageにも影響はない

```sql
SELECT total_time, min_time, max_time, mean_time, class, query
FROM pg_stat_statements
ORDER BY mean_time DESC
LIMIT 100;
```

# EXPLAIN ANALYZE [VERBOSE]


```sql
EXPLAIN (ANALYZE) my_super_query;
```

**UPDATE**のanalyzeできて、rollbackもできる

```sql
BEGIN;
EXPLAIN ANALYZE UPDATE owl SET ... WHERE ...;
ROLLBACK;
```