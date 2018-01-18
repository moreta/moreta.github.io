---
title: javascript Web Storage
date: 2015-06-27
tags: js, storage, localStorage
---

Web Storage
==================

DOM Storage は Cookie の代わりとなるもので、より大容量で、より安全かつ簡単に情報を保存できるように設計されています

## Basic concepts

### sessionStorage

sessionStorage maintains a separate storage area for each given origin that's available for the duration of the page session (as long as the browser is open, including page reloads and restores).

### localStorage

localStorage does the same thing, but persists even when the browser is closed and reopened.


## localStorage

### Setting values in storage

```js
function populateStorage() {
  localStorage.setItem('bgcolor', document.getElementById('bgcolor').value);
  localStorage.setItem('font', document.getElementById('font').value);
  localStorage.setItem('image', document.getElementById('image').value);

  setStyles();
}
```

#### json

基本的にはstringのkeyとvalueなので、jsonを保存する際には`JSON.stringify(object)`を使うこと

```js
return localStorage.setItem(namespace, JSON.stringify(data));
```

またgetItemを利用するときにはこのように書く

```js
var store = localStorage.getItem(namespace);
return (store && JSON.parse(store)) || [];
```

### clear

`localStorage.clear()`

```js
function populateStorage() {
  localStorage.setItem('bgcolor', 'red');
  localStorage.setItem('font', 'Helvetica');
  localStorage.setItem('image', 'myCat.png');

  localStorage.clear();
}
```

### remove

`localStorage.removeItem(keyName);`
 
```js
function populateStorage() {
  localStorage.setItem('bgcolor', 'red');
  localStorage.setItem('font', 'Helvetica');
  localStorage.setItem('image', 'myCat.png');

  localStorage.removeItem('image');
}
```


# references
+ [Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)
+ [Using the Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API/Using_the_Web_Storage_API)
+ [web-storage-demo :github](https://github.com/mdn/web-storage-demo)
+ [DOM Storage - 古い文書: MDN](https://developer.mozilla.org/ja/docs/DOM/Storage#Storage)
+ [HTML5 FEATURES - STORAGE](http://www.html5rocks.com/en/features/storage)

## npms

+ [simple localStorage adapter(wrapper)](https://github.com/suprMax/local-storage-adapter)