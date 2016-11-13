---
title: Nginx config
date: 2014-01-01
tags: nginx, config
---

# nginx.conf の構成

Nginx の基本的なモジュールは大きく分けて、以下の4つのモジュールがあります。

+ Mainモジュール： プロセス管理やセキュリティなどの基本機能を提供します。
+ Eventsモジュール： ネットワーク機能の内部メカニズムを設定します。
+ Configurationモジュール： ファイルのインクルードを実現します。
+ HTTPモジュール： HTTPサーバの基本ブロック、ディレクティブ、変数を格納しているコンポーネントです。


```
(Mainモジュールのディレクティブを定義）

events {
  eventsブロック（Eventsモジュールのディレクティブを定義）
}

http {
  httpブロック（HTTPモジュールのディレクティブを定義）
  # ほとんどは以下のincludeでserverモジュールをinclude
  include /etc/nginx/conf.d/*.conf;
}
```

httpはさらに以下のように

```
http {
  server {
    serverブロック（Webサイトごとの設定を定義）
    location {
      locationブロック（Webサイトの特定の位置にだけに適用される設定を定義）
    }
  }
}
```

## non-www to www

```
server {
    listen 80;
    listen 443 ssl;
    server_name yourdomain.com;
    return 301 $scheme://www.yourdomain.com$request_uri;
}
```

`www to non-www`は設定を反対にすればOK

## https

```
proxy_set_header Host $host;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Host $host;
proxy_set_header X-Forwarded-Proto https;
proxy_set_header X-Forwarded-Server $host;
proxy_set_header X-Real-IP $remote_addr;
```

### nginxを reverse proxyで利用

nginxを reverse proxyで利用していて nginxのバックにapplication serverがあり、
その間がhttp通信の場合 nginxまでhttps通信したとことapplication serverが分かるようにするためには`X-Forwarded-Proto`が必要

`proxy_set_header X-Forwarded-Proto https`

#### reference

<http://stackoverflow.com/questions/7947030/nginx-no-www-to-www-and-www-to-no-www>
<https://github.com/MovLib/www/blob/master/conf/nginx/nginx.conf>
<https://github.com/Fleshgrinder/nginx>


## block

<http://eng.eelcowesemann.nl/linux-unix-android/nginx/nginx-blocking/>

## IP

### リバースプロキシを利用した場合のアクセス元アドレス

<http://qiita.com/yasu/items/da7ebdb01cb3209583df>


## worker configurations

<http://help.cloud66.com/web-server/nginx-workers.html>

上記のサイトでも表があるが、

EC2の ECUの数に合わせればOK

## basic auth(basic認証)

### .htpasswd fileを生成

##### openssl利用して作る

`printf "username:$(openssl passwd -crypt password)\n" | sudo tee .htpasswd`

上記で `crypt`を使うと8文字しかpasswordが認識されない
8文字以上認識させたい場合には

`printf "username:$(openssl passwd -1 password)\n" | sudo tee .htpasswd`

##### apache利用して作る

`sudo htpasswd -c htpasswd <username>`
のあとにpassword入力

### nginx.conf or そのincludeファイルに
```
auth_basic "Restricted";
auth_basic_user_file "htpasswd ファイル path";
```

上記の部分を

```
server {
# ここに置くと全ての requestに対して認証がかかる
  location /proxy_path {
    # ここに置くと pathに一致する requestに認証がかかる
  }
}
```

### nginxのbasic認証で特定IPは認証を外したい

`satify [all|any]`を利用


     | allow            | deny
------------|---------------|--------------
satisfy any | 認証なし      | Basic認証あり
satisfy all | Basic認証あり | アクセス拒否


```
server {
    #....
        location / {
            satisfy any;
            allow 100.100.100.100;
            # ここにbasic認証を掛けたくないIPを追加していく
            deny all;
            auth_basic "basic authentication";
            auth_basic_user_file /etc/nginx/.htpasswd;
        }
}
```


### rails nginx setting example

nginx.conf

### service登録

私のgistからinit-nginx.shをダウンロードする。

```
cd /opt
# このURLは変わるかもしれないのでgistから直線確認して
wget https://gist.githubusercontent.com/moreta/5104215b76c71cfaae2a/raw/cc26215fe9143fc544a6f0afc337b863ec634c51/init-nginx.sh
mv /opt/init-nginx.sh /etc/rc.d/init.d/nginx
chmod +x /etc/rc.d/init.d/nginx
chkconfig --add nginx
chkconfig nginx on
```
