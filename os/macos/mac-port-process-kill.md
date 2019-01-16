---
title: "Mac port 確認 & kill"
date: 2013-12-04
tags: mac, port
---


## ポート確認

```bash
netstat -anp tcp | grep 3000
```
If your netstat don't support -p, use lsof

```bash
lsof -i -P | grep 8080
lsof -i tcp:3000
```


<http://stackoverflow.com/questions/3855127/find-and-kill-process-locking-port-3000-on-mac>

### portsscan

System > Libray > CoreServices > Application >  Network Utility.app

>> portscan タブ