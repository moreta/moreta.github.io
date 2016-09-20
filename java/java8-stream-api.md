---
title: Java8 Stream API
date: 2016-08-04
tags: stream, java, java8
---


# Stream APIでの非同期処理



| メソッド                             | 概要                                 | Since |
|:-------------------------------------|:-------------------------------------|:------|
| java.util.stream.BaseStream#parallel | 並列ストリームへの変換               | 1.8   |
| java.util.Collection#parallelStream  | コレクション要素の並列ストリーム取得 | 1.8   |
| java.util.SplittableRandom           | 乱数ストリームの生成                 | 1.8   |

+ Stream API並列ストリーム処理はFork/Joinフレームワーク上に実装されている。ExecutorServiceとしてForkJoinPool.commonPool()が利用される。
+ Streamに対して Stream#parallel を実行すると、Streamの各要素は並列に実行される。 逆に Stream#sequential を実行すると、逐次実行となる。
  + parallel/sequential はStream全体に対する設定である。 特定の中間操作のみを並列・逐次実行のどちらかに切り替えて実行するようにはなっていない。
  + もしこのような処理を行うのなら、一度終端操作でStreamを閉じ、新たにStreamを作成する必要がある

## 参考

+ [Java8 Stream でお手軽に並列処理しよう](http://www.techscore.com/blog/2016/01/04/java8-stream-%E3%81%A7%E3%81%8A%E6%89%8B%E8%BB%BD%E3%81%AB%E4%B8%A6%E5%88%97%E5%87%A6%E7%90%86%E3%81%97%E3%82%88%E3%81%86/)


## Sample

### stream instanceを作成

```java
// java.util.stream.Stream#of
Stream<String> stream = Stream.of("A", "B", "C")

// java.util.Arrays#stream
String<String> stream = Arrays.stream(new String[] {"A", "B", "C"})

// java.util.Collection#stream
List<String> list = Arrays.asList("A", "B", "C")
Stream<String> stream = list.stream();

// java.lang.CharSequence#chars
String str = "ABC";
IntStream streamf = str.chars()
```

### Stream#forEach



# References

+ [Java8 逆引き Stream API](http://qiita.com/nesheep5/items/da42df92397285d4ad0f)
+ [Java8 stream APIサンプルコード](http://qiita.com/rubytomato@github/items/93011c75ee4af6b59452)
