---
title: javascript strict
date: 2015-06-27
tags: js
---

#

+ strictモードの適用は、「スクリプト全体」ではなく、「関数単位での適用」

## 偶発的にグローバル変数を作成できないようにします


```js
"use strict";
mistypedVaraible = 17; // throws a ReferenceError
```


## 代入文で暗黙的に失敗せずに例外が発生する

```js
"use strict";

// Assignment to a non-writable property
var obj1 = {};
Object.defineProperty(obj1, "x", { value: 42, writable: false });
obj1.x = 9; // throws a TypeError

// Assignment to a getter-only property
var obj2 = { get x() { return 17; } };
obj2.x = 5; // throws a TypeError

// Assignment to a new property on a non-extensible object
var fixed = {};
Object.preventExtensions(fixed);
fixed.newProp = "ohai"; // throws a TypeError
```

## 削除できないプロパティを削除しようとするとエラー

```js
"use strict";
delete Object.prototype; // throws a TypeError
```
## オブジェクトリテラル内のプロパティ名はユニークであることを必須にします

```js
"use strict";
var o = { p: 1, p: 2 }; // !!! syntax error
```

## 関数の引数名がユニークであることを必須にします

```js
function sum(a, a, c) // !!! syntax error
{
  "use strict";
  return a + b + c; // wrong if this code ran
}
```

## 8 進数表記を禁止します

```js
"use strict";
var sum = 015 + // !!! syntax error
          197 +
          142;
```

## コード中の変数名と特定の変数定義との対応づけ方法を単純化 - with使用を禁止

```js
"use strict";
var x = 17;
with (obj) // !!! syntax error
{
  // If this weren't strict mode, would this be var x, or
  // would it instead be obj.x?  It's impossible in general
  // to say without running the code, so the name can't be
  // optimized.
  x;
}
```

## まだまだある。。

# references

[strict mode : MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Strict_mode)
