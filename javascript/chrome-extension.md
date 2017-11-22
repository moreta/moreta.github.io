---
title: Chrome extension
date: 2014-05-11
tags: chrome, extension
---

# Chromeの拡張機能 / Chrome Extension

<https://developer.chrome.com/extensions>

# 拡張機能の種類

+ [Browser actions](https://developer.chrome.com/extensions/browserAction)
+ [Page actions](https://developer.chrome.com/extensions/pageAction)
+ [Override Pages](https://developer.chrome.com/extensions/override)

## 他の用語(react-chrome-extension-boilerplateでの)

+ popup == 左上に表示されるiconから
+ window == chrome appsみたいに別のwindowが起動
+ Inject page
  + The inject script is being run by chrome/app/background/inject.js. A simple example will be inject bottom of page(https://github.com/*) if you visit

## Override Pages

以下のページを置き換えることができます。

+ Bookmark Manager
+ History
+ New Tab
+ ただし、拡張1個につき、1つのページしか置き換えられないのです。例えばNew TabとHistoryの両方を1つの拡張で置き換えようとしても、ダメ

# manifest.json


# webstromのコード補完

`Language & Frameworks > Javascript > Libaries`
からDownloadをクリックし、chromeを`Download and Install`する

# Load unpack extension

+ 開発中のpackageしてないソースをchromeにロードすること
+ packageされたのは`.crx`拡張子を持つ

<https://developer.chrome.com/extensions/getstarted#unpacked>


## 手順

1. chrome://extensions/ へアクセス
2. パッケージされていない拡張機能を読み込む.. を選択
3. ソースを選択
4. ソースが修正された時には*リロード*すればOK


# Basics

## Content Scripts 

+ Webページの中に挿入するCSSとJavaScriptのことを「Content Scripts」と呼ぶ
+ セキュリティ上の理由で、この手のJavaScriptは独自の実行環境（isolated world）を持つ
+ 挿入先のWebページのDOMにはアクセスできるんですが、そのページで定義した変数や関数にアクセスすることはできない
+ 訪問したページの情報を読むことができたり、そのページを変更することができる。

## Background-Page

+ 目には見えませんが、常にバックグラウンドで動いてるページ
+ Webページに挿入しないため、「Content Scripts」のようなAPI利用制限はないです
+ 基本的にはbackgroud-pageより、event-pageを使う

## Event-Page

+ "persistent": falseにすることで、「Event Pages」にすることができます
+ Background-Pageとの違いは、「常に動いているわけではない」なのでmemoryなどが節約できる

### Best practices when using event pages

+ message passingを使う場合 : be sure to close unused message ports
  + event pageは全てのmessage portsがcloseされる前にshut downされない。
+ context menuを使う場合 : pass a string id parameter to contextMenus.create, and use the contextMenus.onClicked callback instead of an onclick parameter to contextMenus.create

# Message Passing

<https://developer.chrome.com/extensions/messaging>

TODO:



# Background page and Event page

Background pages よりも Event pages を使用したほうが良い

### why?

Background pagesは、Chrome起動時にプロセスが起動され、以降Chromeが終了するまで生き続けます

### Background pageが起動しているかの確認
 
Inspect views: xxxx(inactive)

のようになっていると未起動、inactiveがないと起動状態


# APIs

読む方法

+ Description: 簡単な説明
+ Availability: 利用可能なchrome version
+ Permissions: apiを利用するのに必要permission
+ Summary: apiコードのsummary
  + Types
  + Properties
  + Methos
  + Events


## chrome.tabs

+ 一番良く使うapiではないか？
+ 現在開いているtabの情報を取得したり、操作したりする

### method

#### update

`chrome.tabs.update(integer tabId, object updateProperties, function callback)`

tabId: (optional)で省略したらcurrnet windowのselected tab

#### samples

```js
// browserActionのiconがクリックした時のeventを追加
chrome.browserAction.onClicked.addListener(function(tab) {
  // clickされた時に開いているtabが渡される
  var action_url = "javascript:window.print();";
  // tabsのurlをupdateする
  // ここでurlをjavascript:window.print()にすることでprint windowが開く
  chrome.tabs.update(tab.id, {url: action_url});
});

```

## chrome.windows

## chrome.contextMenus

![chrome.contextMenus](https://dl.dropboxusercontent.com/u/21522805/blog/chrome/chrome_extension_context_menu.png)

## chrome.storage

<https://developer.chrome.com/extensions/storage>

+ 基本的な昨日はlocalStorageと同じ(でもいくつかもっとある)

localStorageとの違い

+ User data can be automatically synced with Chrome sync (using storage.sync).
+ Your extension's content scripts can directly access user data without the need for a background page.
+ A user's extension settings can be persisted even when using split incognito behavior.
+ It's asynchronous with bulk read and write operations, and therefore faster than the blocking and serial localStorage API.
+ User data can be stored as objects (the localStorage API stores data in strings).
+ Enterprise policies configured by the administrator for the extension can be read (using storage.managed with a schema).

# Examples

+ <https://developer.chrome.com/extensions/samples>



# References

+ [Official page](https://developer.chrome.com/extensions)
+ [Chromeのオリジナル拡張機能を開発しよう（ソースコードあり）](http://liginc.co.jp/web/tool/browser/163575)
  + [source](https://github.com/xipx/link-checker)
+ [Chrome拡張 | アーキテクチャ](http://qiita.com/tbpgr/items/168a90ba07badc86e1e6)
+ [Chrome拡張では、Background pages よりも Event pages を使用したほうが良い](http://yonchu.hatenablog.com/entry/2013/05/09/221030)


## sample codes

+ [vimmers-follow-status](https://github.com/yonchu/vimmers-follow-status)
+ [chrome extension samples](https://developer.chrome.com/extensions/samples)
