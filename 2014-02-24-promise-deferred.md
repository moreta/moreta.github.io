---
title: promise, deffered, when
date: 2014-02-24
tags: js, ember, jquery, promise, deffered
---


promise and more (jquery deferred, when)
==================================

+ Promise インターフェースは作成時点では分からなくてもよい値へのプロキシです
+ Promiseを用いることで非同期アクションの成功や失敗に対するハンドラを関連付けることができます
+ jqueryにはdeferredな、whenがある


## Promiseの状態

pending: 初期状態。成功も失敗もしていません。
fulfilled: 処理が成功して完了したことを意味します。
rejected: 処理が失敗したことを意味します。

![prmises](https://mdn.mozillademos.org/files/8633/promises.png)

# jqueryとPromise

<http://api.jquery.com/Types/#Promise>

This object provides a subset of the methods of the Deferred object (then, done, fail, always, pipe, and state) to prevent users from changing the state of the Deferred.

### まず用語の整理：DeferredとPromise
jQuery.Deferredでは、非同期の処理それぞれに
Promise と呼ばれるオブジェクトを割り当て、そのオブジェクトの状態を伝播させていくことで処理を進めます。

![image](http://i.yimg.jp/images/tecblog/2012-2H/jquery-deferred/jqueryDeferred_createPromise.png)


# jquery deffered

+ <http://qiita.com/yuku_t/items/1b8ce6bba133a7eaeb23>
+ <http://blog.toshimaru.net/jquery-ajaxdeferredajax/>


## deferredとは何か？

jQuery.Deferred() introduces several enhancements to the way callbacks are managed and invoked.
In particular, jQuery.Deferred() provides flexible ways to provide multiple callbacks,
and these callbacks can be invoked regardless of whether the original callback dispatch has already occurred.
jQuery Deferred is based on the *CommonJS Promises/A design*.

jQuery.Deferred() はコールバック関数の管理、実行に改善をもたらします。
具体的には、jQuery.Deferred()は複数のコールバックの実行を柔軟に行うことができ、
これらのコールバック関数は、オリジナルのコールバックのディスパッチが発生しているかどうかにかかわらず実行されます。

### Deferredまとめ

<http://s3pw.com/qrefy/collectdeferred/>

Deferredオブジェクトとは、非同期処理であるAjaxやアニメーションなどの特定の処理が完了するのを監視する"deferred"(遅延された)オブジェクトのことです。
このDeferredオブジェクトを利用することで、その処理状態に応じて実行する関数を管理できます。
Deferredオブジェクトを生成するには、$.Deferred()を使用します。


# jquery when

複数の非同期処理が全部終わったら、続く処理を行う


## $.whenの利用
```js
$.when(
    $.getJSON('a.json'),
    $.getJSON('b.json')
)
.done(function(data_a, data_b) {
    // すべて成功した時の処理
    console.log(data_a, data_b);
})
.fail(function() {
    // エラーがあった時
    console.log('error');
});
```
`$.when`を使うことによってcallbackを書くより見やすい。


## $.Deferredの利用とsetTimeoutとの組み合わせて

*JSONデータを取得してきたい、ただし、最低でも1秒間待たせてから、次の処理をしたい*

```js
// 指定された秒数だけ待つ deferred
function wait(sec) {
    var d = $.Deferred();
    setTimeout(function() {
        d.resolve();
    }, sec * 1000);
    return d.promise();
}

$.when(
    $.getJSON('sample.json'),
    wait(1) // 1秒待ってから成功を返す deferred
)
.done(function(data) {
    console.log(data);
});

```

# Reference

+ [Promise](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise)
+ [jqeury api promise document](http://api.jquery.com/Types/#Promise)
+ [jquery api when document](https://api.jquery.com/jquery.when/)
+ [爆速でわかるjQuery.Deferred超入門](http://techblog.yahoo.co.jp/programming/jquery-deferred/)
+ [jQuery.when() で、複数の非同期処理を扱う](http://www.tam-tam.co.jp/tipsnote/javascript/post5807.html)
+ [JavaScript Promises](http://www.html5rocks.com/ja/tutorials/es6/promises/)
