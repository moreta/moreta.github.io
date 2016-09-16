---
title: Java Optional - java.util.Optional
date: 2016-08-12
tags: null, optional, java, java8
---


+ Optionalはただ単に値を保持しているだけだが、Optionalの各メソッドは、保持している値がnullか否かによって挙動が変わる。
  + 基本的に、null以外のときだけ処理が行われる

# Methods

| methods                    | != null  | == null                                  | Desc                                                                             |
|:---------------------------|:---------|:-----------------------------------------|:---------------------------------------------------------------------------------|
| Optional.ofNullable(value) | Optional | Optional.empty                           | Optionalオブジェクトを生成する。値がnullの場合はOptional.emptyが返る。           |
| Optional.of(value)         | Optional | NullPointerException - valueがnullの場合 | Optionalオブジェクトを生成する。値がnullの場合はNullPointerExceptionが発生する。 |


# References

+ [Java 8 "Optional" ～ これからのnullとの付き合い方 ～](http://qiita.com/shindooo/items/815d651a72f568112910)
+ [JavaのOptionalのモナド的な使い方](http://qiita.com/koher/items/6f4a8d8b3ad3142bf645)
+ [Class Optional<T>](https://docs.oracle.com/javase/jp/8/docs/api/java/util/Optional.html)
+ [Java Optional - hishidama](http://www.ne.jp/asahi/hishidama/home/tech/java/optional.html)
