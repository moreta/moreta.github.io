Oracle sql集
============


### version 情報

```sql
SELECT *
FROM v$version;
```

### table & column search

*table*
```sql
SELECT *
FROM all_tables;
WHERE column_name = 'SEARCH_TABLE_NAME';
```


*column*
```sql
SELECT *
FROM cols
WHERE column_name = 'SEARCH_COLUMN_NAME';
```

*table's columns*
```sql
/*
 テーブルでcolumnを探す
railsの migrationの際に実行される
*/
SELECT
  column_name                                   AS name,
  data_type                                     AS sql_type,
  data_default,
  nullable,
  virtual_column,
  hidden_column,
  data_type_owner                               AS sql_type_owner,
  DECODE(data_type,
         'NUMBER', data_precision,
         'FLOAT', data_precision,
         'VARCHAR2', DECODE(char_used, 'C', char_length, data_length),
         'RAW', DECODE(char_used, 'C', char_length, data_length),
         'CHAR', DECODE(char_used, 'C', char_length, data_length),
         NULL)
                                                AS LIMIT,
  DECODE(data_type, 'NUMBER', data_scale, NULL) AS scale
FROM all_tab_cols
WHERE owner = 'Scheme_owner'
      AND table_name = 'search_table_name'
      AND hidden_column = 'NO'
ORDER BY column_id;
```
