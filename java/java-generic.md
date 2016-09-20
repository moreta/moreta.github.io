---
title: Java Generic
date: 2016-09-16
tags: java, generic
---

# <>は場所によって数種類に分類される

+ 型変数の宣言
+ 型変数へのバインド
+ 変数の型の宣言
+ 型変数での変数宣言

## 型変数の宣言と型変数へのバインドの例

```java
// Tは「仮型引数」
public class Hoge<T> {}
```

new するときに「型変数へのバインドする」
```java
// Stringは「実型引数」
new Hoge<String>();
```

## 変数の型の宣言

上で「型変数へのバインド」したもとを受け取る変数で使う

```java
//
Hoge<String> hoge = new Hoge<String>();

// ワイルドカードを使う場合には
Hoge<?> hoge = new Hoge<String>();
```

# ワイルドカード ?

+ superとextendsで境界を設定
+ &による複数のinterfaceの継承は表現できない

以下のようなclass構造があったとして
```java
public class A {}
public class B extends A {}
public class C extends B {}
```

以下のような結果になる

```java
Hoge<A> a = new Hoge<B>(); // コンパイルエラー！
Hoge<? extends A> a = new Hoge<B>();　// このように書く
```

## `<? extends B>` と `<? super B>`

+ カバーする方向が反対
+ 上記の例からみると
  + `<? extends B>`
    + B, CがOK
  + `<? super B>`
    + Bとその親であるAがOK

### 複数interfaceを持つclassを指定


```java
<T extends ClassA & InterfaceB>
```



# References

+ [Java ジェネリクスのポイント](http://qiita.com/pebblip/items/1206f866980f2ff91e77)
+ [Javaジェネリクス再入門 - 大変理解しやすかった](http://d.hatena.ne.jp/Nagise/20101105/1288938415)
  + [ジェネリクスの代入を理解する その1](http://blogs.wankuma.com/nagise/archive/2008/08/18/153424.aspx)
  + [ジェネリクスの代入を理解する その2](http://blogs.wankuma.com/nagise/archive/2008/08/20/153557.aspx)
+ [Java Generics Wildcarding With Multiple Classes](http://stackoverflow.com/questions/745756/java-generics-wildcarding-with-multiple-classes)
