---
title : Java jsr310 date and time api
data: 2016-07-12
tags: java, date
---


<https://matsumana.info/blog/2014/06/17/jsr310-parse-from-string/>


before
```java
@Test
public void デフォルトでは存在しない日付をパースしても例外にならない() {
    LocalDateTime expected = LocalDateTime.of(2014, 4, 30, 3, 4, 5, 123_000_000);

    // 存在しない日付
    LocalDateTime actual = LocalDateTime.parse("2014/04/31 03:04:05.123",
            DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss.SSS"));

    // 存在しない日の前日にパースされる
    assertThat(actual, is(expected));
}
```

after : 存在しないdateなら 例外が発生する
```java
@Test
public void 厳密モード() {
    LocalDateTime expected = LocalDateTime.of(2014, 4, 30, 3, 4, 5, 123_000_000);

    // 存在しない日付
    // yyyyですると ISOエラーが発生
    //LocalDateTime actual = LocalDateTime.parse("2014/04/31 03:04:05.123",
    //        DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss.SSS").withResolverStyle(ResolverStyle.STRICT));
    LocalDateTime actual = LocalDateTime.parse("2014/04/31 03:04:05.123",
            DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm:ss.SSS").withResolverStyle(ResolverStyle.STRICT));
    assertThat(actual, is(expected));
}
```
