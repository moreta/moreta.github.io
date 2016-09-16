---
title: Postgresql Security
date: 2014-07-10
tags: postgresql, password
---

# password省略

<http://wiki.postgresql.org/wiki/Pgpass/ja>


ユーザのホームディレクトリに .pgpass を用意

権限は600

`hostname:port:database:username:password`

GPASSWORD環境変数が設定されていると、~/.pgpassファイルは読み取られません

例)

`localhost:5432:*:postgres:postgres`
