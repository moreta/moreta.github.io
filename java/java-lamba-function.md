------  ----------  --------  -------  --------
title:  Java        Function                   
date:   2016-08-04                             
tags:   stream,     java,     lambda,  function
------  ----------  --------  -------  --------

# predicateと function

+ predicateのreturn -> boolean
+ functionのreturn -> result

# java.util.functionパッケージ

　Java 8は、汎用的に使える関数型インターフェースは「java.util.function」パッケージで用意しています。Java 8から追加された新しいメソッドで関数型インターフェースを引数に持つメソッドの多くは、引数にこのパッケージで用意した関数型インターフェースを使っています。

関数型インターフェースのパターン

　java.util.functionパッケージのAPIを見てみると、幾つものインターフェースが追加されていて、うんざりする人がいるかもしれません。しかし、java.util.functionパッケージで用意されている関数型インターフェースは、受け取る引数と返す結果のパターンから大きく分けて4種類用意しています。そして、それらのインターフェース名からどのような処理を行うのかを分かりやすくするため、それらの性質に応じた名前が付けられています。

| 種類          | 実装するメソッド        | 概要                                                  |
|---------------|-------------------|-------------------------------------------------------|
| Function<T,R> | R apply(T t)      | 実装するメソッドは、引数としてTを受け取り、結果としてRを返すものになる         |
| Consumer<T>   | void accept(T t)  | 実装するメソッドは、引数としてTを受け取り、結果を返さず終了するものになる      |
| Predicate<T>  | boolean test(T t) | 実装するメソッドは、引数としてTを受け取り、boolean値を結果として返すものになる |
| Supplier<T>   | T get()           | 実装するメソッドは、何も引数として受け取らず、結果としてTを返すものになる       |

　また、それらから拡張したものとして次の関数型インターフェースも汎用的に使われます。

| 種類        | 実装するメソッド   | 概要                                                            |
|-------------|--------------|-----------------------------------------------------------------|
| Operator<T> | T apply(T t) | 実装するメソッドは、引数としてTを受け取り、結果としてTを返すものになる。Functionを拡張したもの |

　これらの中でFunction、Consumer、Predicate、Supplierはそれ自身の名前でインターフェースとして用意されていますが、Operatorだけの名前の関数型インターフェースはないので注意してください。その代わり、1つの引数を受け取るOperatorは「UnaryOperator<T>」、2つの同じ型の引数を受け取るものは「BinaryOperator<T>」のように定義されています。

# References

+ [関数型プログラミングって何、ラムダってなんだよ](http://qiita.com/lrf141/items/98ffbeaee42d30cca4dc)
+ [java.util.function以下の関数インターフェース使い方メモ](http://qiita.com/opengl-8080/items/22c4405a38127ed86a31#1-1)
+ [](http://www.atmarkit.co.jp/ait/articles/1404/30/news017.html)
+ [Java 8 Predicates and Functions](http://www.byteslounge.com/tutorials/java-8-predicates-and-functions)
  + chaining sampleなどがある
