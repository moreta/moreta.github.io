Javascript undefined and null
=============================



# undefined !== undefined?

+ undefinedをtypeof無しでcheckする場合には `===`を
+ undefinedをtypeofでcheckする場合には `==`を

```js
var foo; 
foo === undefined // true
foo == 'undefined' // false
foo == "undefined" // false
typeof foo === undefined // false
typeof foo == 'undefined' // true
typeof foo == "undefined" // true

typeof foo === typeof undefined // true
```

# References

+ [JavaScriptというプログラム言語の一番奇妙な部分についてのドキュメント集](http://bonsaiden.github.io/JavaScript-Garden/ja/)
