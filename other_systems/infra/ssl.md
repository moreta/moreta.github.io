---
title: SSL証明書
date: 2013-12-15
tags: ssl, 証明書, https
---


# 無料証明書 Let's Encrpty

詳しくは lets-encrypt.md

### aws amazon linuxで
<http://tkuchiki.hatenablog.com/entry/2016/05/16/195420>




## クライアント証明書を要求するサイトの構築

1.
<http://qiita.com/tukiyo/items/b5e8b3efce800b0fd269>

2.
<http://qiita.com/tukiyo/items/9633b8b5f63e887f55b1>


## 自己証明

<http://d.hatena.ne.jp/ozuma/20130511/1368284304>
<http://www.maruko2.com/mw/Apache/SSL%E8%87%AA%E5%B7%B1%E8%A8%BC%E6%98%8E%E6%9B%B8%E3%81%AE%E4%BD%9C%E6%88%90%E3%81%A8mod_ssl%E3%81%AE%E8%A8%AD%E5%AE%9A>


### 1. 秘密鍵の作成



`xxx.key`

`openssl genrsa -des3 -out server.key 2048`

* genrsa : RSA形式の秘密鍵を作成する
* -aes128 : 128ビットの AES 方法で暗号化する。
* 1024 : 1024バイトの鍵を作成する。


### 2. 公開鍵の作成

`xxx.csr`

CSR（Certificate Signing Request）とは、SSL 証明書を作成する元になる情報が書かれている

`openssl req -new -key server.key > server.csr`

```
Country Name (2 letter code) [AU]:JP
State or Province Name (full name) [Some-State]:Tokyo
Locality Name (eg, city) []:Osaka-shi,Chuo-ku
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Your Inc.
Organizational Unit Name (eg, section) []:Your Section
Common Name (eg, YOUR name) []:your.com
Email Address []:空白

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:省略
An optional company name []:省略
```


### 3. デジタル証明書の作成

`xxx.crt`

もともとはCertification Authority(認証局)が発行するのも、
自分用でなく商用なら、Verisign, globalsignなどで発行してもらう。

`openssl x509 -in server.csr -days 3650 -req -signkey server.key > server.crt`

パスワードが必要だが、自己証明用は

##  verisign

<https://www.verisign.co.jp/ssl/help/csr/capache_new.html>

```
cd /usr/local/ssl/bin
./openssl md5 * > rand.dat
./openssl genrsa -rand （擬似乱数ファイル名） -des3 （キー長） > （秘密鍵ファイル名）
```

## globalsign

<http://jp.globalsign.com/support/csr/04.html>


## cross root証明書を利用する場合

### cross root証明書について

* <https://jp.globalsign.com/support/faq/431.html>
* <https://www.cybertrust.ne.jp/ssl/support/faq/tech_faq01.html#14>
* [クロスルート証明書について詳しい内容](http://scan.netsecurity.ne.jp/article/2013/12/26/33257.html)

ガラケーは 1024bitスマホは 2048bitのルート証明書を使っている
1024bitだけサポートしている携帯ではwebで閲覧できなかったら証明書の警告がでたりする。

これを解決するためにクロスルート証明書が作られた。  

クロスルートとは、あるルート証明書から発行されたサーバ証明書を別のルート証明書が設定されている端末でも利用できるようにする仕組みである。ある証明書（証明書Aとする）があるルートCA（ルートCA-Xとする）配下のCAから発行されている場合、端末にルートCA-Xのルート証明書が必要である。

2048bit移行後も、1024bit端末でSSLが使えるようになるが、1024bitの脆弱性を抱えたままになる

### 設定

```
wildcard.crt # 証明書(SSLサーバ証明書)

# これはメール書いているものでなく、メールのリンクからダウンロードする
# なぜなら、携帯とスマホの対応のため
cross_root.crt # クロスルート証明書
cat wildcard.crt cross_root.crt > concat_wildcard.crt
```


#### クロスルート証明書の中身
メールの本部に書いてある「中間証明書」がこの内容だったら

```
-----BEGIN CERTIFICATE-----
ここが中間証明書の中身
-----END CERTIFICATE-----
```

クロスルート証明書のは結局はこの形

```
-----BEGIN CERTIFICATE-----
ここが中間証明書の中身
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
ここはルート証明書の中身
-----END CERTIFICATE-----
```
のような形で上の部分の「中間証明書」の部分は同じテキストである。
ユーザの端末によって必要なルート証明書にたどり着く仕組み。

なので最後のnginxに設定する証明書は

```
-----BEGIN CERTIFICATE-----
ここは発行された証明書
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
ここが中間証明書の中身
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
ここはルート証明書の中身
-----END CERTIFICATE-----
```

このような形になる
