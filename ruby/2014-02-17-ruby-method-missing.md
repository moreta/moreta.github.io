---
title: Ruby method_missing
date: 2014-02-17
tags: ruby, metaprogramming, method_missing
---

```
class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
#    super unless %w[Bob Frank Bill].include? person
    number = 0 # ここに 0でセットしないと無限ループに入る
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end


number_of = Roulette.new
puts number_of.bob
puts number_of.frank
```

numberは blockの中でセットされるので、
blockを出たあとのnumberは self.number()として認識される。
普段だったらNoMethodErrorのはずだが、method_missingをoverrideしているため、
無限ループにはいる。


# blank slate


```
class BlankSlate

  # Hide the method named +name+ in the BlankSlate class. Don't # hide +instance_eval+ or any method beginning with "__".
  def self.hide(name)
    if instance_methods.include?(name.to_s) and name !~ /^(__|instance_eval)/
      @hidden_methods ||= {}
      @hidden_methods[name.to_sym] = instance_method(name) undef_method name
    end
  end
  instance_methods.each { |m| hide(m) }

end

```

Class that inherit directly from `BasicObject` are automatically Blank Slate.

`BasicObject` only a handful of essential methods

```
p BasicObject.instance_methods
⇒ [:==, :equal?, :!, :!=, :instance_eval, :instance_exec, :__send__]
```