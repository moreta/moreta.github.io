# forEach, filter , map, reduce

* 基本的なloop処理はこの４つ
* 実装内容も難しくないので把握しておく。
  * <https://code.tutsplus.com/tutorials/how-to-use-map-filter-reduce-in-javascript--cms-26209>


# Remove Object from Array using JavaScript

## by index

+ shift
+ slice
 + 古い要素を取り除きつつ新しい要素を追加することで、配列の内容を変更します。
+ splice
 + 配列の一部を取り出して新しい配列を返します。
+ pop

## by value

### lodash

+ _.remove


```js
var array = [1, 2, 3, 4];
var evens = _.remove(array, function(n) {
  return n % 2 == 0;
});

console.log(array);
// → [1, 3]

console.log(evens);
// → [2, 4]
```
