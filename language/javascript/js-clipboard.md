---
title: HTML clipboard
date: 2016-08-23
tags: editor, html, web
---


# getData

+ IEだけサーポート
+ それ以外は paste eventからしかどれない
  + このHTML5の draft仕様

# sample

clipboard内容が consoleへ表示される

```js
$('body').on('paste',function(e) {
    e.preventDefault();
    var text = (e.originalEvent || e).clipboardData.getData('text/plain')
    console.log(text);
});
```
