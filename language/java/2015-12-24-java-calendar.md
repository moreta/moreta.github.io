---
title: Java Date and Calendar
date: 2015-12-24
tags: java, calendar, date
---

Java Date and Calendar
======================

# Calendar.add() vs Calendar.roll()

+ [calendar add vs roll](http://stackoverflow.com/questions/2504141/calendar-add-vs-roll-when-do-we-use-it)
+ [Java 日付時刻・カレンダー](http://www.ne.jp/asahi/hishidama/home/tech/java/date.html)
+ `Calendar.roll()`はうるう秒にバグがある

`Calendar.roll()`は使わないほうがいい


# start time & end time

## After Java8

```java

public static Date getEndOfDay(Date date) {
  LocalDateTime localDateTime = dateToLocalDateTime(date);
  LocalDateTime endOfDay = localDateTime.with(LocalDateTime.MAX);
  return localDateTimeToDate(endOfDay);
}

public static Date getStartOfDay(Date date) {
  LocalDateTime localDateTime = dateToLocalDateTime(date);
  LocalDateTime startOfDay = localDateTime.with(LocalDateTime.MIN);
  return localDateTimeToDate(startOfDay);
}

private static Date localDateTimeToDate(LocalDateTime startOfDay) {
  return Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
}

private static LocalDateTime dateToLocalDateTime(Date date) {
  return LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
}
```

## Java 7 and Earlier

With Apache Commons

```java
public static Date getEndOfDay(Date date) {
    return DateUtils.addMilliseconds(DateUtils.ceiling(date, Calendar.DATE), -1);
}

public static Date getStartOfDay(Date date) {
    return DateUtils.truncate(date, Calendar.DATE);
}
```

Without Apache Commons

```java
public Date getEndOfDay(Date date) {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    calendar.set(Calendar.HOUR_OF_DAY, 23);
    calendar.set(Calendar.MINUTE, 59);
    calendar.set(Calendar.SECOND, 59);
    calendar.set(Calendar.MILLISECOND, 999);
    return calendar.getTime();
}

public Date getStartOfDay(Date date) {
    Calendar calendar = Calendar.getInstance();
    calendar.setTime(date);
    calendar.set(Calendar.HOUR_OF_DAY, 0);
    calendar.set(Calendar.MINUTE, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MILLISECOND, 0);
    return calendar.getTime();
}
```


# References

+ [How to obtain the start time and end time of a day?](http://stackoverflow.com/questions/10308356/how-to-obtain-the-start-time-and-end-time-of-a-day)
