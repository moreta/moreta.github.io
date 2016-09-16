---
title: Ruby OpenStruct class
date: 2014-08-14
tags: ruby, openstruct
---

## 概要

要素を動的に追加・削除できる手軽な構造体を提供するクラスです。

OpenStruct のインスタンスに対して未定義なメソッド x= を呼ぶと、 OpenStruct クラスの Object#method_missing で捕捉され、そのインスタンスに インスタンスメソッド x, x= が定義されます。 この挙動によって要素を動的に変更できる構造体として働きます。

```
require 'ostruct'
ab = OpenStruct.new
ab.foo = 25
p ab.foo          # => 25
ab.bar = 2
p ab.bar          # => 2
p ab              # => <OpenStruct foo=25, bar=2>
ab.delete_field("foo")
p ab.foo          # => nil
p ab              # => <OpenStruct bar=2>
```

初期化にハッシュを使用することもできます。

```
son = OpenStruct.new({ :name => "Thomas", :age => 3 })
p son.name        # => "Thomas"
p son.age         # => 3
son.age += 1
p son.age         # => 4
son.items = ["candy","toy"]
p son.items       # => ["candy","toy"]
p son             # => #<OpenStruct name="Thomas", age=4, items=["candy", "toy"]>
```