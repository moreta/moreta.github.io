---
title : Java jsr310 date and time api
data: 2016-07-12
tags: java, date
---


# java.util.time

+ `Instant`
  + An Instant represents a point in time (similar to java.util.Date) with nanoseconds precision (unlike the old Date which has milliseconds precision)
  + `Instant.toString()` returns a ISO8601 formatted string -> 2013-06-25T16:22:52.966Z
+ `LocalDate`
  + LocalDate represents a date without a time zone
  + 1-1-2000
+ `LocalTime`
  + LocalTime represents time without a time zone
  + 04:44:59.12
+ `LocalDateTime`

# `LocalDate` & `LocalTime`

```java
LocalDate localDate = LocalDate.now();
localDate = LocalDate.ofYearDay(2005, 86); // The 86th day of 2005 (27-Mar-2005)
localDate = LocalDate.of(2013, Month.AUGUST, 10); //10th of Aug 2013

LocalTime localTime = LocalTime.of(22, 33); //10:33 PM
localTime = LocalTime.now();
localTime = LocalTime.ofSecondOfDay(4503); // The 4,503 second in a day (1:15:30 AM)
```

# `LocalDateTime`

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


# References

+ [Java 8 APIs: java.util.time - Instant, LocalDate, LocalTime, and LocalDateTime](https://dzone.com/articles/java-8-apis-javautiltime)
