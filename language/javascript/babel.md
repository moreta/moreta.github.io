---
title: babel
date: 2015-12-03
tags: es6, javascript
---

babel
=======

This article wrote based babel6

+ [setting-up-babel-6](http://babeljs.io/blog/2015/10/31/setting-up-babel-6/)

# Installing Babel

`babel` packageがもうない

```
$ npm install --global babel-cli
# or
$ npm install --save-dev babel-core
```

# .babelrc

変換を行う際のバージョン指定をこちらで行うのが便利です。package.jsonと同じ場所に設置してください。

```
$ npm install babel-preset-es2015
```


.babelrc
```
{
    "presets": ["es2015"]
}
```


# Require Hook

+ 使用するとES6などのファイルをrequire出来るようになるものです。
+ 基本的にnode_modulesはignore

以前のコード

```
require("babel/register");  // Bad Code!!
```

バージョン指定有り

```
require("babel-core/register")({
    "presets": ["es2015"]
});
```

.babelrcのバージョン指定を使用する例 - .babelrcから読み込むので指定する必要ない

```
require("babel-core/register");
```

# stageについて



# References

+ [babel6での変更点　Gulp・Webpackの設定](http://qiita.com/kamijin_fanta/items/e8e5fc750b563152bbcf)

# stageとは？



