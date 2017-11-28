---
title: Rails3
date: 2013-12-18
tags: rails3
---

## rails casts

<http://railscasts.com/episodes/318-upgrading-to-rails-3-2?language=ja&view=asciicast>



## EXPLAINクエリ

```
# Log the query plan for queries taking more than this (works
# with SQLite, MySQL, and PostgreSQL)
config.active_record.auto_explain_threshold_in_seconds = 0.5
```


## 新しいActiveRecordメソッド


*列名を渡すとその列のすべての値が返されます*

`Product.pluck(:name)`

*select節を用いて返される列を制限する*場合は新たにuniqメソッドを利用できます。例えばこれを用いて、商品をユニークな名前ごとに一つずつ返すことができます

`Product.select(:name).uniq`


*Key-Valueストア*


*タグ付きログ*
