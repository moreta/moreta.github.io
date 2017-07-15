---
title: CURL
date: 2016-06-19
tags: curl
---


# GET

```
curl -v -X GET http://localhost:3000
```

+ -X : --request
  +
+ -v : --verbose
+ -H : --header

## SSL証明書の警告を無視する

-k / --insecure

# POST

json post

```sh
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"first_name":"firstname","last_name":"lastname","email":"email@email.com","password":"app123","password_confirmation":"app123"}}'  http://localhost:3000/api/1/users
```

# file upload

+ -T , --upload-file : ファイルFILEをアップロードする

```sh
curl -T your_file http://www.example.com/your_file
curl -T "{file1,file2}" http://www.example.com
```

# file download

+ -O, --remote-name : 取得したデータを標準出力ではなくファイルに出力する

```
curl -O http://www.example.com/your_file.tar # 

# checksum確認
openssl sha1 your_file.tar
```

# --verbose

```sh
curl --verbose -X POST https://xxxx -d 'key=value'
```

# proxy経由で

```sh
curl -i -X GET --proxy [proxy.server.ip:port] \
-H "Content-Type:application/xxxx" \
'curするurl'
```

# References

+ <http://www.hcn.zaq.ne.jp/___/unix/curl_manual.html>
+ <http://www.hcn.zaq.ne.jp/___/unix/curl_manpage.html>
+ [curlでヘッダを見る方法いろいろ](http://qiita.com/takc923/items/1b508bb370c78b7a9d44)
+ [curlのオプション勉強したのでまとめ](http://hogem.hatenablog.com/entry/20091122/1258863440)
