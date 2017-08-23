---
title: gulp
data: 2014-12-08
tags: javascript, gulp
---

できるためnpm scriptを使うのをおすすめする

# Getting Started

## install gulp globally

`npm install --global gulp`


## 2. install gulp in your project devDependencies:


```
cd /your/project/path
npm install --save-dev gulp
```

## 3. Create a gulpfile.js at the root of your project

```js
var gulp = require('gulp');
gulp.task('default', function(){
  // place code for your default task here
});
```

## 4. Run gulp

`gulp`


# tutorial


## npm 準備


```
cd /your/project/path
npm init # package.jsonが生成される

This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg> --save` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
name: (react-browerify)
version: (1.0.0)
description:
entry point: (index.js)
test command:
git repository:
keywords:
author:
license: (ISC)
About to write to /Users/path-to/package.json:

{
  "name": "react-browerify",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}

```

## gulp install

### 1. gulp install globally

`npm install gulp -g`

### 2. パッケージを開発用パッケージとしてインストールする

`npm install gulp --save-dev`

すると

1. package.jsに以下のコードが入る

```
"devDependencies": {
  "gulp": "^3.9.0"
}
```

2. node_modules/gulp folderが生成される


# Usage

## gulp.task(name[, deps], fn)

+ <https://github.com/gulpjs/gulp/blob/master/docs/API.md#gulptaskname-deps-fn>

taskを定義する

```js
// normal
gulp.task('somename', function() {
  // Do stuff
});

// taskの実行dependencyがある場合にarrayで定義
gulp.task('mytask', ['array', 'of', 'task', 'names'], function() {
  // Do stuff
});
```

### Async task support

asyncにtaskを実行することもサーポートする

## pipe

+ <http://nodejs.org/api/stream.html#stream_readable_pipe_destination_options>
+ <http://nodejs.jp/nodejs.org_ja/api/stream.html#stream_readable_pipe_destination_options>

+ `pipe`はnodejsのStream api
+ ReadableStreamの結果をWritableStreamに繋ぐ

gulpはnodejsのStream apiを利用しているので`pipe`は重要なメソッドである。

## gulp.dest(path[, options])

+ <https://github.com/gulpjs/gulp/blob/master/docs/API.md#gulpdestpath-options>

pipeされたfileを指定場所にwriteする

```js
gulp.src('./client/templates/*.jade')            // 1. *.jadeを読み込んで
  .pipe(jade())                                  // 2. jadeでcompile
  .pipe(gulp.dest('./build/templates'))          // 3. 2の結果を build/templatesへ保存
  .pipe(minify())                                // 4. 2の結果を minifyする
  .pipe(gulp.dest('./build/minified_templates'));// 5. 4の結果を build/minified_templatesへ保存
```  


# gulp側でES6に対応する

gulpはv3.9.0からbabelを標準サポートするようになったので、babelを介してES6構文を利用できるようになりました。

ただし、ES6構文を使う場合は、ファイル名を`gulpfile.babel.js`にする必要があります

1. gulpのバージョンを3.9.0以上にupdate
2. gulpfile.jsのファイル名を、gulpfile.babel.jsに変更
