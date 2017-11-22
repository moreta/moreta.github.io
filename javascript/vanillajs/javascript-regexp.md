Javascript RegExp
====================

# RegExp object

基本は
```js
var re = new RegExp("ab+c");
```


簡単に // で表現できる
```js
var re = /ab+c/;
```

# 正規表現でエスケープが必要な文字一覧表

以下のようなコードはエラーが発生する

```js
'[test] test name'.match(new RegExp('[', 'i'))

// Uncaught SyntaxError: Invalid regular expression: /[/: Unterminated character class
```
`[`を escapeする必要がある


このようなfunctionでstringをescapeしてから RegExpに渡す必要がある
```js
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions
function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // $& means the whole matched string
}
```

