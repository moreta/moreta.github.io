Swift Optional
================

# Optionalは型

* nilを保存できる
* 値がある場合は、`Optional(data)`で保存
* dataを取り出すときにはunwrap(casting)が必要

# Unwrappingの種類 

* forced unwrapping
* optional binding
* optional chaining


## forced unwrapping

! をつけてその型にキャストする方法

```swift
var optional: Int? = 10 // オプショナル型
// そのまま出力
println(optional)
// => Optional(10)

// 強制的アンラップ("!"をつけて)で出力
println(optional!)
// => 10
```

**アンラップする対象のオプショナル型の変数の中身がnilだった場合、エラーしてアプリケーションが落ちてしまう。**

## optional binding

`if var 変数名 = オプショナル型の変数 { 処理 }`

## optional chaining

オプショナル型の変数に続けてプロパティを取得したり、メソッドを呼び出す場合に使用します。

【例】
オプショナル型の変数?.プロパティ
オプショナル型の変数?.メソッド()

```swift
var human: Human? = Human()

// nilでないためプロパティが取得できる
human?.name
// => "Optional(シンボ)"

// nilでないためメソッドを呼び出せる
human?.hello()
// => "Optional(こんにちは)"
```

ui table cellの例

```swift
cell.textLabel?.text = restaurantNames[indexPath.row]
cell.imageView?.image = UIImage(named: "restaurant")
```




# "?" and "!"

## 変数の宣言のとき以外に使う"?"や"!"はオプショナル型とは別物です。

あくまでも、変数の宣言のとき以外

* ? は optional chaining
* ! は forced unwrapping




# Referneces

+ [OptionalをUnwrapする３つの方法](https://qiita.com/Saayaman/items/1e2a87b9e61e419eaa73)
+ [どこよりも分かりやすいSwiftの"?"と"!"](https://qiita.com/maiki055/items/b24378a3707bd35a31a8)