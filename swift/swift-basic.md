
# 配列

## 配列の複製

+ 配列に配列を代入すると referenceの参照ではなく、copyされる部分が一javaと違う
  + 内部では lazy copyで処理される

```swift
var array1 = [1,2,3]
let array2 = array1 # 配列が複製される - referenceの参照ではない！！
```

### lazy copy, shallow copy, deep copy

+ swiftでは一旦 shallow copyで処理したあと、あとで deep copyをする。これを lazy copyという。
+ dictionaryの場合にも lazy copyで動く