---
title: ruby percent notation - Ruby%記法
date: 2016-06-26
tags: ruby, syntax, percent
---





#  %i %I

+ symbol array
+ 要素がシンボルの配列


## %i - 式展開なし

```
p %i(1 2 3)
=> [:"1", :"2", :"3"]
```

## %I - 式展開あり

```
a, b, c = 1, 2, 3
p %I(#{a} #{b} #{c})
=> [:"1", :"2", :"3"]

# 式展開無しの場合 : %i
p %i(#{a} #{b} #{c})
[:"\#{a}", :"\#{b}", :"\#{c}"]
```
