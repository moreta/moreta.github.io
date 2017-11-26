---
title: "JavaScriptのDateオブジェクト"
date: 2013-11-19
tags: javascript, date
---

JavaScriptのDateオブジェクト
======================

# 各ブラウザでの動作 

### Chrome
Tue Oct 30 2012 01:48:06 GMT+0900 (東京 (標準時))

### IE 9
+ Tue Oct 30 2012 01:49:48 GMT+0900
+ Tue Oct 30 02:29:18 UTC+0900 2012


### Safari(mac)
Tue Nov 19 2013 17:48:37 GMT+0900 (JST)

### Safari(window)
Tue Nov 19 2013 17:48:37 GMT+0900 ( (W))


# window xp Chromeで new Date()エラー

var sysdate = new string(new Date());
xmlHttp.setRequestHeader("If-modified-Since", sysdate)

sysdateが

`Tue Oct 30 2012 01:48:06 GMT+0900 (東京 (標準時))`
これになって、javascriptエラーになる


### 解決方法

JavaScript の Date オブジェクトが返す時刻文字列は、HTTPヘッダ用ならtoUTCString()を使えばよい
<http://diary.sshida.com/20130814-2-JavaScript%20%E3%81%AE%20Date%20%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%8C%E8%BF%94%E3%81%99%E6%99%82%E5%88%BB%E6%96%87>



HTTP HEADERなどで使う Dateは

``` js
//var sysdate = new String(new Date()); // これより
var sysdate = new Date().toUTCString(); // これを
```
