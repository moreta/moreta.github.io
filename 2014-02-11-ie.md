---
title: Internet Explorer Fuck
date: 2014-02-11
tags: css3, ie, js
---


## ドキュメント互換性の定義

* <http://msdn.microsoft.com/ja-jp/library/cc288325(v=vs.85).aspx>
* <http://msdn.microsoft.com/en-us/library/dn384051(v=vs.85).aspx>
* <http://standards.mitsue.co.jp/archives/001326.html>

簡単にいうと、IEの旧versionに併せて作られたサイトを新しいIEで見た時に
表示に問題が生じる可能性がある。

新しいブラウザにサイトが対応できるまで、*このサイトがレンダリングされるIEのバージョンを指定*できるようにするのが、
ドキュメント互換性。また、その指定方法が*ドキュメント互換モード*である。

### IE11からドキュメントモードはdeprecatedされている

IE11からドキュメントモードはdeprecatedされているのでいらない

`<!DOCTYPE html>`これでOK

### ドキュメント互換モードの指定

WEBページのドキュメントモードを指定するには、meta要素を使用

例えば

```
<html>
<head>
  <!-- Mimic Internet Explorer 7 -->
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" >
  <title>My Web Page</title>
</head>
<body>
  <p>Content goes here.</p>
</body>
</html> 
```

#### content 属性値について

* `<meta http-equiv="X-UA-Compatible" content="IE=9">   <!-- IE9 mode -->`
* `<meta http-equiv="X-UA-Compatible" content="IE=8">   <!-- IE8 mode -->`
* `<meta http-equiv="X-UA-Compatible" content="IE=7" > <!-- IE7 mode -->`
* `<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" > <!-- IE7 のロジックmode -->`
* `<meta http-equiv="X-UA-Compatible" content="IE=7,9,10" > <!-- 複数サポート -->`
* `<meta http-equiv="x-ua-compatible" content="IE=edge" >`


##### EmulateIE7?

さて、五番目の「IE=emulateIE7」は、Beta 2より登場する新しい値のようです。一見IE=7との違いが分かりませんが、IE=7はIE7モードで強制的にレンダリングするのに対し、IE=emulateIE7の場合は、さらに文書のDOCTYPEをチェックした上で、IE7モードかIE5モードでレンダリングするのかを決定します。「IE7スイッチ」といったところでしょうか。

```
<!DOCTYPE html PUBLIC ...
<html ...>
<head>
<title>emulateIE7</title>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
</head>
```

IE8で上記のHTMLを表示すると、DOCTYPEが記述されているためIE7モードで描画されます。DOCTYPEを取ってみると、IE5モードで表示されることになります。

### ドキュメント互換モードの判別

`document.documentMode`を利用する

`javascript:alert(document.documentMode);`は 8などをかえす

```
engine = null;
if (window.navigator.appName == "Microsoft Internet Explorer")
{
   // This is an IE browser. What mode is the engine in?
   if (document.documentMode) // IE8
      engine = document.documentMode;
   else // IE 5-7
   {
      engine = 5; // Assume quirks mode unless proven otherwise
      if (document.compatMode)
      {
         if (document.compatMode == "CSS1Compat")
            engine = 7; // standards mode
      }
   }
   // the engine variable now contains the document compatibility mode.
}

```



## ie10からは conditional commentが使えないらしい。
ie10 dropped conditionnal comments.

```
<!--[if lt IE 9]>
これはもうだめ
<![endif]-->
```



<http://stackoverflow.com/questions/14585703/ie10-stylesheet>

```
if ($.browser.msie && $.browser.version == 10) {
  $("html").addClass("ie10");
}
```
でも、これも jquery1.9からはNG

```
if ( jQuery.support.boxModel ) {
  $("do").somthing();
}
```
このように

Or you can try the @media -ms-high-contrast Hack like this:

```
@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
   /* IE10-specific styles go here */
}
```
or you can try the @media Zero Hack

```
@media screen and (min-width:0\0) {
    /* IE9 and IE10 rule sets go here */
}
```