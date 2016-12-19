Nginx log設定
===========


# app serverがリクエストの処理にかかった時間をログに記録する

大抵の場合、これがdefault
```
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" '
                  '"$http_user_agent" "$http_x_forwarded_for"';


```
* $remote_addr    : クライアントのIPアドレス
* $remote_user    : クライアントのユーザ名
* $time_local     : アクセス日時
* $request        : httpの要求URI
* $status         : httpのステータス
* $body_bytes_sent: 送信バイト数
* $http_referer   : リファラーURL（遷移元URL）
* $http_user_agent: ユーザエージェント情報（ブラウザ名・バージョン等）

## $upstream_response_time & $request_time

<http://stackoverflow.com/questions/37430951/why-is-request-time-much-larger-than-upstream-response-time-in-nginx-access-log>

+ `$request_time` may be due to a client with a slow connection
  + clientが slow connectionの場合ながくなる
+ `$upstream_response_time`はproxy先からレスポンスを受け取るまでの時間
+ `$upstream_response_time`と`$request_time`を全部記録するとどちらに原因があるが判断に約立つ

```
log_format main  '$remote_addr - $remote_user [$time_local] "$request" '
                 '$status $body_bytes_sent "$http_referer" '
                 '"$http_user_agent" "$http_x_forwarded_for" '
                 '"$upstream_response_time" "$request_time"'; # <<
```

# SSL/TLS protocolの記録

+ Add `$ssl_cipher`

```
log_format combined_ssl '$remote_addr - $remote_user [$time_local] '
                        '$ssl_protocol/$ssl_cipher '
                        '"$request" $status $body_bytes_sent '
                        '"$http_referer" "$http_user_agent"';
```

上記のログを利用するため 443 listenの設定のログで log_formatを利用するように設定
```
server {
  listen 443;
  ssl on;
  access_log /var/log/nginx/access.log combined_ssl;
  [...]
}
```

# References

+ [Why is request_time much larger than upstream_response_time in nginx access.log?](http://stackoverflow.com/questions/37430951/why-is-request-time-much-larger-than-upstream-response-time-in-nginx-access-log)
