Rails Migration
=======================


# example code - 単独のマイグレーション


## crate table

```sh
rails generate migration CreateProducts name:string part_number:string
```

```rb
class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number
    end
  end
endp
```

## add column

```sh
rails generate migration AddPartNumberToProducts part_number:string
```

```rb
class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :part_number, :string
  end
end
```

## add index

```sh
rails generate migration AddPartNumberToProducts part_number:string:index
```

```rb
class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number
  end
end
```

# migration file syntax

## dataタイプが違う場合にchange_column

*postgresql*でしかテストしてない。

**integer to boolean**

sqliteを使っていたが、booleanに変更したかった。

`change_column :message_parts, :is_attachment, 'bool USING CASE WHEN is_attachment=0 THEN FALSE ELSE TRUE END;'`

**string to integer**

`change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'`



# zero downtime migration

[Zero Downtime Migrations with ActiveRecord and PostgreSQL
](https://tech.lendinghome.com/zero-downtime-migrations-with-activerecord-and-postgresql-b3aca53ffbe6#.9zkwrbi67)

# References

## migration commands

+ [Active Record マイグレーション](https://railsguides.jp/active_record_migrations.html)

## zero downtime
+ [Zero Downtime Migrations with ActiveRecord and PostgreSQL
](https://tech.lendinghome.com/zero-downtime-migrations-with-activerecord-and-postgresql-b3aca53ffbe6#.9zkwrbi67)
