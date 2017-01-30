Postgresql BACKUP & RESTORE
============================

# Backup

scriptで

`pg_dump -U db_user db_name > /pgdata/your_db_$date.sql`


* カスタマーアカイブで形式（こっちの方が容量は少ないが、dumpに時間がかかる)
* するならtarがいいかな

```sh
pg_dump -Fc -U db_user db_name > /pgdata/your_db_$date.dump
pg_dump -Ft -U db_user db_name > /pgdata/your_db_$date.tar
```

option

`-Fc (File custom)`
`-Ft (File tar)`


バックアップ cron

```sh
#!/usr/bin/env bash

date=`date '+%Y%m%d'`
pg_dump -U db_user db_name > /pgdata/your_db_$date.dump
s3cmd put /pgdata/your_db_$date.dump s3://your_s3/backup_dir/
rm -rf /pgdata/your_db_$date.dump
```

# Restore

RestoreするまえにDBがなかったら先に作っておく

`createdb db_name -O owner`

### Restore commands

```
pg_dump -U db_user db_name > /pgdata/your_db_$date.sql
psql -U db_user db_name -f yourdump.dump
```

```
pg_dump -Fc -U db_user db_name > /pgdata/your_db_$date.dump
pg_restore -U user_name -d db_name -C backup_file_name
```

-C オプションを付けるとリストア前にデータベースを作成し、
-d オプションは、その際に接続するデータベース名を指定します。
そのため、-C オプションと併用する場合は、接続さえできればどのデータベースでもかまいません。


## !!! Backup & Restore(DB名を変える場合)

もともとのDB名と違うDBにrestoreする場合には

```
pg_dump -U db_user db_name > /pgdata/your_db_$date.sql
psql -U db_user db_name -f yourdump.dump
```
この方法を使う `C`や`c`optionでdumpを作成するとできない

# References

+ [9.4 - pg_restore](https://www.postgresql.jp/document/9.4/html/app-pgrestore.html)
