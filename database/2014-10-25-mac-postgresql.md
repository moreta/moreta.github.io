---
title: Postgresql mac install
date: 2014-10-25
tags: mac, postgresql
---


# Install

```
brew install postgresql
```

brewを利用して特定versionをインストールしたいなら
```
cd /usr/local/Library/Formula/
brew versions postgresql
# 9.3.1    git checkout 89b2d08 /usr/local/Library/Formula/postgresql.rb
# 9.3.0    git checkout ae59e09 /usr/local/Library/Formula/postgresql.rb
# 9.2.4    git checkout e3ac215 /usr/local/Library/Formula/postgresql.rb
git checkout e3ac215 /usr/local/Library/Formula/postgresql.rb
brew install postgres
```

### Initialize database cluster

```
initdb /usr/local/var/postgres -E utf8
```


### Run postgres

```
postgres -D /usr/local/var/postgres
```

#### demonとl logファイルを設定して起動したい場合

```
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```


#### ログインした時に自動で起動したいなら

```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

### create user

nomal user

+ -d : create db

```
createuser -d -P
# 必要によって postgresユーザーでしないとだめな場合がある
createuser -d -P -U postgres
```

super user

`createuser -s username`

### user password変更

```
psql -U postgres postgres
postgres=# ALTER USER ユーザ名 WITH PASSWORD '新しいパスワード';
ALTER ROLE
```

### create db

```
createdb --help
createdb dbname -U username
```

## Postgres.appを利用したインストール


download from http://postgresapp.com/

and run

### setting command line

.bash_profile
`export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin`


### run postgres.app

自動で起動する

最初に起動すると以下の処理が自動に走る

* Initialise a database cluster: initdb -D DATA_DIRECTORY -EUTF-8 --locale=XX_XX.UTF-8
* Start the server: pg_ctl start -D DATA_DIRECTORY -w -l DATA_DIRECTORY/postgres-server.log
* Create a user database: createdb USERNAME

The default DATA_DIRECTORY is `/Users/USERNAME/Library/Application Support/Postgres/var-9.X`

### stop

`quit postgresq.app`

or

`pg_ctl stop -w -D DATA_DIRECTORY`

### pg adminが入ってないので別でダウンロード

<http://pgadmin.org/>


## MacでのGem pgのインストール for RUBY

もし既にpgをインストール済なら一度削除(gem uninstall pg)して下さい。


### brewでインストールした場合

```
brew info postgresql
> If you want to install the postgres gem, including ARCHFLAGS is recommended:
> env ARCHFLAGS="-arch x86_64" gem install pg
```
このようなメッセージがある

なので以下の方法でpg gemをインストールする

`env ARCHFLAGS="-arch x86_64" gem install pg`

### postgres.appでインストールした場合

`gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config`

## Remove existing postgresql

### Homebrew uninstall

```
brew remove postgresql
```

### Postgres.app uninstall

```
Quit Postgres.app
Drag Postgres.app to the Trash
Delete the data directory (default location: ~/Library/Application Support/Postgres/var-9.3)
```

## FATAL: no pg_hba.conf entry for host “fe80::1%lo0”

いつのまにか上記のようなエラーが発生した。

`/etc/hosts`をみたら

`fe80::1%lo0    localhost`
のような部分が勝手に追加されている。mac Yosemiteの勝手に入れたよう。
エラーを上記ののもをcomment outすることおで解決

<http://stackoverflow.com/questions/23348774/fatal-no-pg-hba-conf-entry-for-host-fe801lo0>

## Console Util - Pgcli

`brew install pgcli`

`pgcli -h localhost -U postgres db_name`

## 参照

* <http://marcinkubala.wordpress.com/2013/11/11/postgresql-on-os-x-mavericks/>
* <http://morizyun.github.io/blog/postgresql-mac-centos-rails/>
