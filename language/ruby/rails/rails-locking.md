---
title: Rails locking
date: 2014-05-31
tags: rails, activerecord, locking
---

ブログ整理した。
以前メモったのを分離する


# Locking & Isolation level

基本知識

<http://www.atmarkit.co.jp/ait/articles/0804/04/news146.html>


## 分離レベル(ISOLATION LEVEL)

*複数トランザクション同時実行時の問題*は以下の3つがある。

*「Dirty Read」
*「Non-repeatable Read」
*「Phantom Read」


上記の3つの問題を解決するため、*4つの分離レベルがある。*

*「Serializable」
*「Repeatable Read」
*「Read Committed」
*「Read Uncommitted」


<http://d.hatena.ne.jp/language_and_engineering/20110104/p1>
<http://www.atmarkit.co.jp/ait/articles/0804/04/news146.html>
<http://www.postgresql.jp/document/9.1/html/transaction-iso.html>
<http://uzuki05.hateblo.jp/entry/2012/08/19/132703>


MYSQLだとSERIALIZABLEだとすべてのSELECT文が LOCK IN SHARE MODE として扱われる。
多分

<http://books.google.co.jp/books?id=GVzXMlJ7PLIC&pg=PA114&lpg=PA114&dq=SERIALIZABLE+%E3%81%99%E3%81%B9%E3%81%A6+LOCK+IN+SHARE+MODE&source=bl&ots=jrNbEo3Bl4&sig=N9Klpp-6iumr7IsK-HjW1EopRxk&sa=X&ei=YWg0UKW5La2hiAeEmIDADQ&ved=0CCkQ6AEwAw#v=onepage&q=SERIALIZABLE%20%E3%81%99%E3%81%B9%E3%81%A6%20LOCK%20IN%20SHARE%20MODE&f=false>


### railsでの分離レベル設定いろいろ

<http://d.hatena.ne.jp/tkrd/20131121/1385044179>


### 確認方法

postgresql

```
select current_setting('transaction_isolation');
 current_setting
-----------------
 read committed
(1 row)
```


## Locking

* <http://blog.livedoor.jp/i_am_best/archives/7692365.html>
* 画面展開をひとつのセッションでできない場合は「楽観的ロック」を使うしかない

### 悲観的(Pessimistic locking)

悲観的ロックとは、DBMSの行ロック機能（SELECT FOR UPDATE句）を利用して、並行した更新作業を制限する方法です

ロックはレコード取得時にかかるので、同時にレコードを取得しようとした場合は他方がロック解除になるまで待機するため、同時に同じレコードを取得できないようになります。

そのため楽観的ロックよりも、より厳格ですが、利用できるDBMSはPostgresかMySQLに制限されています。

#### Rails api

<http://api.rubyonrails.org/classes/ActiveRecord/Locking/Pessimistic.html>

#### ロックするタイミング

* データ取得時
* すでにロックがかかっている行の取得が制限され、ロック解除されるまで待機する

#### 仕組み

* SELECT FOR UPDATE句を使いDBMS側で行ロックする
* PostgreSQL & MySQLのみ

#### 使い方

```
# With lock paramater
account1 = Account.find(1, :lock => true)

# or With lock! Method
account2 = Account.find(1)
account2.lock!
```


### 楽観視(Optimistic locking)

楽観的ロックとは、DBMSの機能に頼らずロックバージョンをレコードに保存しておくことで、取得時と変更時にロックバージョンに変更がないか確認し、変更があった場合は例外を発生させる方法です

#### Rails api

<http://api.rubyonrails.org/classes/ActiveRecord/Locking/Optimistic.html>

#### ロックするタイミング
* データ更新時
* データを複数同時に取得することができるが、途中で更新されていた場合は、更新できない

#### 仕組み
* テーブルにlock_versionフィールドを追加する
* lock_versionが書き換わっていたらActiveRecord::StaleObjectErrorを発生させる

#### 使い方
テーブルにlock_versionを追加するだけ

```
class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.float :balance, :null => false, :default => 0
      t.integer :lock_version, :default => 0
    end
  end

  def self.down
    drop_table :accounts
  end
end
```

#### ActiveRecord::Base.lock_optimistically = false でこの機能を無効にできます。

#### locking_versionカラム名を違う名にしたい

`set_locking_column`で既定の`lock_version`というカラム名を変更できます。

```
# set_locking_column
class Client < ActiveRecord::Base
  set_locking_column :lock_client_column
end
```


# References

+ <http://kray.jp/blog/activerecord%E3%81%A7%E8%A1%8C%E3%83%AD%E3%83%83%E3%82%AF%E3%82%92%E3%81%8B%E3%81%91%E3%82%8B%E6%96%B9%E6%B3%95/>
+ <http://blogs.msdn.com/b/aonishi/archive/2013/01/26/10388513.aspx>
+ <http://akkunchoi.github.io/rails3-active-record-query-interface.html>
