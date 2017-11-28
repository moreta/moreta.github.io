---
title: Promise in nodejs
date: 2016-01-16
tags: js, promise, nodejs
---

# npms

+ es6-promise
+  promise
+ bluebird
+ Q

# Promise with bludebird

```
npm install bluebird --save 
```

<<<<<<< HEAD
# References

+ [Node.jsエンジニアなら2014年内に知っておきたいPromise入門](http://blog.otakumode.com/2014/09/17/nodejs-promise/)
=======
# メソッド

## Promise.resolve(value)

Promise.resolveはnew Promiseを簡略化するためのもので

<https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve>


静的なPromise.resolve メソッドを使う

```js
Promise.resolve("Success").then(function(value) {
  console.log(value); // "Success"
}, function(value) {
  // not called
});

// es6 & value無し
Promise.resolve().then(() => {
  console.log('success'); // "Success"
}, function(value) {
  // not called
});
```

# References

+ [Node.jsエンジニアなら2014年内に知っておきたいPromise入門](http://blog.otakumode.com/2014/09/17/nodejs-promise/)
+ [promiseの本](http://azu.github.io/promises-book/)
+ [MDN -Promise : ここのprototypeメソッドも確認すること](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise)
>>>>>>> bfbea1c3cc75e7d99ddc34dcdadb736374654ec8
