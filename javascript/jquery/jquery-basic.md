---
title: Jquery Basic
date: 2014-02-14
tags: jquery, 無名関数, js
---

# 名無しの関数

<http://matome.naver.jp/odai/2135085755754237301>

## 匿名関数(anonymous function, nameless function)
`(function(){})()`
と書くのは，無名関数を即時実行するため

## 無名関数 jQuery 名前空間としての考え方

```
(function($){
  alert('nanashi');
})(jQuery);
```

### plugin 作成の時

```
(function($){
  // plugin code
})(jQuery);
```

これは plugin codeがjQueryを安全に利用できるようにしてくれる。

たとえ、`jQuery.noConflict()`がどこかで呼ばれたとしても、
この無名関数で囲んで'jQuery'を無名関数のパラメータに渡すことでpluginのcodeの中で`$`の利用の安全性が担保される。

## page ready

<http://api.jquery.com/ready/>

以下の4つは全部同じ

`$( document ).ready( handler )`

`$().ready( handler ) (this is not recommended)`

`$( handler )`


この２つも同じ

```
$( document ).ready(function() {
  // Handler for .ready() called.
});


$(function() {
  // Handler for .ready() called.
});
```

## あとから追加した要素にもeventが適用されるためdelegateを利用

<http://tacamy.hatenablog.com/entry/2013/03/03/213113>

以下の3つは同じだが、onを使うこと

1.

```
$('.parent').delegate('.foo', 'click', function(){...});
$('.parent').undelegate('.foo', 'click');
```

2. liveは使うな1.9から破棄

```
$('.foo').live('click', function(){...});
$('.foo').die('click');
```

3. onを使うこと

```
$(document).on('click', '.foo', function(){...});
$(document).off('click', '.foo');

// 他の例
$('.foo').on('click blur', function(){...});

$('.foo').on({
  'mouseenter': function(){...},
  'mouseleave': function(){...}
});

$('.parent').on({
  'mouseenter': function(){...},
  'mouseleave': function(){...}
}, '.foo');

```



## binding

railsでajaxで生成したelementのeventが再bindingしない

<http://stackoverflow.com/questions/10055450/ajax-beforesend-works-only-once-on-rails>

これは１回のみになってします。

```
$("#relationships_form_1").on("ajax:beforeSend", function() {
  $("#relationship_save").show();
});
```

このように設定する
Because your ajax-loaded form is not the same as initial form.

```
jQuery(document).on("ajax:beforeSend", "#relationships_form_1", function() {
  $("#relationship_save").show();
});

or

$(document).on("ajax:beforeSend", "#relationships_form_1", function() {
  $("#relationship_save").show();
});
```


# jsonp

# ajax header

jquery >  1.5
 
```
$.ajax({
  url: '/test',
  type: 'PUT',
  headers: {
    'X-HTTP-Method-Override': 'PUT',
    'Content-Type': 'application/json'
  },
  dataType: 'json',
  data: '{"test": "テスト"}',
}).done(function() {
    console.log('成功');
});
```

jQuery <= 1.4 

beforeSend メソッドを定義し、xhr オブジェクトに直接アクセスする必要

```
$.ajax({
    url: '/test',
    type: 'PUT',
    beforeSend: function(xhr) {
        xhr.setRequestHeader('X-HTTP-Method-Override', 'PUT');
    }contentType: 'application/json',
    dataType: 'json',
    data: '{"test": "テスト"}',
}).done(function() {
    console.log('成功');
});
```


# Best way to create new elements using jQuery
<http://code-tricks.com/best-way-to-create-new-elements-using-jquery/>


# .each()

+ [jquery each function](http://www.sitepoint.com/jquery-each-function-examples/)
