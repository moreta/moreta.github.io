---
title: Port forward
date: 2014-07-21
tags: ipfw, mac, port-forword, iptable
---

Port forward
============



## java.net.BindException: permission denied: 80

Linuxまたは OSXでは 1024以下のポートをrootではないユーザーが開くのを強化しない

### 回避方法

#### ipfw(OSX)

<http://wiki.apache.org/tomcat/TomcatOnMacOS>

```sh
sudo ipfw list # 設定状況を確認
sudo ipfw add 100 fwd 127.0.0.1,8080 tcp from any to any 80 in
sudo ipfw flush # 設定を戻す
```

#### script

<https://gist.github.com/moreta/d120a7430425e0b13ce1>

#### iptable port forward(linux)

8080 to 80へ

`iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080`

`iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080`



#### authbind(OSX)

やってみてない

<https://github.com/Castaglia/MacOSX-authbind>


#### authbind(linux)

やってみてない

<http://d.hatena.ne.jp/n314/20110815/1313384712>
