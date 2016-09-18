---
title: Rails Migration
date: 2014-09-02
tags: ruby, db, migration
---



## dataタイプが違う場合にchange_column

*postgresql*でしかテストしてない。

**integer to boolean**

sqliteを使っていたが、booleanに変更したかった。

`change_column :message_parts, :is_attachment, 'bool USING CASE WHEN is_attachment=0 THEN FALSE ELSE TRUE END;'`

**string to integer**

`change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'`