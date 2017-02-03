PKCS#12の証明書の nginx 設置方法
============================


# PKCS#12

PKCS #12 は IIS の SSLサーバ証明書のバックアップ・エクスポート等に用いられる、

+ **秘密鍵** と **証明書** を 1つのファイルに格納する形式です。
+ .p12 または .pfxの拡張子を持つ

# openssl コマンドでサーバ証明書と秘密鍵を生成


## 証明書の取り出し

```
openssl pkcs12 -in input.pfx -clcerts -nokeys -out output.crt
```

- -clcerts : cl cert(証明書)を出せ!
  - only output client certificates (not CA certificates).
- -nokeys : キーはいらん
  - no private keys will be output.


## 中間証明書の取り出し

```
openssl pkcs12 -in input.pfx -cacerts -nokeys -out output.ca-bundle
```

- -cacerts : ca certを出せ!
  - only output CA certificates (not client certificates).
- -nokeys : キーはいらん
  - no private keys will be output.


## 秘密鍵の取り出し

```
openssl pkcs12 -in input.pfx -nocerts -nodes -out output.key
```

- -nocerts : certはいらん! キーだけ出せ！
  - no certificates at all will be output.
- -nodes : 暗号化は必要ない！
  - don't encrypt the private keys at all.

## 全部だし

+ 秘密鍵
+ サーバ証明書
+ 中間証明書
+ ルート証明書

```
openssl pkcs12 -in input.pfx -out output.pem
```


## commands

```sh
# Generate certificates bundle file
openssl pkcs12 -in input.p12 -nokeys -out server-ca-cert-bundle.pem # ssl_certificateを作成
# Generate server key file
openssl pkcs12 -in input.p12 -nocerts -nodes -out server.key # ssl_certificate_keyを作成
```

nginx.conf

```
server {
    listen      443 default ssl;
    server_name _;
    root        /var/www/html;
    index       index.html index.htm;
    charset     utf-8;

    ssl on;
    ssl_certificate     /path/to/output.pem; # サーバ証明書 + 中間CA証明書
    ssl_certificate_key /path/to/output.key; # サーバ秘密鍵

    ssl_session_timeout 5m;
    ssl_protocols SSLv2 SSLv3 TLSv1;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    # (略)
```


# References

+ [openssl Manual:Pkcs12(1)](https://wiki.openssl.org/index.php/Manual:Pkcs12(1))
+ [Nginx pfx 形式の証明書を pem 形式に変換して Nginx で SSL 設定する](https://memo.dogmap.jp/2014/03/25/nginx-ssl/)
+ [SSL 証明書申請時に必要な CSR ファイルの生成とか](https://memo.dogmap.jp/2013/08/21/generate-csr/)
