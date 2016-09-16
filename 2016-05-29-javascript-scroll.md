---
title: Javascript scroll
date: 2016-05-29
tags: javascript, scroll
---

# `window.scrollTo`と`window.scrollBy`

+ `window.scrollTo(or window.scroll)`は指定された「絶対座標」までscroll
+ `window.scrollBy`は指定された「量」だけscroll

ほかscroll関連は

+ `window.scrollByLines`
+ `window.scrollByPages`

がある。

## scrollBy

```js
// syntax
window.scrollBy(X,Y);
// 1 ページスクロールします
window.scrollBy(0, window.innerHeight);
```


## scrollByLines (非標準)

指定した行分文書をスクロールします。

```js
// syntax
window.scrollByLines(lines)
// 5 行分文書をスクロールダウンします。
<button onclick="scrollByLines(5);">down 5 lines</button>
// 5 行分文書をスクロールアップします。
<button onclick="scrollByLines(-5);">up 5 lines</button>
```

## scrollByPages (非標準)

```js
// syntax
window.scrollByPages(pages)
// 1 ページ分文書をスクロールダウンします。
window.scrollByPages(1);
// 1 ページ分文書をスクロールアップします。
window.scrollByPages(-1);
```
