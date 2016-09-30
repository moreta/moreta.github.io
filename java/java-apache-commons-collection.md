

# `org.apache.commons.lang3.tuple.Pair`

## References

+ [Java の Pair について考える](http://qiita.com/y_q1m/items/8c26a773ae67bfe2a107)

# Instance create
```
Pair.of(key, value)
MutablePair.of(key, value)
```

## キー・値の取り出し

+ Key : `getKey()` か `getLeft()`
+ Value : `getValue()` か `getRight()`

## 値の変更

+ MutablePair は setValue() メソッドにより値だけ変更可能
+ Pair ないし ImmutablePair は変更不可
  + setValue()を使うと UnsupportedOperationException が発生
