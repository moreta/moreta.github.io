
Ruby arary cover? and include?
==============================

# 範囲ないなのか? cover?

```ruby
# たとえ、railsのlengh validationを
validates :username, length: {within: 10..100}


 (10..100).cover? username.length
```


# 属しているのか？ include?


http://qiita.com/murayama/items/bbd9237ccc88ceba49b1