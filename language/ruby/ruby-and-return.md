

Railsのcontrollerのmethodで early returnするときに

ここの例のようで

```rb
def example
  if xxx.valid?
    return # early return
  end
end
```
することができる

ほかに、

```rb
class Controller1 < ApplicationController
  def method1
    if something
      redirect_to edit_x_path(@object) and return
    end

    if something_else
      redirect_to index_path(@object) and return
    end
    # Code
    # Code
    #....etc
  end
end
```

のように and returnがある

# `and` は？

`and`は **lower precedence**

つまり、method callより優先順位が低いため、 
前のコードが成功した場合 and 以下は実行しない

# `&&` は？

`&&`は **higher precedence**

通常のif分で

```rb
if A && B
```
の場合 AとBは全部評価される

# References

+ [Ruby: “&& return” vs “and return”](https://stackoverflow.com/questions/39629976/ruby-return-vs-and-return)
+ [Difference between “and” and && in Ruby?](https://stackoverflow.com/questions/1426826/difference-between-and-and-in-ruby)
+ [Rails controller で早期で綺麗にreturnする方法](https://qiita.com/benridane/items/bb90be99b0deb09b2587)
## early return
+ [4 ways to early return from a rails controller](https://blog.arkency.com/2014/07/4-ways-to-early-return-from-a-rails-controller/)
+ [Different ways to early returns from controllers](https://mpatelrails.wordpress.com/2016/04/11/different-ways-to-early-returns-from-controllers/)