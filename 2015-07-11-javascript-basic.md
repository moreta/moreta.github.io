---
title: Javascript Basic
date: 2015-07-11
tags: js, filter, map
---

# Singleton

+ <http://qiita.com/KENJU/items/54760d292d8fbddb1015>


JavaScriptにおけるオブジェクトをすべてシングルトンとみなすこともできるでしょう。
要するに、 オブジェクトリテラルの作成 = シングルトンの作成 ともいえます

# binding

## `.bind(this)`


# Functional Programming in Javascript

- <http://reactivex.io/learnrx/>

以下の５つのfunctionを勉強するのにいいtutorial

1. map
2. filter
3. concatAll
4. reduce
5. zip

## indexers

- Whereas the 5 functions can be used on any collectionaccess (like Array)
- indexers can only be used on collections that support random-


# forEach

forEachはloopが止まらない

reference

+ <http://stackoverflow.com/questions/6260756/how-to-stop-javascript-foreach>


# 型の判定

+ <http://qiita.com/south37/items/c8d20a069fcbfe4fce85>

## list 判定


```
var foo = [];
var bar = {};

alert(foo instanceof Array); // true
alert(bar instanceof Array); // false
```

reference

+ <http://qiita.com/38kun/items/8b1b91e998ef890e868c>
