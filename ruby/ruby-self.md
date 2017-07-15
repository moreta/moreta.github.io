
Rubyでのself
===================

<http://blog.honeybadger.io/ruby-self-cheat-sheet/>


# extend self

以下のように書き方は
instance methodも class methodを定義される

```rb
module Bar
  extend self

  def method1 ; end
  def method2 ; end
end

puts "-- instance methods"
puts Bar.instance_methods.grep(/method\d/)

puts "-- private instance methods"
puts Bar.private_instance_methods.grep(/method\d/)

puts "-- singleton methods"
puts Bar.singleton_methods.grep(/method\d/)
```

```rb
-- instance methods
method1
method2
-- private instance methods
-- singleton methods
method1
method2
```