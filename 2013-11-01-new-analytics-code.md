---
title: "googleアナリティクス-ユーザー属性とインタレストカテゴリに関するレポートを見えるように"
date: 2013-11-01
tags: analytics
---



リマーケティングまたは GDN のインプレッション レポートを実装するには、この例の太字のテキストを置き換えます。

```js
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-xxxxx-y']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

// ここを
//ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
// これに変更するだけ
ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';

var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
}）（）;
</script>
```
