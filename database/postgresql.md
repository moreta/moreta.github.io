---
title: Postgresql on CentOS
date: 2013-12-17
tags: db, postgresql
---

# Install

## Mac install

See : 2014-10-25-mac-postgresql.md

## CentOS install


```sh
# 9.1
yum install postgresql postgresql-contrib postgresql-devel postgresql-server postgresql-odbc postgresql-jdbc
# 9.2
yum install postgresql9* postgresql-odbc postgresql-jdbc
```


## もし、clientだけインストールする場合には以下を

```sh
yum install postgresql-devel
# or
yum install postgresql9-devel
```


### service auto startに登録

```sh
chkconfig --list | grep postgres
chkconfig postgresql on
chkconfig --list postgresql
```

### init db & start

defaultは`/var/lib/pgsql9/data`

```sh
service postgresql initdb
service postgresql start
or
/etc/init.d/postgresql start
```

#### 手動でする場合 initdb

```sh
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

### initial config

awsを使うならセキュリティはsecurity groupで行うので、

テスト用では全部許可する。

#### postgresql.conf

`listen_addresses = '*'`

または許可するipだけ。defaultはlocalhost

#### pg_hba.confで認証を変更

[認証の種類について](https://www.postgresql.jp/document/9.1/html/auth-methods.html)


```
# host    all             all             0.0.0.0/0               peer
host    all             all             0.0.0.0/0               trust
# or you can use
# "trust", "reject", "md5", "password", "gss", "sspi", "krb5", "ident", "peer", "pam", "ldap", "radius" or "cert"
# md5が一般的かな

```

### start & stop

`/etc/init.d/postgresql start | restart | stop`


## テーブル一覧取得

`\d`

または
```sql
SELECT
  relname AS table_name
FROM
  pg_stat_user_tables
```

## カラム名一覧

テーブル一つ。これなら`\d`を使ったほうが、、

```sql
SELECT  *
FROM information_schema.columns
WHERE  table_name = 'テーブル名'
ORDER BY ordinal_position
```

全テーブル

```sql
SELECT  table_catalog, table_schema, table_name, column_name, ordinal_position
FROM  information_schema.columns
ORDER BY table_name, ordinal_position
```

全テーブルのなかで特定カラム

```sql
SELECT  table_catalog, table_schema, table_name, column_name, ordinal_position
FROM  information_schema.columns
where column_name like '%lock_version%'
ORDER BY table_name, ordinal_position;
```




# INDEX

## tuning

<http://www.techscore.com/blog/2014/12/04/postgresql%E3%81%A7%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%8A%B9%E7%8E%87%E9%AB%98%E3%81%8F%E5%88%A9%E7%94%A8%E3%81%97%E3%82%88%E3%81%86/>

## indexの作成


```
CREATE [ UNIQUE ] INDEX name ON table [ USING method ]
    ( { column | ( expression ) } [ opclass ] [, ...] )
    [ TABLESPACE tablespace ]
    [ WHERE predicate ]
