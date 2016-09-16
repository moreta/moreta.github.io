---
title: log
date: 2014-05-20
tags: log, syslog
---



# syslog

## logroateによるログ管理(基本的なsystem logやhttpdログ)**

* <http://linux.kororo.jp/cont/server/logrotate.php>

## syslogによるログの転送 

<http://www.atmarkit.co.jp/ait/articles/0402/25/news086.html>

## maillogを削除したけどmaillogが出力されない


    /etc/init.d/syslog restart
    # または syslogがなけれな以下
    /etc/init.d/rsyslog restart


# cloud service

## fluentd

http://fluentd.org/
https://github.com/fluent/fluent-plugin-s3


# logrotate

http://d.hatena.ne.jp/kt_hiro/20121207/1354889595


```
/etc/logrotate.conf	　　　logrotate全体の設定ファイル
/etc/logrotate.d/	　　　個別の設定ファイルを保存するディレクトリ
/etc/cron.daily/logrotate　　　cronで実行されるスクリプト
/var/lib/logrotate.status　　logrotateの状態記録ファイル
/usr/sbin/logrotate　　　　　　logrotate本体
```

```
# vi /etc/logrotate.conf

# see "man logrotate" for details
# rotate log files weekly
weekly

# keep 4 weeks worth of backlogs
rotate 4

# create new (empty) log files after rotating old ones
create

# uncomment this if you want your log files compressed
#compress

# RPM packages drop log rotation information into this directory
include /etc/logrotate.d

# no packages own wtmp -- we'll rotate them here
/var/log/wtmp {
    monthly
    create 0664 root utmp
    rotate 1
}

・ローテーションはweeklyで実施
・4世代分を保存
・ローテーション後に空ファイルを生成
・ローテーションしたファイルを圧縮しない
・/etc/logrotate.d以下の設定ファイルをinclude
・/var/log/wtmpファイルをmonthlyでローテーションする
```

・個別設定ファイル

```
# vi /etc/logrotate.d/httpd 
/var/log/httpd/*log {
    missingok
    notifempty
    sharedscripts
    delaycompress
    postrotate
        /sbin/service httpd reload > /dev/null 2>/dev/null || true
    endscript
}

compress
　ローテーションされたログをgzipで圧縮する。
create [パーミッション] [ユーザ名] [グループ名]
　ローテーション後に新たな空のログファイルを作成する。ファイルのパーミッション、ユーザ名、グループ名を指定可。
daily
　毎日ログローテーションする。
weekly
　毎週ログローテーションする。
monthly
　毎月ログローテーションする。
delaycompress
　ログの圧縮作業を次回のローテーション時まで遅らせる
ifempty
　ログファイルが空でもローテーションする。
missingok
　ログファイルが存在しなくてもエラーを出さない。
nocompress
　ローテーションされたログを圧縮しない。
nocreate
　新たな空のログファイルを作成しない。
nomissingok
　ログファイルが存在しない場合エラーを出す。
noolddir
　ローテーション対象のログと同じディレクトリにローテーションされたログを格納する。
notifempty
　ログファイルが空ならローテーションしない。
olddir ディレクトリ名
　指定したディレクトリ内にローテーションされたログを格納する。
prerotate - endscript
　postrotateとendscriptの間に記述されたコマンドをログローテーション前に実行する。
postrotate - endscript
　postrotateとendscriptの間に記述されたコマンドをログローテーション後に実行する。
rotate 回数
　指定した回数だけローテーションする。
size ファイルサイズ
　ログファイルが指定したファイルサイズ以上であればローテーションする。
sharedscripts
　複数指定したログファイルに対してpostrotateまたはprerotateで記述されたコマンドを実行する。
```

・実行ファイル

```
# vi /etc/cron.daily/logrotate

#!/bin/sh

/usr/sbin/logrotate /etc/logrotate.conf >/dev/null 2>&1
EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    /usr/bin/logger -t logrotate "ALERT exited abnormally with [$EXITVALUE]"
fi
exit 0

・/etc/logrotate.conf の設定に従いログローテを実行
・エラーが出た場合はエラーログを出す
```

## 動作確認

```
# logrotate -d /etc/logrotate.d/httpd
　※記述が正しくない場合はエラーが出る、
　　実際にログローテはされない。
```

