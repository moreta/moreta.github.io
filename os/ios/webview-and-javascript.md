Webview & Javsscript
=======================


# from javascript to ios

```js
// window.webkit.messageHandlers.[name].postMessage // syntax
window.webkit.messageHandlers.callbackHandler.postMessage('Hello Native!');
```

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
