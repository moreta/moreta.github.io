---
title: Parallel(並列処理) & thread
date: 2014-05-13
tags: parallel, thread
---

# ruby

+ [Ruby: parallel processing made simple and fast](https://github.com/grosser/parallel)
+ <http://morizyun.github.io/blog/parallel-process-ruby-gem/>
+ <http://www.hyuki.com/yukiwiki/wiki.cgi?WhatThreadsafeRailsMeans>

# java

## ConcurrentHashMap

HashMap, HashTable, ConcurrentHashMapに比較

+  <http://software.fujitsu.com/jp/technical/interstage/apserver/guide/pdf/concurrenthashmap-20120105.pdf>
+ HashMap - thread not safe
+ HashTable - thread safe. but slow
  + 使わない
+ ConcurrentHashMap - thread safe. fast
