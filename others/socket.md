---
title: Socket
date: 2012-05-13
tags: network, socket
---


# 소켓연결
두개의 정보가 필요함

* 서버가 어디에있는지 -> IP address
* 어떤 포트에서 돌아가고 있는지 -> TCP port 번호

```
A : 195.164.1.100:3000 <------------------->   B : 195.164.1.200:2000
195.164.1.200:2000에 보내자                         195.164.1.100:3000에 보내자 
```

소켓연결이란 두 시스템이 서로에 대한 정보가 있다는 것

# TCP 포트

0 ~ 65,535까지 있고 

0 ~ 1023 사이의 포트는 예약되어있기 때문에 쓰지않는게 좋음

자주쓰이는(그렇지만 변경가능한 TCP 포트번호)

* 20 : FTP
* 23 : Telnet
* 25 : SMTP
* 37 : Time
* 443 : HTTPS
* 110 : POP3
* 80 : HTTP

[예약 포트 더보고 싶으면 요기](http://ja.wikipedia.org/wiki/TCP%E3%82%84UDP%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E3%83%9D%E3%83%BC%E3%83%88%E7%95%AA%E5%8F%B7%E3%81%AE%E4%B8%80%E8%A6%A7)

# ruby 

## ruby tcp chat

* <http://www.sitepoint.com/ruby-tcp-chat/>

## tcp socket book

* <http://www.jstorimer.com/products/working-with-tcp-sockets>

## ruby socket programming

* <http://www.tutorialspoint.com/ruby/ruby_socket_programming.htm>