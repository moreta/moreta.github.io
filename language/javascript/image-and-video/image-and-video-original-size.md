JsでImageとVideoのサイズを取得
==============================


[imageのサイズを取得する際の注意](https://qiita.com/gonshi_com/items/b7bef3544314503bb9df)

Javascriptでimageの幅と高さを取得したい場合、
cssが当たっているとオリジナル画像のサイズを取得することができない。

FirefoxやSafariでは naturalWidth や naturalHeight といったプロパティが用意されているが、
クロスブラウザで使うことができない。

従って、オリジナル画像のサイズを取得するには、
一時的にimageに対するcssを解除 (widthとheightをautoに ) してから取得するか、

新たに Imageオブジェクトを生成して取得する必要がある。

```js
var image = new Image();
var width;
var height;

image.onload = function(){
  width = image.width;
  height = image.height;
};
image.src = 'hogehoge.jpg';
```

# 他の方法
<https://css-tricks.com/measuring-image-widths-javascript-carefully/>

```js
// How wide the image is rendered at (which could be affected by styles)
console.log(img.width);

// How wide the image itself actually is
console.log(img.naturalWidth);
```

注意 : この場合 image downloadされ、renderされるまえにjavascriptが呼ばれると値は0になる


[imagesLoaded](https://imagesloaded.desandro.com/)を利用する例

```js
imagesLoaded(document.body, function() {
  var img = document.querySelector("img");
  console.log(img.width);
  console.log(img.naturalWidth);
});
```