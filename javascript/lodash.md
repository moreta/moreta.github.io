---
title: lodash
data: 2014-12-08
tags: nodejs, javascript, lodash, underscore, lazyjs
---

# assignとmergeとdefaultsの違い

lodashには`extends`もあるが`assign`と同じ

+ <https://blog.mariusschulz.com/2015/03/30/combining-settings-objects-with-lodash-assign-or-merge>
+ [表で差がわかりやすい](http://delapouite.com/ramblings/lodash-difference-between-extend-assign-merge-defaults.html)

## lodashがなくても実装できる

+ assignはObject.assign

# lazy.js - lodash, underscoreより早い

+ <http://danieltao.com/lazy.js/>

# references

+ [lodashがなくても実装できる](http://blog.xebia.com/you-might-not-need-lodash-in-your-es2015-project/)
+ [Official doc](https://lodash.com/)


# nubmer判断

## `isNumber` と `isFinite`

+ To exclude Infinity, -Infinity, and NaN, which are classified as numbers, use the _.isFinite method.
+ finite : 有限の

+ `isNumber`はInfinity, -Infinity, NaNの場合が **true**
+ `isFinite`はInfinity, -Infinity, NaNの場合が **false**

`toNumber('a')`の場合`NaN`になるので isNumberした値を `isNumber`で判定すると trueになってしまう。

es6を利用するなら


## `toNubmer` と `toInteger`

 + `toNubmer` は Infinity, -Infinity, NaNをreturn
 + `toInteger`は Infinity, -Infinity, NaNをreturnせずに 0になる