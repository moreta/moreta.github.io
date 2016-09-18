---
title: EC2 Instance Rails Setting
date: 2014-01-01
tags: aws, instance, ec2, cron, rails, setting
---


# やっと行ったらいいこと

## サーバ date と cron date

```
date
2013年 2月 20日 水曜日 11:31:36 UTC
sudo mv /etc/localtime /etc/localtime.default
sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date
2013年 2月 20日 水曜日 20:31:51 JST
```

これをしてもcronのtimeが昔のままだったら

`sudo service crond restart`


## user add

`useradd app`

## postgresql

```
yum install postgresql-devel
yum install postgresql-server # serverは必要な場合だけ (postgres clientだけならいらない？)
```

## passenger & nginx



# instance

2014-06-02 現時点では m3かc3を使ったほうがいい。


