# install

downloadして、

```
 ./ngrok http 80
```
このように実行するだめ、

## mac

```
brew cask install ngrok
⋊> ~ which ngrok
/usr/local/bin/ngrok
```


# local webserverを公開

```
ngrok http 80

````

* 以下のように randomキーで公開されてそれが、localhostにforwardされる
* xxxxx部分が起動するたびにrandomに変わる

````
ngrok by @inconshreveable                                                                                                                       (Ctrl+C to quit)

Session Status                online
Session Expires               7 hours, 59 minutes
Version                       2.2.8
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://xxxxxx.ngrok.io -> localhost:80
Forwarding                    https://xxxxxx.ngrok.io -> localhost:80

Connections                   ttl     opn     rt1     rt5     p50     p90
                              0       0       0.00    0.00    0.00    0.00
```

# connect account

```
ngrok authtoken your_ngrok_auth_token_from_your_ngrok_install_page
```

以下のfileにauth tokenが記録される

```
.ngrok2/ngrok.yml
```