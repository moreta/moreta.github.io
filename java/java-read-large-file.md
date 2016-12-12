


# Reading In Memory

GuavaやApache Common IOで提供するのを利用する例

```java
Files.readLines(new File(path), Charsets.UTF_8);
FileUtils.readLines(new File(path));
```

全部処理すると以下のようにメモリがか消費される( ~2 Gb)

```
[main] INFO  org.baeldung.java.CoreJavaIoUnitTest - Total Memory: 2666 Mb
[main] INFO  org.baeldung.java.CoreJavaIoUnitTest - Free Memory: 490 Mb
```

これの問題は**メモリに全てのfile内容をのせること**

ここで、この問題を解決するため*Streaming*を利用する。



# Streaming Through the File

## Streaming with java8 File + Stream

+ <https://www.mkyong.com/java8/java-8-stream-read-a-file-line-by-line/>
+ <http://qiita.com/nishemon/items/a96cb6e14161f3ca8ee4>

```java
package com.mkyong.java8;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class TestReadFile2 {

  public static void main(String args[]) {

    String fileName = "c://lines.txt";
    List<String> list = new ArrayList<>();

    try (Stream<String> stream = Files.lines(Paths.get(fileName))) {

      //1. filter line 3
      //2. convert all content to upper case
      //3. convert it into a List
      list = stream
          .filter(line -> !line.startsWith("line3"))
          .map(String::toUpperCase)
          .collect(Collectors.toList());

    } catch (IOException e) {
      e.printStackTrace();
    }

    list.forEach(System.out::println);

  }

}
```


## Streaming with java.util.Scanner

```java
FileInputStream inputStream = null;
Scanner sc = null;
try {
    inputStream = new FileInputStream(path);
    sc = new Scanner(inputStream, "UTF-8");
    while (sc.hasNextLine()) {
        String line = sc.nextLine();
        // System.out.println(line);
    }
    // note that Scanner suppresses exceptions
    if (sc.ioException() != null) {
        throw sc.ioException();
    }
} finally {
    if (inputStream != null) {
        inputStream.close();
    }
    if (sc != null) {
        sc.close();
    }
}
```

以下のような結果になる
```
[main] INFO  org.baeldung.java.CoreJavaIoUnitTest - Total Memory: 763 Mb
[main] INFO  org.baeldung.java.CoreJavaIoUnitTest - Free Memory: 605 Mb
```

## Streaming with Apache Commons IO

+ LineIteratorを利用

```java
LineIterator it = FileUtils.lineIterator(theFile, "UTF-8");
try {
    while (it.hasNext()) {
        String line = it.nextLine();
        // do something with line
    }
} finally {
    LineIterator.closeQuietly(it);
}
```

```
[main] INFO  o.b.java.CoreJavaIoIntegrationTest - Total Memory: 752 Mb
[main] INFO  o.b.java.CoreJavaIoIntegrationTest - Free Memory: 564 Mb
```

## Streaming with Guava

+ LineProcessor?を利用

以下、line count例
```java
int nLines = Files.readLines(file, charset, new LineProcessor<Integer>() {
  int count = 0;
  Integer getResult() {
    return count;
  }
  boolean processLine(String line) {
    count++;
    return true;
  }
});
```


# References

+ [How to Read a Large File Efficiently with Java](http://www.baeldung.com/java-read-lines-large-file)
+ [Java 8 Stream – Read a file line by line](https://www.mkyong.com/java8/java-8-stream-read-a-file-line-by-line/)
+ [apache commons-io User guide](https://commons.apache.org/proper/commons-io/description.html)
+ [API for simple File (line count) functions in Java](http://stackoverflow.com/questions/9691420/api-for-simple-file-line-count-functions-in-java)
+ [Guava: Google Core Libraries for Java](https://github.com/google/guava)
