---
title: Rails Performance
date: 2013-12-17
tags: ruby, rails, performance, tuning
---



# postgres

<http://lets.postgresql.jp/map/tuning>

## tuning流れ

1. 情報収集と分析

* ログ設定
<http://lets.postgresql.jp/documents/technical/log_setting>

2. チューニングの実施
3. 繰り返し or 完了の判断



## ハードウェア構成の見直し

## 概要

* 1テーブルのサイズが大きすぎるとキャッシュ効率が落ち
* 1テーブルのサイズが大きときには [パーティショニング](http://lets.postgresql.jp/documents/technical/partitioning/1)
* 利用されないインデックスは更新処理を遅くするだけなので、削除すべきです
* [テキスト検査の方法とインデックス](http://lets.postgresql.jp/documents/technical/text-processing/3/)
* shared_buffers は搭載メモリの 20% 程度が目安になります。

## memory & max connections

接続時に消費する最大メモリの見積もりは, 以下の式で算出できます。
`postmaster のサイズ × max_connections`


## cached

### Cache Store

*Page cachedはいつもdiskに保存する。*
Page caches are always stored on disk

他

```
#defautはActiveSupport::Cache::FileStore
config.cache_store = :memory_store, { size: 64.megabytes }
```


<http://hima-j.in/rails/rails-cache-fetch/>

### Low level caching

``` ruby
#product.rb

def Product.out_of_stock
  Rails.cache.fetch("out_of_stock_products", :expires_in => 5.minutes) do
    Product.all.joins(:inventory).conditions.where("inventory.quantity = 0")
  end
end

def competing_price
  Rails.cache.fetch("/product/#{id}-#{updated_at}/comp_price", :expires_in => 12.hours) do
    Competitor::API.find_price(id)
  end
end
```


#### with query string

<http://veerasundaravel.wordpress.com/2012/10/10/rails-caching-with-query-parameters/>

``` ruby
Rails.cache.fetch(Digest::SHA1.hexdigest(params.sort.flatten.join("_")), object)
#It will modify the cache key as follows:
Rails.cache.fetch('5c059024747e813d0fa5ec8fab890be473eab63a', object)
```

*でもこれよりは gem 'cache_digest'を使おう*

<http://www.codebeerstartups.com/2013/02/how-to-implement-action-caching-in-ruby-on-rails-with-ajax-enabled>

#### with query string and format

<http://icelab.com.au/articles/rails-action-caching-with-query-strings-and-formats/>

#### 独自 expire code

<http://benhollis.net/blog/2010/01/30/simple-expiring-caching-for-ruby-on-rails/>


### subquery

<http://stackoverflow.com/questions/5483407/subqueries-in-activerecord>


### BAD practice

##### 参考
cacheで objectまること保存するのは良くない。
例えばDBのカラム変更や、データの変更の際にエラーが発生することもあうｒ．
primitive系で保存するようにしよう。
primary_keyなどを保存するのがいいかも

<http://stackoverflow.com/questions/11218917/confusion-caching-active-record-queries-with-rails-cache-fetch/11221230#11221230>
`User.where('status = 1').limit(1000)`

returns an ActiveRecord::Relation which is actually a scope, not a query. Rails caches the scope.

If you want to cache the query, you need to use a query method at the end, such as #all.

```
Rails.cache.fetch(key) do
  User.where('status = 1').limit(1000).all
end
```
Please note that it's never a good idea to cache ActiveRecord objects. Caching an object may result in inconsistent states and values. You should always cache primitive objects, when applicable. In this case, consider to cache the ids.

```
ids = Rails.cache.fetch(key) do
  User.where('status = 1').limit(1000).pluck(:id)
end
User.find(ids)
```


## sql

<http://blog.degita.net/entry/2013/02/20/42>

### DBへの問い合わせを監視

`tail -f log/development.log | grep "load"`

取得する行数にもよりますが、正常にindexが使われていれば大体2ms〜10msしかかかりません。200msや400ms(もしくはそれ以上)かかっているクエリがあったらそれは何かまずい方法をとっている可能性が高いので調べるべきです。

### クエリをソートして表示

`grep "Completed" development.log | sort -nr -k 10 | head -10`