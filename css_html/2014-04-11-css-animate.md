---
title: css animate
date: 2014-04-11
tags: openssl, https, 証明証, heartbleed
---



# displayはanimationできない

忘れてた

<http://qiita.com/gonshi_com/items/4ae066ef4bea6d519854>

抜粋

```css
.hoge{
    display: none;
    opacity: 0;
    transition: opacity 1s linear 0s;
}

.hoge.show{
    display: block;
    opacity: 1;
}

```

> これではうまく動かない。
> なぜならshowがクラス名として付与された時点で初めて`display: block;`となり、このタイミングでDOMが生成されているため。
> 従って、`display: none;` 状態のときの`opacity: 0;`というプロパティはtransitionのスタート値とはならず、 0 -> 1 へのアニメーションは走らない。

つまり、transitionするためには連続性が必要なのに、`display:none`の場合にはそれがなくなる。(ありそうだけどない)

## ではどうする？ 

`@keyframes`を使うか、`display:`をやめて`visibility`を使う。

<http://stackoverflow.com/questions/3331353/transitions-on-the-display-property>

# height autoへのtransition方法

[How to animate height from 0 to auto using CSS Transitions](http://css3.bradshawenterprises.com/animating_height/)

```
.our_content {
	/* Initially we don't want any height, and we want the contents to be hidden */
	max-height: 0;
	overflow: hidden;

	/* Set our transitions up. */
	-webkit-transition: max-height 0.8s;
	-moz-transition: max-height 0.8s;
	transition: max-height 0.8s;
}
.outside_box:hover .our_content {
	/* On hover, set the max-height to something large. In this case there's an obvious limit. */
	max-height: 200px;
}
```

# Referencess

+ <https://h5bp.github.io/Effeckt.css/>
