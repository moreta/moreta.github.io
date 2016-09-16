---
title: Postgresql vacuum
date: 2014-06-11
tags: postgresql
---











## 扶養領域をチェック

```
select relname, n_live_tup, n_dead_tup, round(n_dead_tup*100/n_live_tup,2) AS ratio 
from pg_stat_user_tables where n_live_tup > 0;
```

## vacuumしよう！

`VACUUM (VERBOSE, ANALYZE) テーブル名;`


## vaccum full

VACUUMには、標準VACUUMとVACUUM FULLという２つの種類があります。 
VACUUM FULLはより多くのディスク容量を回収することができますが、実行にとても時間がかかります。 
また、VACUUMの標準形式は実運用のデータベースに対する操作と同時に実行させることができます。 
（SELECT、INSERT、UPDATE、DELETEなどのコマンドは通常通りに動作し続けます。 
しかし、バキューム処理中はALTER TABLE ADD COLUMNなどのコマンドを使用してテーブル定義を変更することはできません。） 
VACUUM FULLはそれが作用する全てのテーブルに対し排他ロックを必要とするので、それらテーブルのその他の用途と並行して行うことはできません。 
一般的に、管理者は標準VACUUMの使用に努め、VACUUM FULLの使用を避けるべきです。

## cron

cron等で定期的に"vacuumdb -a -z"と実行することをお勧めする


## 参考

<http://blog.fusic.co.jp/archives/747>

一番はdocument

<ttp://www.postgresql.jp/document/9.2/html/routine-vacuuming.html>