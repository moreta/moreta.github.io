---
title: mobile browser issue
date: 2014-04-28
tags: mobile, browser
---




# 300ms遅延 on mobile browser

<http://www.slideshare.net/hagino_3000/ioswebviewapp>

*Clickイベントが遅延する問題*

* タッチデバイスブラウザはtouchstart後clickイベントまでの間隔が300msec程度空く
* リンククリックの反応が遅い
* もっさり感

*解決策*

* FastClick.js
 clickイベントが速くなる、リンククリックも改善
* jQuery mobileであればvclickイベントを使う
* clickでは無くtouchendイベントを使う (ブラウザのデバッグが面倒になる)

## fast click

<https://github.com/ftlabs/fastclick>

## fast button

<https://developers.google.com/mobile/articles/fast_buttons>


# 他資料

<http://0-9.sakura.ne.jp/pub/appsemi/start.html>