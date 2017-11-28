Ruby include and extend and inheritacne
======================================

# include and extend and inheritacne

+ includeはインスタンスメソッドとしてmoduleを追加
+ extendはクラスメソッドとしてmoduleを追加
+ inheritance(<)は

# syntax

## include



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

**classをinclude使用**すると以下のような**エラー**になる。

`include': wrong argument type Class (expected Module)`

classはincludeできないから。class -> mouduleに変更してあげよう。


## 同じmethodをoverrideした場合

```rb
module Foo
  def say
    puts 'foo'
  end
end
class Bar
  include Foo
  def say
    puts 'bar'
  end
end

bar = Bar.new
bar.say
# pry(main)> bar.say
# bar
# => nil
```

superでoverrideすると

```rb
module Foo
  def say
    puts 'foo'
  end
end
class Bar
  include Foo
  def say
    super # ここをsuperを定義
    puts 'bar'
  end
end

bar = Bar.new
bar.say
# pry(main)> bar.say
# foo
# bar
# => nil
```

# extends

```rb
module Dog
  def name
    "ポチ"
  end
end
 
class Animal
  extend Dog
end
 
p Animal.name # class methodが追加される
```

## 同じmethodをoverrideした場合


```rb
module Foo
  def say
    puts 'foo'
  end
end
class Bar
  include Foo
  def say
    puts 'bar'
  end
end

bar = Bar.new
bar.say
# pry(main)> bar.say
# bar
# => nil
```

superでoverrideすると

```rb
module Foo
  def say
    puts 'foo'
  end
end
class Bar
  include Foo
  def say
    super # ここをsuperを定義
    puts 'bar'
  end
end

bar = Bar.new
bar.say
# pry(main)> bar.say
# foo
# bar
# => nil
```


# References

+ [include, extend, module_functionの違いをわかりやすくまとめてみた！](http://www.sejuku.net/blog/16046)
+ [superを使って継承/Include/Extendしたメソッドをオーバーライド](https://qiita.com/metheglin/items/ff877fdfe5dd1fd965e2)