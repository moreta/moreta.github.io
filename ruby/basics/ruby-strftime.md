ruby strftime
==============


# 通常

```ruby
Time.mktime(2012, 1, 1).strftime('%m') # => '01'
```

# _をつけた場合

頭に(_)を付けて%mを呼び出すと0の代わりに半角スペースが補完される。

```ruby
Time.mktime(2012, 1, 1).strftime('%_m') # => ' 1'
```

# -をつけた場合

頭に(-)を付けて%mを呼び出すと0なしで出力される。

```ruby
Time.mktime(2012, 1, 1).strftime('%-m') # => '1'
```


# References

+ [strftimeで月を表示する際に、0による左詰めパディングを回避する方法](http://qiita.com/semind/items/cdd6c30d23c60df94879)