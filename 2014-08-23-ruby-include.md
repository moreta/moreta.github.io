---
title: ruby include
date: 2014-08-23
tags: ruby, include
---

## include

### 制約

classをinclude使用とすると以下のようなエラーになる。

`include': wrong argument type Class (expected Module)`

classはincludeできないから。class -> mouduleに変更してあげよう。