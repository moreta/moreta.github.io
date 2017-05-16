Ruby include and extend
======================

# include and extend

+ includeはインスタンスメソッド
+ extendはクラスメソッド

## include

```rb
module Dog
  def name
    "ポチ"
  end
end
 
class Animal
  include Dog
end
 
animal = Animal.new
p animal.name
# => ポチ
```

### 制約 - classはincludeできない

classをinclude使用とすると以下のようなエラーになる。

`include': wrong argument type Class (expected Module)`

classはincludeできないから。class -> mouduleに変更してあげよう。

## extends

```rb
module Dog
  def name
    "ポチ"
  end
end
 
class Animal
  extend Dog
end
 
p Animal.name
```


# References

+ [include, extend, module_functionの違いをわかりやすくまとめてみた！](http://www.sejuku.net/blog/16046)