iOS safariで modal出すときに 背景がスクロールされる問題
=================================================

# このような現象

+ <https://www.youtube.com/watch?v=9h_fjEDDwlc>
 + <https://css-tricks.com/forums/topic/prevent-body-scrolling-when-the-user-scrolls-on-fixed-position-div/>

# 原因は

`touchmove` eventをbodyが受け取るから

## デスクトップ向けなら 

body 要素に対して `overflow: hidden;` を適用すれば済む。

# iOS safariなら

## ためし１ touchmove eventを prevent

```js
  var preventHandler = function(e) {
    e.preventDefault();
  }

// modalを開くときに
var fixed = document.getElementsByTagName('body')[0];
fixed.addEventListener('touchmove', preventHandler);

// modalを閉じるときに
var fixed = document.getElementsByTagName('body')[0];
fixed.addEventListener('touchmove', preventHandler);
```

でも、これだと modalの画像より大きくでmodalにスクロールが必要な場合にも
modal自身がbodyの中なので、スクロールできなくなる



<http://qiita.com/nantekkotai/items/15882159e7e39c207d59>

ここの内容だとbodyだけでなく、htmlにも`overflow: hidden;`でいけるように書いてあるが、
だめだった


## ためし２ position:fixedと overflow:hidden

<http://stackoverflow.com/questions/9280258/prevent-body-scrolling-but-allow-overlay-scrolling>

bodyに noscroll classを追加する
noscrollのcssは以下

```css
body.noscroll{
    position:fixed;
    overflow:hidden;
}
```

でも、これは position:fixedが原因で scrollが topへ移動してしまう。

## ために3 modal(overlay)を 等々のlevelに位置する

<https://github.com/Luxiyalu/scrollable-overlay>

```html
<div class="overlay">
    <div class="overlay-content"></div>
</div>

<div class="background-content">
    lengthy content here
</div>
```