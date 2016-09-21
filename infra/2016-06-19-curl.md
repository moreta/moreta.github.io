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

# POST

json post
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"user":{"first_name":"firstname","last_name":"lastname","email":"email@email.com","password":"app123","password_confirmation":"app123"}}'  http://localhost:3000/api/1/users
```

# upload

+ -T

```
curl -T - http://www.upload.com/myfile
```

# --verbose

```
curl --verbose -X POST https://xxxx -d 'key=value'
```

# References

+ <http://www.hcn.zaq.ne.jp/___/unix/curl_manual.html>
+ <http://www.hcn.zaq.ne.jp/___/unix/curl_manpage.html>
+ [curlでヘッダを見る方法いろいろ](http://qiita.com/takc923/items/1b508bb370c78b7a9d44)
