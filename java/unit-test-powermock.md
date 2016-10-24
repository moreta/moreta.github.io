---
title: Java Unit Test - Powermock
date: 2016-09-23
tags: java, unit, test, powermock
---

Powermock
==============


# `@PrepareForTest`

static methodをもつclassをテストするときに利用

```java
@PrepareForTest({Xxx.class})
public class XxxTest {
```
