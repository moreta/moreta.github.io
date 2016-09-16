---
title: Java exception
date: 2016-05-13
tags: java, exception
---


# runtime exception class list

| exception class               | desc                                             |
|-------------------------------|--------------------------------------------------|
| IllegalArgumentException      | パラメータ値が不適切                             |
| IllegalStateException         | メソッドの呼び出しに対してオブジェクト状態が不正 |
| UnsupportedOperationException | その操作をサポート（実装）していない             |

+ IllegalArgumentException
  + パラメータは想定してないものが来た
+ IllegalStateException
  + 読み込んだデータの値が不十分だったり
+ UnsupportedOperationException
  + interfaceなどには定義はあるけど実装してないときなど
