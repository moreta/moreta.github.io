
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


# underscore(_) => wildcard


## named parameterでのunderscore

```swift
@IBAction func hello(_ sender: UIButton) {

}
```

* このコードでは「引数名」は 「sender」
* _があるので、引数名のsenderを省略できる

## tupleでの underscore

+ 無視変数を意味する

```swift
let status = (200, "OK")
let (code, _) = status
let (_, message) = status
```

## 数値リテラルの区切り文字として使用

```swift
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
```


## guard - else

## Designated and Convenience Initializers



# References


## underscore

+ [Swift アンダースコア (_) の使いどころ](http://blog.skipbit.jp/2014/07/swift.html)
+ [stackoverflow - What is _: in Swift telling me?](http://stackoverflow.com/questions/30876068/what-is-in-swift-telling-me)
+ [Swiftの `_` (アンダースコア)](http://qiita.com/mono0926/items/2eb40d58275d20e89ac8)