---
title: Mac caffeinate - Prevent system sleep until x
date: 2016-06-24
tags: mac, unix, screen, background, job, mac
---




# ディスプレイのスリープを抑制する

```
caffeinate -d
```

# システムのスリープを抑制する

```
caffeinate -i
```

# ハードディスクの回転を停止させないようにする

```
caffeinate -m
```

# 電源アダプタ接続時にシステムのスリープを抑制する

```
caffeinate -s
```

# 指定した時間ディスプレイのスリープを抑制する

例えば1時間(=3600s)なら

```
caffeinate -u -t 3600
```

# 時間計算が面倒なときは、例えばRubyを使って（下の例では1時間17分）

```
ruby -e "print (60+17)*60" | xargs caffeinate -u -t
```

# 指定したコマンドを実行している間スリープを抑制する

例えば、何かmakeしているときシステムにスリープさせたくないときは

```
caffeinate -i make
```


# ssh connectionを活かしておこう。

```
caffeinate -s ssh server.example.com.
```

# Alfred2 workflow

+ <http://www.packal.org/workflow/caffeinate-control>
+ <http://qiita.com/DriftwoodJP/items/6bee03df0a0da499320a>

# References


+ [CAFFEINATE(8)](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/caffeinate.8.html)
+ [](http://unix.stackexchange.com/questions/1786/os-x-how-to-keep-the-computer-from-sleeping-during-a-ssh-session)
+ [Mac OS X 10.8以降で一時的にスリープを抑制するコマンド: caffeinate](http://henry.animeo.jp/blog/2013/12/07/caffeinate/)
