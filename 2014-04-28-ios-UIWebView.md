---
title: iOS UIWebView
date: 2014-04-28
tags: ios, UIWebView
---



# URLを開く

```
NSURL *url = [NSURL URLWithString:@"targetサイトURL"];
NSURLRequest *req = [NSURLRequest requestWithURL:url];
[webView loadRequest:req];
```



# 参考

* <http://akabeko.me/blog/2014/01/ios-uiwebview/>
* <http://hagino3000.blogspot.jp/2013/12/ios-webview-vgadvent2013.html>
* <http://kouji1981.hatenablog.com/entry/20111009/1318141565>