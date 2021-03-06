---
title: Rails Activerecord
date: 2013-12-24
tags: rails, activerecord, compare, transaction, lock
---



# railsでactiveを使用しない。

<http://stackoverflow.com/questions/19078044/disable-activerecord-for-rails-4>

1. Gemfileから database adapter gemsを削除  (mysql2, sqlite3, pg etc..)
2. 設定修正

`config/application.rb`

```
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"
```

3. database.yml削除 db/schema.rb削除 and migrations fileもあったら削除

4. Delete migration check in test/test_helper.rb

5. Delete any ActiveRecord configuration from your config/environments files (this is what is causing your error)


# migration

sample
`rails g migration AddNameToUsers name:string`


## pluck と includes

pluckとincludesは antitheticalな関係だ



## ２つの値の比較

Compare each value of two ActiveRecords returning a boolean variable

<http://stackoverflow.com/questions/4752663/compare-each-value-of-two-activerecords-returning-a-boolean-variable>


`account1.attributes.except('id') == account2.attributes.except('id')`

account1.attributesは

## How to use ActiveRecord without Rails(activerecordだけ利用したい)

<http://snippets.aktagon.com/snippets/257-how-to-use-activerecord-without-rails>

```ruby
require 'active_record'
require 'sqlite3'
require 'logger'

ActiveRecord::Base.logger = Logger.new('debug.log')
ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))
ActiveRecord::Base.establish_connection :development

class Schema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :state
    end

    add_index :users, :name
  end
end

Schema.new.change

class User < ActiveRecord::Base

end

```

database.yml:

```yml
development:
  adapter: sqlite3
  database: db/data.sqlite3
  pool: 5
  timeout: 5000
```

## yml file load

`ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))`

この部分だが、相対パスで指定したときがある。

`File.expand_path('../../db/database.yml', __FILE__)`

これでファイルを相対パス指定で取得できるが、さらに`IO.read`を使うと長いので、

`YAML::load_file`を利用したほうがいい。

`ActiveRecord::Base.configurations = YAML::load_file(File.expand_path('../../db/database.yml', __FILE__))`


## gem pg と nokogiri 関連エラー

`export DYLD_LIBRARY_PATH=${PG_HOME}/lib:$DYLD_LIBRARY_PATH # for pg gem error & gem nokogiri`


# error message


```sh
@user.save
@user.errors.full_messages
```

# 大量データのselect

## find と find_each

* find: 全データをメモリに展開してから処理
* find_each: 少しずつデータをメモリに展開しつつ処理

## find_eachとfind_in_batches

* find_each: 取ってきたデータは1件ずつ処理 (yield) される
* find_in_batches: 取ってきたデータは配列でまとめて処理 (yield) される

# Bulk insert

[activerecord importを利用](https://github.com/zdennis/activerecord-import)

```ruby
CSV.open("hogehoge.csv", "wb").each_with_index do |row, i|

   # 配列にtmp_recordを挿入
   tmp_records << TmpRecord.new(hoge: row[0], fuga: row[1])

   # 1000件毎にBULK INSERT
   if i % 1000 == 0 && i.nonzero?
     TmpRecord.import(tmp_records)
     tmp_records = []
   end
 end
```


# References

+ [Railsで大量のデータを更新してみる](http://qiita.com/soudai_s/items/b8b7a34ed23693cb6950)
+ [ActiveRecordで複数レコード、BULK INSERTする方法とパフォーマンスについて](http://qiita.com/xend/items/79184ded56158ea1b97a)