```

`CREATE INDEX index_name ON table_name (column_name);`


### 該当カラムに対してインデックスを作成

特定済みのカラムに対して，インデックスを作成する。
それらのカラムに対する検索処理が，素早くなる。

`CREATE INDEX インデックス名 ON テーブル名 ( カラム名 );`


WHERE句内に複数のカラムがAND条件で結合している場合，複合インデックス：

`CREATE INDEX インデックス名 ON テーブル名 ( カラム名1, カラム名2 );`

`DROP INDEX インデックス名`


### Partial Indexes

A partial index covers just a subset of a table’s data. It is an index with a WHERE clause. The idea is to increase the efficiency of the index by reducing its size. A smaller index takes less storage, is easier to maintain, and is faster to scan.

flaggedがTRUEのarticlesを探すとき

`CREATE INDEX articles_flagged_created_at_index ON articles(created_at) WHERE flagged IS TRUE;`

### Expression Index

`CREATE INDEX users_lower_email ON users(lower(email));`

### B-Trees and sorting

B-Tree index entries are sorted in ascending order by default. In some cases it makes sense to supply a different sort order for an index. Take the case when you’re showing a paginated list of articles, sorted by most recent published first. We may have a published_at column on our articles table. For unpublished articles, the published_at value is NULL.

ソースと同じ方向でindexを作ることによって早く取得できる。

`CREATE INDEX articles_published_at_index ON articles(published_at DESC NULLS LAST);`

### Index only scan

代表的なスキャンの「シーケンシャルスキャン」「インデックススキャン」「ビットマップスキャン」
以外に 9.2からインデックススキャンが追加された




## 実行プラン(EXPLAIN)

### 読み方

* テーブルスキャンした結果、あるいはその他の演算子の結果は、すべて上位に渡される
* すべての演算子や入力セットを受け取り、最上位のノードに辿り付くまで上位の演算子に渡していく。
* 親ノードは子ノードのコストを受け取る。
* InitPlansとSubplansは福生と言わせの際に使われる。

### 「rows」「width」は，返却されるレコードに関する情報


costの単位は時間ではなく，オプティマイザがプラン選択する際の指標である
rowsは返却されるレコード数の推定値
widthは返却されるレコードの長さ（データサイズ）
seq scan撲滅を目指せ
不要ソートを撲滅せよ

#### rows

* 推定された行数を表示する。
* PostgreSQL8.0以前では、一度もVACUUM/ANALYZEされていないテーブルについては1000行がデフォルト
* 実際のrowと大きくかけ離れている場合には、VACUUM、あるいはANALYZEをすべき。

### cost=(スタートアップコスト)..(トータルコスト)

最初の数字が、最初の行が返されるまでの時間、次の数字が全ての行が返されるまでの合計時間




### プラン演算子

#### Seq Scan.

全行スキャンするので、レコードの多いテーブルには不向きです。

#### Index Scan

IndexはIndex情報をツリー上に格納しています。
検索条件に合うインデックスがあれば、インデックスを探索します。
対象のデータが見つかれば、該当の行にアクセスしてデータを返します

*Nested Loop*


#### Merge Join

#### Hash Join


## パーティショニング

パーティショニング : データを複数に分割して格納する

### テーブル間の分割

巨大なテーブルを複数のテーブルに分割します。単純に複数のテーブルに分けて格納するだけでも効果はありますが、PostgreSQL は複数のパーティションを1つのテーブルとして見せる機能を持っており、この機能を使うとアプリケーションからはテーブルがどのように分割されているかを意識する必要が無くなります。この記事ではこちらを扱います。

#### レンジ・パーティショニング
値の範囲、または期間の範囲(月単位とか)


# Drop Database

```
dropdb database_name -U username
dropdb test -U postgres
```

# Setting

設定ファイルは基本的にはインストール際に指定した`data` folderに入っている

## mac

### port番号の変更
postgresql.conf

`port 5432`

### 接続設定
pg_hba.conf

`local   all             all                                     trust`



# Init DB

* initdbする際にそのfolderにファイルなどがあるとエラーになるので、mountで生成された /pgdata/lost+foundを削除する。
* initdb する前に <http://lets.postgresql.jp/documents/technical/text-processing/2> これを読むこと！
* encodingとlocaleの設定を忘れずに


```sh
rm -rf /pgdata/lost+found
chown -R postgres:postgres /pgdata

# postgres user password
passwd postgres
>> postgres
```

# init db
initdb -D /pgdata --encoding=UTF-8 --locale=ja_JP.UTF-8

#以下のようなエラーがでる。postgresユーザで実行する必要がある。
initdb: cannot be run as root
Please log in (using, e.g., "su") as the (unprivileged) user that will
own the server process.

# init db retry

```sh
su postgres
initdb -D /pgdata --encoding=UTF-8 --locale=ja_JP.UTF-8

...
Success. You can now start the database server using:

postgres -D /pgdata
or
pg_ctl -D /pgdata -l logfile start
```

# Start & Stop

`pg_ctl start -D /pgdata`

# 参考

* <http://www.atmarkit.co.jp/ait/articles/1307/12/news004.html>
* [Heroku -Postgresql Index(Expression Indexes含む)](https://devcenter.heroku.com/articles/postgresql-indexes)
* <http://lets.postgresql.jp/documents/technical/query_tuning/>
* <http://d.hatena.ne.jp/language_and_engineering/20110121/p1>
* <http://www.dbonline.jp/postgresql/index/index1.html>
* <http://www.techscore.com/blog/2013/06/07/postgresql-index-only-scan-%E5%A5%AE%E9%97%98%E8%A8%98-%E3%81%9D%E3%81%AE3/>
* (パーティショニング : 用途と利点)[http://lets.postgresql.jp/documents/technical/partitioning/1]
