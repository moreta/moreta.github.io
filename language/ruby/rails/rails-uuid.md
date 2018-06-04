

```
postgres=# SELECT uuid_generate_v4();
ERROR:  function uuid_generate_v4() does not exist
```

## uuid-ossp を install

AWS RDS for Postgresqlなら

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

## installを確認

Verify Installation

```sql
SELECT * FROM pg_extension;
```

# References

+ <https://stackoverflow.com/questions/12505158/generating-a-uuid-in-postgres-for-insert-statement/12505220>
+ [rails+postgresでidにuuidを使う](http://docs.komagata.org/5455)