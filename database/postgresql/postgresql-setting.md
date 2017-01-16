

# 設定reload


```
pg_ctl reload
```
または

```
select pg_reload_conf()
```
でもいい

reloadできるのは pg_settingsで`sighup`になっているものだけ

```sql
-- wal_keep_segments設定を変更をreloadだけに対応できるか？
SELECT name, context FROM pg_settings WHERE name = 'wal_keep_segments'
name        | context
-------------------+---------
wal_keep_segments | sighup
(1 行)
-- sighupなのでOK
```
