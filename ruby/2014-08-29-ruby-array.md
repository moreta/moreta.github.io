---
title: ruby Array
date: 2014-08-29
tags: ruby, array
---

## zip

`Enumerable##zip`

zipは任意の数の配列を元に、同じ順番でまとめた配列を生成




```
hiragana = ["あ", "い", "う", "え", "お"]
alphabet = ["a", "b", "c", "d", "e"]
number = [1, 2, 3, 4, 5] #Fixnum class

p number.zip(alphabet)
#=> [[1, "a"], [2, "b"], [3, "c"], [4, "d"], [5, "e"]]

p hiragana.zip(alphabet, number)
#=> [["あ", "a", 1], ["い", "b", 2], ["う", "c", 3], ["え", "d", 4], ["お", "e", 5]]

p number.zip(alphabet, hiragana)
#=> [[1, "a", "あ"], [2, "b", "い"], [3, "c", "う"], [4, "d", "え"], [5, "e", "お"]]

number.zip(hiragana, alphabet){|n, h, a|
  print "number is #{n}, alphabet is #{a}, and hiragana is #{h}\n"
}

# =>
# number is 1, alphabet is a, and hiragana is あ
# number is 2, alphabet is b, and hiragana is い
# number is 3, alphabet is c, and hiragana is う
# number is 4, alphabet is d, and hiragana is え
# number is 5, alphabet is e, and hiragana is お
```

## inject 

`Enumerable#inject`

```
ary = [1,2,3,4,5,6,7,8,9,10]
ary.inject(0) {|sum, i|
    sum + i
}
```


## 参考

* <http://hash.hateblo.jp/entry/20090625/1245949183>