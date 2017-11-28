---
title: Dart
date: 2014-04-02
tags: google, dart, javascript
---

## site

<https://www.dartlang.org/codelabs/darrrt/>

## 環境設定

```
DART_SDK=/YourDartSDKPaht/dart/dart-sdk
export PATH=$PATH:$DART_SDK/bin
```

## gitignore

<https://github.com/github/gitignore/blob/master/Dart.gitignore>

## pub 

### packaging with pub

<https://www.dartlang.org/tools/pub/get-started.html>

editorから packageをinstallすればいい

もし, terminalで `pub get`などpub commandをなげたいなら以下のpath設定を

<https://www.dartlang.org/tools/pub/installing.html>

1. `pubspec.yaml`をtop directoryに


```
name: my_app
dependencies:
  js: any
  intl: any
```

2.
```
cd my_app
pub get
```

### transformer

* <https://www.dartlang.org/tools/pub/glossary.html#transformer>
* <https://www.dartlang.org/tools/pub/assets-and-transformers.html>


*定義*

A transformer is a Dart object that converts input assets (such as Dart files or Polymer-formatted HTML) into output assets (such as JavaScript and HTML). 
The pub build command puts the generated assets into files. 
The pub serve command, on the other hand, doesn’t produce files; its generated assets are served directly by the dev server.

`pub serve`と`pub build`は

#### How transformer work

これはtransformerが何をするかの例

* The dart2js transformer, which reads in all of the .dart files for a program and compiles them to a single .js file.
* The polymer transformer, which converts HTML and Dart files into optimized HTML and Dart files.
* A linter that reads in files and produces warnings but no actual file.

##### `pub build`, `pub serve`

`pub build`は `.dart`ファイルを生成しない。
`pub serve`は 開発のため、Dartiumで動作するための`.dart`を生成する

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-04-02/assets-and-transformers.png)

##### 複数のtransformerを指定する場合
  
このように書く
```
transformers:
- [t1, t2]
- t3
```
t1, t2は並列で実行される、t3はt1,t2が終わってから実行される。

## command

<https://www.dartlang.org/tools/pub/#pub-commands>

```
pub build
pub cache
pub deps
pub get
pub publish
pub serve
pub upgrade
pub uploader
```

## scss

<http://pub.dartlang.org/packages/sass>

`import 'package:sass/sass.dart';`


### DartでJavascriptを利用する(Using JavaScript from Dart)

<https://www.dartlang.org/articles/js-dart-interop/>


```
<script src="packages/browser/dart.js"></script>
<script src="packages/browser/interop.js"></script>
```