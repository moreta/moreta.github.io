---
title: emberjs fileupload
date: 2014-01-22
tags: emberjs, file
---


file uploadの際にこれも使う。

<https://developer.mozilla.org/ja/docs/Web/Guide/Using_FormData_Objects>


## emberjsでfileupload

* <http://stackoverflow.com/questions/13923122/ember-js-upload-file-component>
* <http://devblog.hedtek.com/2012/04/brief-foray-into-html5-file-apis.html>
* <http://chrismeyers.org/2012/06/12/ember-js-handlebars-view-content-inheritance-image-upload-preview-view-object-binding/>

## FileReader.readAsDataURL

<https://developer.mozilla.org/en-US/docs/Web/API/FileReader.readAsDataURL>

Fileを読み込んでん画像を表示

``` html
<input type="file" onchange="previewFile()"><br>
<img src="" height="200" alt="Image preview...">
```


``` js
function previewFile() {
  var preview = document.querySelector('img');
  var file    = document.querySelector('input[type=file]').files[0];
  var reader  = new FileReader();

  reader.onloadend = function () {
    preview.src = reader.result;
  }

  if (file) {
    reader.readAsDataURL(file);
  } else {
    preview.src = "";
  }
}
```

## with Rails carrierwave

base64でencodeされたファイルをサーバ側で受け取って保存する方法

<http://stackoverflow.com/questions/6718841/restful-file-uploads-with-carrierwave>