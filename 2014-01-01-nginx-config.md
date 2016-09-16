---
title: Nginx config
date: 2014-01-01
tags: nginx, config
---


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

### .htpasswd file
##### openssl利用

`printf "username:$(openssl passwd -crypt password)\n" | sudo tee .htpasswd`

上記で `crypt`を使うと8文字しかpasswordが認識されない
8文字以上認識させたい場合には

`printf "username:$(openssl passwd -1 password)\n" | sudo tee .htpasswd`

##### apache利用

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
