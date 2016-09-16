---
title: Javascript scope - 関数と関数スコープ
date: 2016-03-22
tags: js, scope
---

+ return で明示的に値を返していない関数は undefinedを返す

# 入れ子の関数とクロージャ

+ 関数の内部に関数を入れ子にする事ができます。
* 入れ子にされた (内側の) 関数は、それを含む (外側の) 関数に対してプライベートです。
+ それは同時に クロージャ を形成します
  + 入れ子にされた関数はクロージャ
  
**closureの例**

```js
function addSquares(a,b) {
   function square(x) {
      return x * x;
   }
   return square(a) + square(b);
}
a = addSquares(2,3); // 13 を返す
b = addSquares(3,4); // 25 を返す
c = addSquares(4,5); // 41 を返す
```

+ クロージャは、参照しているすべてのスコープ内の引数と変数を保持
+ クロージャは外側の関数が呼び出されるたびに作らなければなりません
+ メモリが解放されるのは、返された inside にアクセスできなくなったときだけです。

**closureを利用した curly**

```js
function outside(x) {
   function inside(y) {
      return x + y;
   }
   return inside;
}
fn_inside = outside(3); 
result = fn_inside(5); // 8 を返す

result1 = outside(3)(5); // 8 を返す
```

# 関数宣言と関数式 (function declaration and function expression)

関数宣言は以下のような時には関数宣言ではなくなる

+ 式の一部になった時
+ 関数またはスクリプト自体の「ソース要素 (source element)」でなくなった時。
  + 「ソース要素」はスクリプトや関数本体の中で入れ子にされていない文の事です
  + A "source element" is a non-nested statement in the script or a function body:

```js
var x = 0;               // ソース要素
if (x == 0) {            // ソース要素
   x = 10;               // ソース要素ではない
   function boo() {}     // ソース要素ではない - if式の中だから
}
function foo() {         // ソース要素
   var y = 20;           // ソース要素
   function bar() {}     // ソース要素 - closureなので source element
   while (y == 10) {     // ソース要素
      function blah() {} // ソース要素ではない - while式なかなので not source element
      y++;               // ソース要素ではない
   }
}
```


```js
// function declaration
function foo() {}

// function expression
(function bar() {})

// function expression
x = function hello() {}


if (x) {
   // function expression
   function world() {}
}


// function declaration
function a() {
   // function declaration
   function b() {}
   if (0) {
      // function expression
      function c() {}
   }
}
```

# References

+ [関数と関数スコープ](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Functions_and_function_scope)


