---
title: webpack Basic
data: 2014-12-01
tags: webpack
---

# Install

```
npm install webpack
```

# CLI

<http://webpack.github.io/docs/cli.html>

`webpack <entry> <output>`


## cli options

+ webpack : for building once for development
+ webpack -d : Development shortcut
  + to include source maps
  + Equals to `--debug --devtool source-map --output-pathinfo`
+ webpack -p : Production shortcut
  + for building once for production (minification)
  + Equals to `--optimize-minimize --optimize-occurence-order`
+ webpack --watch – for continuous incremental build
+ webpack --colors – for making things pretty

### webpack -pの sample

```js
NODE_ENV=production webpack -p
```

### process.env

本来nodejsの環境変数

このようにわたしたら
```sh
NODE_ENV=production webpack -p
```

このように参照できる

```js
process.env.NODE_ENV
```



# ローダーとは？( WHAT ARE LOADERS?)

* transformerである。
* loaderを通って新しいファイルに変換される。
* browerifyのtransformerと同じ存在

* Loader can be chained.(chainができる, resourceをpipelineする[!で])
* synchronousにもasynchronousにもできる


## list of loader

<http://webpack.github.io/docs/list-of-loaders.html>

## loaderの利用方法

* requireで利用
* webpackのconfigureに設定
* webpackのcliで

###  jsファイルの中でrequireに中に入れる

```js
require("!style!css!less!bootstrap/less/bootstrap.less");
```

### configuration

```js
{
    module: {
        loaders: [
            { test: /\.jade$/, loader: "jade" },
            // => "jade" loader is used for ".jade" files

            { test: /\.css$/, loader: "style!css" },
            // => "style" and "css" loader is used for ".css" files
            // Alternative syntax:
            { test: /\.css$/, loaders: ["style", "css"] },
        ]
    }
}
```

### css-loader

Webpack allows you to require CSS in JS file, then preprocessed CSS file with CSS-loader.

+ 基本的にはstyle-loaderと一緒に使われる
+ chainするときには**後ろのloaderから適用される**

```js
module: {
    loaders: [
      {test: /\.js[x]?$/, exclude: /node_modules/, loader: 'babel-loader'},
      {test: /\.css$/, loader: 'style-loader!css-loader'}, // style-loaderはhtmlに<style>tagを入れる, css-loaderは cssをロードする
    ]
  }
```

#### local css & or css module?

<https://medium.com/seek-ui-engineering/the-end-of-global-css-90d2a4a06284#.5h5snec3x>

```
loader: 'css?localIdentName=' + (
  process.env.NODE_ENV === 'development' ?
    '[name]__[local]___[hash:base64:5]' :
    '[hash:base64:5]'
)
```


# code splitting

+ <http://webpack.github.io/docs/code-splitting.html>

+ webpackは`chunk`単位でコードを分離
+ chunkは呼ばれるタイミングでloadされる

## 誤解しない

webpackのcode splittingは単純に共通の部分を抽出するだけではない。
initialダウンロードを小さくし、必要なタイミング(on demand)で呼び出す目的もある。

Code Splitting is not just about extracting common code into a shared chunk. The more notable feature is that Code Splitting can be used to split code into an on demand loaded chunk. This can keep the initial download small and downloads code on demand when requested by the application

## load code on-demand (必要なタイミングでコードをloadする方法)

### CommonJSは `require.ensure`

syntax

```js
require.ensure(dependencies, callback)
```

callbackが呼ばされる際にdependenciesをロード

example

```js
require.ensure(["module-a", "module-b"], function(require) {
    var a = require("module-a");
    // ...
});
```

### ES6

+ サポートしていない
+ なので`require.ensure`を利用すること

```js
//static imports
import _ from 'lodash'

// dynamic imports
require.ensure([], function(require) {
  let contacts = require('./contacts')
})
```


# サーバー起動
このような設定が入っているので、
```
  "scripts": {
    "dev": "webpack --watch",
    "build": "webpack -p"
  },
```
これで実行できる
`npm run dev`

# resolve

- <https://webpack.github.io/docs/configuration.html#resolve>
- <https://webpack.github.io/docs/resolving.html>

## resolve.modulesDirectories

- An array of directory names to be resolved to the current directory as well as its ancestors, and searched for modules.
- This functions similarly to how node finds `node_modules` directories
- For example, if the value is ["mydir"], webpack will look in “./mydir”, “../mydir”, “../../mydir”, etc

`Default: ["web_modules", "node_modules"]`

ここを指定するときにはpathはいらない、directoryの名前だけで大丈夫    

## resolve.extensions

- An array of extensions that should be used to resolve modules.
- For example, in order to discover CoffeeScript files, your array should contain the string `.coffee`.

defaultは

`Default: ["", ".webpack.js", ".web.js", ".js"]`

これを指定するとdefaultをoverrideすることになるので注意すること



# Plugins

## DefinePlugin (Environment flags - jsの中で環境変数を使いたい)

main.js
```js
document.write('<h1>Hello World</h1>');

if (__DEV__) {
  document.write(new Date());
}
```

webpack.config.js
```js
var webpack = require('webpack');

var devFlagPlugin = new webpack.DefinePlugin({
  __DEV__: JSON.stringify(JSON.parse(process.env.DEBUG || 'false'))
});

module.exports = {
  entry: './main.js',
  output: {
    filename: 'bundle.js'
  },
  plugins: [devFlagPlugin]
};
```

pass Environment

* これを npm scriptではどうする？

```
env DEBUG=true webpack-dev-server
```
or package.json
```js
"scripts": {
  "debug": "DEBUG=true webpack -p"
},
```

## ExtractTextPlugin


# bootstrap scss

<https://github.com/jtangelder/sass-loader/blob/master/test/bootstrapSass/webpack.config.js>

# Webpack — The Confusing Parts

+ [Webpack — The Confusing Parts](https://medium.com/@rajaraodv/webpack-the-confusing-parts-58712f8fcad9#.3z7w3crem)

これは読んで置いたほうがいい

## Webpack’s Core Philosophy

1. Everything is a moudule
2. Load only "what" you need and “when” you need


# References

+ [RequireJS等はもう古い。WebPackとは？](<http://ameblo.jp/ca-1pixel/entry-11884453208.html>)
+ [webpack demos](https://github.com/ruanyf/webpack-demos)
  + 一番simpleな例からはじまるのでわかりやすい
+ [Webpack — The Confusing Parts](https://medium.com/@rajaraodv/webpack-the-confusing-parts-58712f8fcad9#.3z7w3crem)
