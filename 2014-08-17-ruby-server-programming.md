---
title: ruby gserver - server programming
date: 2014-08-17
tags: ruby, server-programming
---

# gserver

## join

サーバのサービスを実行しているスレッドを `Thread#join` する。

### Thread#join

スレッドselfの実行が終了するまで、カレントスレッドを停止します。
selfが例外により終了していれば、その例外がカレントスレッドに対して発生します。
limit を指定して、limit 秒過ぎても自身が終了しない場合、nil を返します。

