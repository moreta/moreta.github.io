---
title: Redmine with postgres
date: 2014-09-23
tags: redmine, issue
---

個人用で利用するのをインストールをまとめる。

defaultと違って、postgresqlとnginx+passengerを使う。


### postgresql インストール

#### service auto start
    
```
chkconfig --list | grep postgres
chkconfig postgresql on
chkconfig --list postgresql
```

### init db & start

defaultは`/var/lib/pgsql9/data`

locale & enoding設定
```
emacs /etc/init.d/postgresql
# line 195を以下のように修正
$SU -l postgres -c "$PGENGINE/initdb --pgdata='$PGDATA' --auth='ident' --encoding=UTF-8 --locale=ja_JP.UTF-8" >> "$PGLOG" 2>&1 < /dev/null
```

```
service postgresql initdb
service postgresql start
or 
/etc/init.d/postgresql start
```

#### 手動でする場合 initdb

```
su postgres
initdb -D /pgdata --encoding=UTF-8 --locale=ja_JP.UTF-8
postgres -D /pgdata
```

#### 手動でする場合 start

postgresql init.d ファイルを修正
emacs /etc/init.d/postgresql

```
# 以下の２つをコメントアウト
#PGDATA=/var/lib/pgsql9/data                                                                                                                                                                                                                                                                                      
#PGLOG=/var/lib/pgsql9/pgstartup.log
# これに変更する
PGDATA=/pgdata # for custom 
PGLOG=/pgdata/pgstartup.log
```

```
sudo su
/etc/init.d/postgresql start
```

#### postgresql.conf

`listen_addresses = '*'`

#### pg_hba.confで認証を変更

`host    all             all             0.0.0.0/0               trust`

### nginx+passenger インストール

passenger gemでインストールする。


### db生成とユーザ生成
PostgreSQLの場合:

```
> su postgres
> psql postgres
CREATE ROLE redmine LOGIN ENCRYPTED PASSWORD 'redmine' NOINHERIT VALID UNTIL 'infinity';
CREATE DATABASE redmine WITH ENCODING='UTF8' OWNER=redmine;
```

### redmine download

`wget http://www.redmine.org/releases/redmine-2.5.2.tar.gz`
or
`curl -O http://www.redmine.org/releases/redmine-2.5.2.tar.gz`

```
tar xvf redmine-2.5.2.tar.gz
mv redmine-2.5.2 redmine
cd redmine
```

### database設定

config/database.example.yml をコピーして config/database.yml を作成してください。 
config/database.yml を編集し、"production"環境用のデータベース設定を行ってください。


#### database.yml.exampleを参考にして書けば大丈夫
PostgreSQLを使用する場合の例(デフォルトのポート):

````
production:
  adapter: postgresql
  database: redmine
  host: localhost
  username: redmine
  password: redmine
````

ここまで、したが、sqlite3を使うことにする


## 参考

* <http://blog.redmine.jp/articles/2_5/installation_centos/>
* <http://redmine.jp/guide/RedmineInstall/>


