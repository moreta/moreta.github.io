---
title: Java Unit Test - Mockito
date: 2016-09-08
tags: java, unit, test, mockito
---

# @Spy

+ 特定のメソッドだけをモックにしたい

# @Mockと@Spyの違い

+ @Mock : 全てのメソッドがモック化
+ @Spy : 一部のメソッドのみをモック化


#

+ `when(...) thenReturn(...)` makes a real method call
+ `doReturn(...) when(...)` does not call the method at all
