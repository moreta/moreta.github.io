

# divタグで onfocus/onblur eventが動作するようにする方法 

<https://colo-ri.jp/develop/2008/03/divonfocusonblur.html>


# onfocus/onblurをサポートしているタグ要素

+ a
+ area
+ button
+ input
+ label
+ select
+ textarea

# onfocus/onblurをサポートしない要素でeventを利用するためには

1. タグのグループにtabindex属性を付加することでonfocus/onblurイベントを受信できるようして動かす方法
2. JavaScriptでdocumentにmousedownイベントのリスナーになってもらってタググループを管理する方法

1の方法は [vue-multiselect](https://github.com/monterail/vue-multiselect)でも利用している方法だった
2の方法は [vue-search-select](https://github.com/moreta/vue-search-select)で利用している方法


# References

+ [divタグのグループをonfocus/onblurイベントでラジオボタン風に見せる](https://colo-ri.jp/develop/2008/03/divonfocusonblur.html)