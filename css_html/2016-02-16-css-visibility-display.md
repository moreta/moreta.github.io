---
title: CSS visibility and display
date: 2016-02-16
tags: css, visibility, display
---

# visibility and display

たまに間違って説明している人とか、テーブル行がウマく消えずに苦しんでる人を見かけるので、説明しようとするのだけど、いつも忘れているのでちゃんとまとめておく。

## display:none 

elementを消す。DOMとしては存在するが描画されない

## visibility:hidden 

hidden only visually hides elements

エレメントは描画させないだけ, elementは存在する


# visibility


<https://css-tricks.com/almanac/properties/v/visibility/>


+ visible
+ hidden
+ collapse
  + これは基本的使うな？
  + でも、flexboxでは使える!
+ inherit


## visibilityを使う例

+ <http://joshnh.com/weblog/display-none-vs-visibility-hidden/>
+ <http://jsfiddle.net/joshnh/7JyRH/>

visibilityはelementは存在しているため見えなくなっても領域は生きている。
見えなくなることによってコンテンツ動くのがいやだったら`visibility:hidden&visible`を使う
