---
title: React.js environment
date: 2015-06-28
tags: js, react
---

# introduction

+ ECMAScript 6 構文のサポートおよび JSX ファイルのコンパイルに Babel を利用
+ 依存モジュールの管理(CommonJS準拠)に Browserify を利用
+ タスクランナーとして gulp を利用

# npm init

`npm init`

 をして、適用に入れる。すると `package.json`が生成される


## package.json

```json
{
  "name": "react-template",
  "version": "0.0.0",
  "description": "reactjs project template",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```


## npm scritpを利用する場合

```
npm install --save-dev react
npm install --save-dev browserify
npm install --save-dev babelify
```

### browserifyを実行するとError: EMFILE

EMFILEはToo many open filesらしい

```
$ browserify lib/index.js
Error: EMFILE, open '/tmp/exmaple/node_modules/react/package.json'
```

ファイルディスクリプタの上限をulimitで増やす
macのdefault 256なので増やしてあげる
````
ulimit -n
256
```

`ulimit -n 512`

#### mac setting (Mavericksから)

<http://unix.stackexchange.com/questions/108174/how-to-persist-ulimit-settings-in-osx-mavericks>

+ -n	ファイル・ディスクリプタの数を最大N個に制限する
+ -u	ユーザー1人が起動できるプロセス数を最大N個に制限する

mac default

```
ulimit -n
256
ulimit -u
709
```

`/etc/profile` or `.bash_profile`

多分このくらいの設定で大丈夫だと思うが

```
ulimit -n 1024
```

もっと大きく指定したいなら

`/etc/launchd.conf`

```
limit maxfiles 16384 16384
limit maxproc 2048 2048
```



## gulpを利用する場合

今後はgulp, gruntなどを利用せずにnpm scriptだけするのをおすすめ

### 必要なmoduleをinstall - gulpを利用する場合

```
npm install --save-dev react
npm install --save-dev browserify
npm install --save-dev babelify
npm install --save-dev vinyl-source-stream
npm install --save-dev gulp
npm install --save-dev gulp-webserver
```
これを実行すると package.jsonが自動で更新される `Gemfile.lock`みたいないもんかな

### babelify

babelify は Browserify 用の Babel 変換ライブラリ。
JSX の変換もやってくれる

#### babal?

ここがややこしい、以下のlinkを見ると

<http://babeljs.io/docs/setup/>

babelは gulpでも browserifyでも利用できる？じゃ、なにですればいい？

1. babelはbrowserifyで利用する
2. browserifyのbuildのためにgulpを利用する形


### vinyl-source-stream

gulp で Browserify を扱う際に利用します


## gulpfile.js


```

var gulp = require('gulp');
var browserify = require('browserify');
var babelify = require('babelify');
var source = require('vinyl-source-stream');
var webserver = require('gulp-webserver');

gulp.task('browserify', function() {
  browserify('./app.jsx', { debug: true })
    .transform(babelify)
    .bundle()
    .on("error", function (err) { console.log("Error : " + err.message); })
    .pipe(source('bundle.js'))
    .pipe(gulp.dest('./'))
});

gulp.task('watch', function() {
  gulp.watch('./*.jsx', ['browserify'])
});

gulp.task('webserver', function() {
  gulp.src('./')
    .pipe(webserver({
      host: '127.0.0.1',
      livereload: true
    })
  );
});

gulp.task('default', ['browserify', 'watch', 'webserver']);
```

## gulp実行

```
gulp # 引数なしですると default task
gulp [task_name]
```


# Component

+ <http://react-components.com/>



# reference








