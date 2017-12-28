---
title: CSS Flexbox Layout
date: 2015-12-20
tags: css, box, flexbox
---

# flexbox

flexboxを使うのがおすすめ


+ <http://www.webcreatorbox.com/tech/flexbox/>
+ <http://liginc.co.jp/web/html-css/css/21024>
+ [CSS3のFlexboxを基本から理解して、使い倒そう！ - LIG](http://liginc.co.jp/web/html-css/css/21024)
+ <https://css-tricks.com/old-flexbox-and-new-flexbox/>
+ <https://css-tricks.com/snippets/css/a-guide-to-flexbox/>


# display property


|   property   |                                               desc                                              |
|--------------|-------------------------------------------------------------------------------------------------|
| inline       | インラインボックスを生成する                                                                    |
| block        | ロックボックスを生成する                                                                        |
| inline-block | 表示はインラインボックスだが、ブロックボックスのように高さや横幅、margin、paddingを指定できる。 |
| table        | table要素のような表示になる                                                                     |
| table-cell   | td要素のような表示になる                                                                        |
| flex             |                                                                                                 |


## ちなみに

HTML5ではブロック要素、インライン要素という分け方はない
displayプロパティの説明に入る前に外せないのが、この話です。

HTML5以前（HTML4.1、XHTML1.0）では、HTMLにブロック（レベル）要素、インライン（レベル）要素という分け方がありました。


# flexboxでgridを実装したときの最後itemのalign処理

<https://stackoverflow.com/questions/18744164/flex-box-align-last-row-to-grid>

もし、3列で10件を描画すると最後の1個が row全幅をとったりする
これを防ぐには以下のように書く

```css
.grid {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
}

.grid:after {
  content: "";
  flex: auto;
}
```
もしくは、gridを使うのがいいが、まだbrowser supportはまだかな

## gutterが必要な場合

<https://css-tricks.com/dont-overthink-flexbox-grids/>

```css
.flex-grid-thirds {
  display: flex;
  justify-content: space-between;
}
.flex-grid-thirds .col {
  width: 32%;
}
```


# References

+ [A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
+ <http://scene-live.com/page.php?page=54>
+ <http://www.webcreatorbox.com/tech/flexbox/>
+ <http://scene-live.com/page.php?page=55>
+ [css-layout](https://github.com/facebook/css-layout)
