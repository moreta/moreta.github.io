# iOS Webview & Javsscript

## from javascript to ios

javascriptでiosのfunctionを`webkit.messageHandlers`でcall

```js
// window.webkit.messageHandlers.[name].postMessage // syntax
window.webkit.messageHandlers.callbackHandler.postMessage('Hello Native!');
```

ios側で callbackHandler部分を処理するコードを作成

```swift
func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
  if(message.name == "callbackHandler") {
    print("JavaScript is sending a message : \(message.body)")
  }
}
```

+ [name]は whatever you call the script handler

# from ios to javascript

iosからjavascriptのfunctionを呼び出し


# References

+ [Swift: Web (JavaScript) から SKWebView へメッセージを送信する](http://www.sirochro.com/note/swift-js-to-skwebview-message/)
+ [Android & iOS javascriptとネイティブの連携](http://s-prism3.seesaa.net/article/439412637.html)
+ [Using JavaScript with WKWebView in iOS 8](http://www.joshuakehn.com/2014/10/29/using-javascript-with-wkwebview-in-ios-8.html)
+ [WKWebViewにおけるSwiftとJavaScriptにおける双方向通信](https://qiita.com/mss634/items/170d3cb401eee4ec1253)
+ [Swift: WKWebView の userContentController で取得した JSON を使用する](http://www.sirochro.com/note/swift-swiftyjson-parse/)
