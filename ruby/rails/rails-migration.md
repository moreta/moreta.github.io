Rails Migration
=======================


# zero downtime migration

[Zero Downtime Migrations with ActiveRecord and PostgreSQL
](https://tech.lendinghome.com/zero-downtime-migrations-with-activerecord-and-postgresql-b3aca53ffbe6#.9zkwrbi67)

# example code


```
rails g migration CreateTableName a_column:string b_column:string
```


## dataタイプが違う場合にchange_column

*postgresql*でしかテストしてない。

**integer to boolean**

sqliteを使っていたが、booleanに変更したかった。

`change_column :message_parts, :is_attachment, 'bool USING CASE WHEN is_attachment=0 THEN FALSE ELSE TRUE END;'`

**string to integer**

`change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'`


# References

+ [Zero Downtime Migrations with ActiveRecord and PostgreSQL
](https://tech.lendinghome.com/zero-downtime-migrations-with-activerecord-and-postgresql-b3aca53ffbe6#.9zkwrbi67)
