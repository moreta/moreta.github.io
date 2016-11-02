---
title: AWS RDS
date: 2013-12-17
tags: aws, rds, postgres
---

## 整理

* <http://www.slideshare.net/shotamitsui/database-on-aws-jawsug-20140531>

## プロビジョンド IOPS

[READ]
(Working with Provisioned IOPS Storage)[http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.html]

## インスタンス

m2.2xlarge(メモリを最適化)

vCPU : 4
ECU : 13
memory : 34.2G

## ログ関連の設定
<http://lets.postgresql.jp/documents/technical/log_setting>


## setting sample
<https://github.com/9apps/pgRDS/blob/master/etc/postgresql/9.1/main/m2.2xlarge.conf>

```
# m2.2xlarge.conf
default_statistics_target = 50 # pgtune wizard 2012-01-30
constraint_exclusion = on # pgtune wizard 2012-01-30
checkpoint_completion_target = 0.9 # pgtune wizard 2012-01-30
checkpoint_segments = 64 # pgtune wizard 2012-01-30
max_connections = 80 # pgtune wizard 2012-01-30
maintenance_work_mem = 1GB # pgtune wizard 2012-02-14
effective_cache_size = 24GB # pgtune wizard 2012-02-14
work_mem = 208MB # pgtune wizard 2012-02-14
wal_buffers = 8MB # pgtune wizard 2012-02-14
shared_buffers = 8GB # pgtune wizard 2012-02-14
```s

## パーティショニング
<http://lets.postgresql.jp/documents/technical/partitioning/1>

## 参考

* <http://www.slideshare.net/shotamitsui/database-on-aws-jawsug-20140531>

# instance作成

# PostgreSQL DB インスタンスに接続する



# 用語

キー       | description
-----------|------------------------------------------------------------------------------------------------------------------
レイテンシ | レイテンシ (latency) とは、デバイスに対してデータ転送などを要求してから、その結果が返送されるまでの遅延時間のこと
