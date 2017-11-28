

# 等価演算子 - Equality and Comparisons

```js
""           ==   "0"           // false
0            ==   ""            // true
0            ==   "0"           // true
false        ==   "false"       // false
false        ==   "0"           // true
false        ==   undefined     // false
false        ==   null          // false
null         ==   undefined     // true
" \t\r\n"    ==   0             // true
```

# 厳密等価演算子 - The Strict Equality Operator

```js
""           ===   "0"           // false
0            ===   ""            // false
0            ===   "0"           // false
false        ===   "false"       // false
false        ===   "0"           // false
false        ===   undefined     // false
false        ===   null          // false
null         ===   undefined     // false
" \t\r\n"    ===   0             // false
```

## 厳密等価演算子でのオブジェクトの比較 - Comparing Objects

```js
{} === {};                   // false
new String('foo') === 'foo'; // false
new Number(10) === 10;       // false
var foo = {};
foo === foo;
```

# typeof演算子

typeof演算子(instanceofも同様です)は恐らくJavaScriptの最大の設計ミスです。完全に壊れている存在に近いものです。


# References

+ [型](http://bonsaiden.github.io/JavaScript-Garden/ja/#types)
  + JavaScriptというプログラム言語の一番奇妙な部分についてのドキュメント集