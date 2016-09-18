---
title: Material Design with Polymer & Dart
date: 2014-07-11
tags: polymer, material-design, polymer-element, dart
---


## polymerがmaterial design用で提供している elements

* <http://www.polymer-project.org/docs/elements/>
* [tutorial](http://dev.classmethod.jp/ria/html5/material-design-with-polymer-dart/)

## Dart pub

### core element 

<https://pub.dartlang.org/packages/core_elements>

### paper element 

<https://pub.dartlang.org/packages/paper_elements>



#### entry_points


`pub build`. 
The polymer transformers assume all files under web are possible entry points, 
this can be adjusted with arguments in your pubspec.yaml file. 
For example, you can say only web/index.html is an entry point as follows:

`web/index.html`だけがtransformers/polymerのbuild対象になる

```
transformers:
- polymer:
    entry_points: web/index.html
```    
