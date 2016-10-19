---
title: Vue.js
date: 2014-11-15
tags: vuejs, MVVM, js
---

vue.js v1.0基準で書き直そう


## install

### rails

```
source 'https://rails-assets.org'
gem 'rails-assets-vue'
```

```
app/assets/javascripts/application.js
//= require vue
```

## Vue Constructor


### Instantiation Options.

<http://vuejs.org/api/options.html>

## ajax

##  Filter

messagesはcapitalize functionに渡されて結果を表示する

`<div>{{message | capitalize}}</div>`


## Components


<http://vuejs.org/guide/components.html>

全ての compomentsはvueのinstanceである。

```
<div v-component="my-component">
  <!-- internals handled by my-component -->
</div>
```


## Mustache Bindings


#### このように mustacheを利用してbindingもできる

`<div id="person-{{id}}">Hello {{name}}!</div>`

しかし、２つの注意点が

* <image>のsrc attributeはHTTP requestを発生させるため最初のparsingで404が帰ってくるので、`v-attr`
* IEは invalidなstyle attributeを削除する。なので、`v-style`が推奨される

#### unescaped HTML

`{{{ safeHTMLString }}}`

#### one-time only interpolation, which dose not react to data changes.

`{{* onlyOnce }}`


# Building Larger Apps

<http://vuejs.org/guide/application.html>

ajax, routingなどvuejsを利用してapp作るときの必要なものが書いてあるので、ぜひ読んでおいで。

# References

## sample code

+ [Vue.jsを使って、簡易メモアプリを作る。facebookログイン機能付き](http://qiita.com/akifo/items/114398e718b43245f241)
