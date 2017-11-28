---
title: Java try-with-resources clause
date: 2016-08-04
tags: java, try, java7, java8
---

+ java7から
+ try-with-resources文を使用できるのは、
  + `java.lang.AutoCloseable`か
  + `java.io.Closeable`インターフェースの実装しているclass


# sample code

```java
class SampleFileReader implements AutoCloseable {
    @Override
    public void close() throws IOException {
        System.out.println("SampleFileReader Close.");
    }
}

class SampleBufferedReader implements AutoCloseable {
    @Override
    public void close() throws IOException {
        System.out.println("SampleBufferedReader Close.");
    }
}

...

try (SampleBufferedReader br = new SampleBufferedReader();
     SampleFileReader fr = new SampleFileReader()) {
    throw new IOException();
    System.out.println("--start--");
} catch (IOException e) {
    System.out.println("--IOException--");
} finally {
    System.out.println("--finally--");
}
```

# リソース解放されないパターン

+ 以下のコードの場合正常にnewされた場合には問題なくcloseされるが、
+ nestした new(例えば new BufferedWriter(..))で例外が発生するとcloseされない

```java
File file = new File("out.txt");
// PrintWriterがインスタンス生成に失敗すると、BufferedWriter・FileWriterが解放されない
try(PrintWriter pw =
        new PrintWriter(new BufferedWriter(new FileWriter(file)));) {
    // 処理
}
// ・・・
```

+ 解決法 : ネストせず個別に変数定義する


# References

+ [try-with-resourcesでリソース解放されないパターン](http://qiita.com/nesheep5/items/6a68d862c5902e5994a4)
