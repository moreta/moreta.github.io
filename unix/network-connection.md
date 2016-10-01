---
title: unit network connnection
date: 2014-10-20
tags: iptables
---

# 接続確認

## telnetとnetstatでポート番号の状態を確認する。

http://togattti.hateblo.jp/entry/2014/01/19/124912

## telnetで外部からポート番号が空いているか調べる

telnet xxx.xxx.xxx.xxx 80

# iptables

<http://www.atmarkit.co.jp/ait/articles/0503/18/news122.html>


# netstat

ex )`netstat -an |grep LISTEN`

```
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address               Foreign Address             State
tcp        0      0 127.0.0.1:1025              0.0.0.0:*                   LISTEN
tcp        0      0 127.0.0.1:55247             0.0.0.0:*                   LISTEN
tcp        0      0 0.0.0.0:80                  0.0.0.0:*                   LISTEN
tcp        0    928 172.31.19.9:22              126.70.81.15:51113          ESTABLISHED
tcp        0      0 127.0.0.1:5432              127.0.0.1:39018             ESTABLISHED
tcp        0      0 :::22                       :::*                        LISTEN
udp        0      0 172.31.19.9:123             0.0.0.0:*
udp        0      0 127.0.0.1:123               0.0.0.0:*
udp        0      0 0.0.0.0:123                 0.0.0.0:*
udp        0      0 127.0.0.1:50475             127.0.0.1:50475             ESTABLISHED
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node Path
unix  2      [ ACC ]     STREAM     LISTENING     8772   /tmp/.s.PGSQL.5432
```

127.0.0.1は前の方が書いているとおりループバックアドレスといってマシン自体を表すアドレスです。

次に0.0.0.0ですが、LISTENING状態のものにしか出ていないと思いますがLocal AddressとForeign Addressで少し意味が違います。
Local Addressの0.0.0.0はマシンが持っているすべてのIPアドレスを表しています。つまりマシンが複数のIPを持っていた場合、マシンの持つすべてのIPアドレスにおいて接続を受け付けているということになります。
それとは違いLocal Addressが指定されている場合は、接続先アドレスがそのアドレスの接続しか受け付けないようになっています。

Foreign Addressが0.0.0.0の場合、これはどんなIPアドレスからでも接続を受け付けているという意味になります。

### Stat
フィルド値 | 意味
---|---
LISTEN | 서버의 데몬이 접속 요청을 기다리는 상태
SYN-SENT | 로컬의 클라이언트 애플리케이션이 원격 호스트에 연결을 요청한 상태
SYN-RECEIVED | 서버가 원격 클라이언트로부터 접속 요구를 받아 클라이언트에게 응답을 하였으나 아직 클라이언트에게 확인 메시지를 받지 않은 상태
ESTABLISED | 앞의 3단계 연결과정이 완료된 후 서로 연결이 된 상태
FIN-WAIT1 | 종료 과정으로 능동적 닫기를 요청한 상태
CLOSED | 완전히 종료된 상태
...


## LISTEN状態のポートを利用するプロセス確認

`netstat -atp`

```
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name
tcp        0      0 localhost:blackjack         *:*                         LISTEN      2107/ruby /usr/loca
tcp        0      0 localhost:55247             *:*                         LISTEN      2316/Passenger Rack
tcp        0      0 *:http                      *:*                         LISTEN      1413/nginx
tcp        0      0 *:tproxy                    *:*                         LISTEN      1413/nginx
tcp        0      0 *:ssh                       *:*                         LISTEN      1202/sshd
tcp        0      0 *:postgres                  *:*                         LISTEN      1297/postmaster
tcp        0      0 *:smtp                      *:*                         LISTEN      1382/master
tcp        0      0 *:https                     *:*                         LISTEN      1413/nginx
tcp        0    988 ip-172-31-19-9.ap-north:ssh softbank126070081015.:51113 ESTABLISHED 2223/sshd
```

PID 1413でhttpプロセスが実行中で、これはnginx demonによって制御されている。


# lsof(list open file)

<http://qiita.com/yusabana/items/fd03ee4c90a0d1e0a8c6>
 
PortやPID、プロセス名からファイルがオープンしている情報を表示するコマンド

よく利用する場面

「netstat -an |grep LISTEN 」とかでListenしているPortを調べてそのPortが何のプロセスとかで動いているのかとかを確認するのに使っています！

`lsof -n -i :1025`

### プロセスID指定
`lsof -p 12345`

### バッククォート使うとこんな感じ

```
lsof -p `pgrep -n java`
```
