---
title: Ruby Splat Operator
date: 2016-07-29
tags: ruby, operator, splat, array
---


# 配列の変換する - Array Coercion


```ruby
string = *"string"
p string #=> ["string"]

symbol = *:symbol
p symbol #=> [:symbol]

hash = *{ hash: nil }
p hash #=> [[:hash, nil]]

range = *(1..10)
p range #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

ほか array coercion
```ruby
a = *"Hello"  #=> ["Hello"]
"Hello".to_a  #=> NoMethodError: undefined method `to_a' for "Hello":String
a = *(1..3)   #=> [1, 2, 3]
a = *[1,2,3]  #=> [1, 2, 3]
```



# References

+ [ここまで出来る！RubyのSplat Operatorまとめ](http://alpaca.tc/blog/ruby/how-to-use-star.html)
+ [The Strange Ruby Splat](https://endofline.wordpress.com/2011/01/21/the-strange-ruby-splat/)
