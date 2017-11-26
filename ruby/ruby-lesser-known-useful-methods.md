Ruby lesser known useful methods
==================================

# Object#tap

```rb
def update_params(params)
  params[:foo] = 'bar'
  params
end
```

ここで、最後の`params`はreturnのために追加する必要がある
これを回避するため`Object#tab`を利用して以下のようにかける

```rb
def update_params(params)
  params.tap {|p| p[:foo] = 'bar' }
end
```

blockが必要になった。。
他に使える箇所はなにかあるんだろう。

# Array#bsearch

# Enumerable#flat_map

# Array.new with a Block

# <=>



# References

<https://www.engineyard.com/blog/five-ruby-methods-you-should-be-using?utm_source=newsletter_mailer&utm_medium=email&utm_campaign=weekly>