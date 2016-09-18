---
title: ajax by superagent
date: 2014-11-16
tags: ajax, js
---

<http://smalljs.org/ajax/superagent/>

# 脱jQuery
 
<http://qiita.com/hashrock/items/3113690bb3de5bba639b>

AngularJSやVue.jsでは、DOMの直接操作は推奨されません。
そうなると、jQueryはAJAXでしか使わなくなります。
であれば、AJAX専用のライブラリにまかせてしまって、jQuery依存を外したくなってきます。
というわけで、AJAXだけをやってくれるライブラリとして、SuperAgentを導入してみましょう


# install

node, compomentは
<https://github.com/visionmedia/superagent>ここから

## rails assets

`gem 'rails-assets-superagent'`

application.js
```
//= require superagent
```



stand aloneを利用しているときには以下のように設定

`application.html.erb`

`var request = window.superagent;`

もし、npm or componentを使っているなら

`var request = require('superagent');`


#### 素直なGET
```
request
  .get(url)
  .end(function(res){
    console.log(res.text);//レスポンス
    //レスポンスがJSONの場合 
    console.log(res.body);//ここにparse済みのオブジェクトが入る
  });
```
#### クエリパラメータ付きGET
```
request
  .get(url)
  .query({user: "Taro"})
  .end(function(res){
    console.log(res.body);
  });
```
  
## POST

#### 単純なPOST

```
request
  .post(url)
  .send({name: name, text: text})
  .end(function(res){
    console.log(res.body);
  });
```
  
  
#### x-www-form-urlencoded
```
request
  .post(url)
  .type('form')
  .send({name: name, text: text})
  .end(function(res){
    console.log(res.body);
  });
```