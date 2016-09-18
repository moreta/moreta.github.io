---
title: Database sharding
date: 2014-06-08
tags: database, sharding
---


# shardingとpartitioninigとの違い

* <http://www.quora.com/Whats-the-difference-between-sharding-and-partition>
* <http://theeye.pe.kr/archives/1917>

ShardingはHorizontal Partitioningと同じ
例えば 1~ 10000までは A-shardに 100001~20000までは B-shardのように

*Horizontal Partitioning*
![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-08/horizontal_partitioning.png)



*Vertical Partitioning*
![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-08/vertical_partitioning.png)


# instagramのIDシャーディング

<http://siguniang.wordpress.com/2013/01/23/sharding-ids-at-instagram/>


![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-08/instagram-digit.png)

* Timestamp領域 : 41 bit のカスタム epoch からのミリ秒のタイムスタンプ(2^41 ≒ 70年)
* Shard Id領域 : 13 bit のシャードID(2^13 = 8192)
* Increment領域 : 10 bit のシーケンス(2^10 = 1024)


# 参考

* <http://hanburn.tistory.com/106>
* <http://www.quora.com/Whats-the-difference-between-sharding-and-partition>
* <http://theeye.pe.kr/archives/1917
* <http://instagram-engineering.tumblr.com/post/10853187575/sharding-ids-at-instagram>
* <http://siguniang.wordpress.com/2013/01/23/sharding-ids-at-instagram/>