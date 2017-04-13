---
title: UNIX top
date: 2016-07-29
tags: unix, command, top, cpu
---


# multi core cpuの確認
`1`を利用する

```
top
> h
  1,I       Toggle SMP view: '1' single/separate states; 'I' Irix/Solaris mode
```

通常の表示は以下

```
Tasks: 119 total,   1 running, 118 sleeping,   0 stopped,   0 zombie
Cpu(s):  9.9%us,  1.2%sy,  0.0%ni, 87.4%id,  0.0%wa,  0.2%hi,  1.2%si,  0.0%st
```

ここで '1'すると以下のようになる

```
Tasks: 119 total,   1 running, 118 sleeping,   0 stopped,   0 zombie
Cpu0  :  0.7%us,  0.0%sy,  0.0%ni, 99.3%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu1  :  0.3%us,  0.0%sy,  0.0%ni, 99.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu2  :  0.3%us,  0.0%sy,  0.0%ni, 99.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu3  : 36.9%us,  5.0%sy,  0.0%ni, 51.8%id,  0.0%wa,  1.3%hi,  5.0%si,  0.0%st
```

# 実行しているscriptなのを確認

`c`を利用

```
top
> h
  c,i,S   . Toggle: 'c' cmd name/line; 'i' idle tasks; 'S' cumulative time
```

# 表示のソート

topで起動してから

```
M # メモリ使用率順
P # CPU使用率順
```


# References

+ [topコマンドの使い方](http://qiita.com/k0kubun/items/7368c323d90f24a00c2f)
