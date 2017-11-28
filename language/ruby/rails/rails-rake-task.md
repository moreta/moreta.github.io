---
title: rails rake task
date: 2015-01-31
tags: rails, rake, task
---

Railsの rake tasks
====================

# task一覧

```sh
rake -T
```
で確認可能

# カテゴリー別説明

## 情報表示

```sh
rake -T            # rake タスク一覧を表示
rake db:version    # 現在のDBのバージョンを表示
rake db:charset    # DBの文字コード表示
rake db:collation  # DBの照合順序を表示
rake db:sessions:clear # session情報をclear !これをするときには注意
```

## DB基礎操作

```sh
rake db:create   # database.yml の内容でデータベースを作る
rake db:test:prepare   # database.yml の内容でテスト用データベースを作る
rake db:drop     # createの逆
rake db:reset    # drop, create, schema.rb から復帰
```

### migration

options

+ VERSION
+ RAILS_ENV

```sh
rake db:migraion [VERSION=バージョン番号] [オプション]
rake db:migrate VERSION=201010190000 # 特定のバージョンのスキーマに変更
rake db:migrate RAILS_ENV=production # production環境のマイグレーション
```




### 実行されていないmigrationを表示

```sh
rake db:abort_if_pending_migrations
```

```sh
# db/migrate内のスクリプトファイルからdatabaseにテーブル作成
# db/migrate 以下にあるmigration ファイルを実行. RAILS_ENV 未指定の場合 development 環境のみに行われる.
rake db:migrate [VERSION=バージョン番号] [オプション]
rake db:migrate:down	指定したmigrationファイルのself.downメソッドを実行
rake db:migrate:redo [STEP=ステップ数]	指定したmigrationファイルのself.downメソッドを実行
rake db:migrate:reset	databaseを一度削除してもう一度作成し、db:migrate実行
rake db:migrate:up	指定したmigrationファイルのself.upメソッドを実行
```\

## db setup

```sh
# Create the database, load the schema, and initialize with the seed data (use db:reset to also drop the db first)
rake db:setup

# これと同じ
rake:db:create
rake db:schema:load # schema.rbをDBに反映
rake db:seed
```

### schema.rbよりstucture.sqlを !!

development.rbに以下を設置すると`schema.rb`の代わりに`structure.sql`が生成される
```ruby
config.active_record.schema_format = :sql
```

```sh
rake db:schema:load # databaseへ反映
rake db:schema:dump # databaseからschema.rbを生成
rake db:structure:load # databaseへ反映
rake db:structure:dump # databaseからstructure.sqlを生成
```

## routing(ルーティング)情報

```sh
rake routes #ルーティングを表示
rake routes CONTROLLER=users # usersコントローラのみのルーティングを表示
```


# generate rake file

生成

`rails g task task_name`

実行

`rake namespace:take_name`

namespaceが複数の場合

`rake namespace:namespace:take_name`

# environment

railsのなんでtaskが環境変数でinitializeされたデータを利用するためには
taskに`:environment`を入れるのをわすれずに
例えば `User.find(1)`のようなコードを利用するときにDB接続情報が環境ことにわかれているとしたら
`:environment`なきでは動かない

```
task test: :environment do
  # task
end
```


### tutorial

```
$ rails g task dummy
create  lib/tasks/dummy.rake
```

`dummy.rake`

```
namespace :dummy do

  desc 'dummyを生成する'
  task :create_dummy => :environment do |task|
    puts "run #{task.name} with env: #{Rails.env} : #{Time.now}"
    # do process
  end

end
```

```
$ rake dummy:create_dummy
run dummy_mail_message:create_dummy_message with env: development : 2015-01-31 23:06:25 +0900
```

# logging

<http://qiita.com/naoty_k/items/0be1a055932b5b461766>

+ すべてのRakeタスクの前後で、開始と終了のメッセージを表示したい。
+ 毎回出るのは鬱陶しいので、指定したときだけ表示したい。
+ いろんなところにpとかRails.logger.infoのような処理を書きたくない。

# Optional task


```ruby
task('one') do
  puts 'one'
end

task({'two' => ['one']}) do
  puts 'two'
end
```

# File task

<http://madewithenvy.com/ecosystem/articles/2013/rake-file-tasks/>

通常は rakeを使うなら`task`methodを使うけど、`file`methodもある


```ruby
file 'foo.txt' do
  touch 'foo.txt'
end
```




# References

## 参考になるコード例

+ [Rake タスクの作り方（引数を複数設定してみる）](http://qiita.com/yoshiokaCB/items/c97ba878469701c3d99b)
+ [rake file task](http://madewithenvy.com/ecosystem/articles/2013/rake-file-tasks/)
