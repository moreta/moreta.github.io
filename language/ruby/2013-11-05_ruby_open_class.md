---
title: Ruby Open Class & Monkey patch
date: 2013-11-05
tags: ruby, class
---


# OPEN Class

* 以下のように既存のClassを再度OPENしてメソッドを追加することができる。
* これはClassを再定義することでなく、再度開いくのだ、

``` ruby
class Array
  def replace(from, to)
    each_with_index do |e, i|
      self[i] = to if e == from
    end
  end
end
```

でも、Arrayにはすでにreplaceのメソッドが定義されている。
なのでこれはバグを起こす。このようなコードをMonkeypatchと呼ぶ

## Monkeypatch

*Arrayクラスのメソッド確認*

`[].methods.grep /^re/  # => [:replace, :reject, :reject!, :respond_to?, ...`

なので、上記の`Array#replace()`のカスタムメソッドは`Array#substiute()`に変更し、名の重複を回避する必要がある。