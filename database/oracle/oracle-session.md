# 発行中のsqlの確認

```sql
SELECT
  a.INST_ID,
  a.SCHEMANAME,
  a.SQL_ID,
  a.WAIT_CLASS,
  a.EVENT,
  --  b.SQL_FULLTEXT,
  trunc((sysdate - a.SQL_EXEC_START) * 24 * 60 * 60, 2) AS "elapsed time",
  a.WAIT_TIME,
  substr(b.SQL_TEXT, 1, 150)                            AS sql_head
FROM
  gV$SESSION a,
  gV$sqlarea b
WHERE 1 = 1
      AND status = 'ACTIVE'
      AND a.INST_ID = b.INST_ID
      AND a.SQL_ID = b.SQL_ID
ORDER BY a.INST_ID, a.SQL_EXEC_START;
```

### distinctで見る

```sql
SELECT DISTINCT
  sdi,
  sql_id,
  "elapsed time",
  sql_head,
  WAIT_TIME
FROM (
  SELECT
    a.sid,
    a.INST_ID,
    a.SCHEMANAME,
    a.SQL_ID,
    a.WAIT_CLASS,
    a.EVENT,
    --     b.SQL_FULLTEXT,
    trunc((sysdate - a.SQL_EXEC_START) * 24 * 60 * 60, 2) AS "elapsed time",
    a.WAIT_TIME,
    substr(b.SQL_TEXT, 1, 150)                            AS sql_head
  FROM
    gV$SESSION a,
    gV$sqlarea b
  WHERE 1 = 1
        AND status = 'ACTIVE'
        AND a.INST_ID = b.INST_ID
        AND a.SQL_ID = b.SQL_ID
  ORDER BY a.INST_ID, a.SQL_EXEC_START);
```

### 上のクエリでsidを確認してsqlをkillする

```sql
set linesize 500
select sid, serial#, username, program from v$session where username = 'ユーザ名';
-- sidの以下に設定
alter system kill session '16, 10751';
```

# References

+ [Oracle kill sessionメモ](http://www.ne.jp/asahi/hishidama/home/tech/oracle/session.html)
