---
title: webpack - html-webpack-plugin
data: 2016-08-12
tags: webpack
---


# Support multiple Webpack entries

entry毎に htmlファイルを作りたい場合

<https://github.com/ampedandwired/html-webpack-plugin/issues/299>


```js
var entry: {
        a: "./a",
        b: "./b",
        c: ["./c", "./d"]
};

var entryHtmlPlugins = Object.keys(entry).map(function(entryName) {
   return new HtmlWebpackPlugin({
      filename: entryName + '.html',
      chunks: [entryName]
  })
});

module.export = {
   entry: entry,
   //....
  plugins: [
      // ..
  ].concat(entryHtmlPlugins)
}
```
