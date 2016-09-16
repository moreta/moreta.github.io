---
title: AWS Elasticache
date: 2014-06-10
tags: aws, cache, redis, elasticache
---

# security group

# 接続

endpoint情報で接続

`redis-cli -h your-endpoint-address.amazonaws.com -p 6379`


## Redis CLI

* <http://redis.io/commands>
* <http://redis.shibu.jp/genindex.html>


```
Amazon ElastiCache は、以下のメモリタイプのキャッシュノードをサポートしています。

cache.t1.micro: 213 MB
cache.m1.small: 1.3 GB
cache.m1.medium: 3.35 GB
cache.m1.large: 7.1 GB
cache.m1.xlarge: 14.6 GB
cache.m2.xlarge: 16.7 GB
cache.m2.2xlarge: 33.8 GB
cache.m2.4xlarge: 68 GB
cache.c1.xlarge: 6.6 GB
次のノードは、Memcached でのみ使用できます。

cache.m3.xlarge: 14.6 GB
cache.m3.2xlarge: 29.6 GB
```

# アクセス

## EC2の外ではアクセスできない

自分のlocal machine(aka my laptop)ではアクセスできないから
localの開発には別のredisに接続するかlocalにインストールして利用すること

<https://forums.aws.amazon.com/thread.jspa?threadID=74827>

<http://aws.amazon.com/jp/elasticache/faqs/#Can_I_access_Amazon_ElastiCache_from_outside_AWS>
Q: 自社のデータセンターで実行されるプログラムから Amazon ElastiCache にアクセスできますか?

いいえ。現在、ElastiCache クラスタへのすべてのクライアントは、Amazon EC2 ネットワーク内にある必要があり、ここで説明するセキュリティグループを介して認可されていなければなりません。


## TODO

ここ読んでおく
* <http://aws.amazon.com/jp/elasticache/faqs/>
* <http://kentana20.hatenablog.com/entry/2014/05/06/182119>