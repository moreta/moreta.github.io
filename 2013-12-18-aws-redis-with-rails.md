---
title: AWS Redis with Rails
date: 2013-12-18
tags: aws, redis, rails
---


# basic 

* シングルスレットなので全てのデータ操作は**排他的**
* 複数のコマンドを一回で実行可能
* 5種類のデータ型がある。
* master-slave replication 

## メモリを使いきった場合

５つのパターンから設定可能

`maxmemory-policy`

*メモリオーバー時の削除ルール*
 
1. LRUアルゴリズムを使用し、期限切れになったキーを削除 
2. LRCアルゴリズムに従い、どれかのキーを削除 
3. 期限切れになったセットの中から、ランダムにキーを削除 
4. どれかのキーをランダムに削除 
5. 一番期限に近いキーから削除 

※LRUアルゴリズム →未使用の時間が最も長いデータを抽出する。

## replication


* MASTER-SLAVEのレプリケーション構築が可能
* MASTERは複数のslaveを設定できる。
* Redisのレプリケーションは非同期 -> master-slaveでデータの差分がでることがある。 -> データの特性によって参照先の選択が必要

## データ永続化

### SAVE/BGSAVE

redis -> RDB(Redis database)へ

### AOF(Append Only File)

redis  コマンド-> AOF



## 参考

* <http://www.slideshare.net/yujiotani16/redis-26851700>

# redis install for local

2015-12-15-redisを参考


# rails


## gem 

[redis-objects](https://github.com/nateware/redis-objects)
[redis-namespace](https://github.com/resque/redis-namespace)

## 設定

`config/initializers/redis.rb`

`Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)`

## redis-object 使い方
 
<http://blog.happyelements.co.jp/2013/05/ruby-on-rails-redis-objects.html>

## redis-namespace 

<http://qiita.com/ichi_s/items/e36b0891c6ca9a9a58f9>

ローカルで開発してて、立ち上げてるredisは1つだけで複数のプロジェクトでredis使ってるなんて時に、
もしも他プロジェクトとモデル名とキー名がかぶると面倒なことになっちゃいます。

redisのdb機能を使うって手`Redis.new(:host => '127.0.0.1', :port => 6379, :db => 1)`もあるんですが、
数字でしか指定できないので「今までのプロジェクトで何番まで使ってるけ？」みたいなことになりかねないんじゃないかと。


```
r = Redis::Namespace.new(:ns, :redis => @r)
r['foo'] = 1000
```

```
$ redis-cli
redis 127.0.0.1:6379> GET ns:foo
"1000"
```

### 設定 config/initializers/redis.rb 

```
namespace = [Rails.application.class.parent_name, Rails.env].join ':'
Redis.current = Redis::Namespace.new(namespace,
  :redis => Redis.new(:host => '127.0.0.1', :port => 6379))
```



## その他 cache store

<https://coderwall.com/p/aazriw>

`config/environment/[Rails.env].rb`
```
config.cache_store = :redis_store, 'redis://localhost:6379/'
```




# rails session, cache, http cache用

<https://github.com/redis-store/redis-rails>

`gem 'redis-rails' # Will install several other redis-* gems`


# config

`redis 127.0.0.1:6379 > CONFIG SET timeout 1800`


# 参考

* <http://www.slideshare.net/AmazonWebServicesJapan/aws-amazon-elast>
* <http://techlife.cookpad.com/2014/05/22/elasticache-for-redis/>
* <http://www.slideshare.net/shimy_net/amazon-elasticache-23314762>
* <http://techlife.cookpad.com/presentations/>

# 用語

### キャッシュノード

キャッシュノードとは、Amazon ElastiCache のデプロイにおける最小の構成要素


# ecに直接 install

<http://qiita.com/stoshiya/items/b8c1d2eb41770f92ffcf>

Amazon Linux AMIならgccとかインストールしなくても次のコマンドでインストールが終わる．

`sudo yum --enablerepo=epel install redis`
epelだとバージョンが古いので，remiを使うとよい．

```
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo yum --enablerepo=remi install redis
```
