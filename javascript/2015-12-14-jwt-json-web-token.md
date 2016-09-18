---
title: JWT - Json Web Token
date: 2015-12-14
tags: jwt, api , token
---

JWT - Json Web Token
=========================

+ [learn-json-web-tokens](https://github.com/dwyl/learn-json-web-tokens)
+ [JSON Web Token の効用](http://qiita.com/kaiinui/items/21ec7cc8a1130a1a103a)
+ [JWTを使った簡易SSOで徐々にシステムをリニューアルしている話](http://www.slideshare.net/TsuchiKazu/jwt-ssopepabotech)
+ [JWTについて簡単にまとめてみた](http://hiyosi.tumblr.com/post/70073770678/jwt%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6%E7%B0%A1%E5%8D%98%E3%81%AB%E3%81%BE%E3%81%A8%E3%82%81%E3%81%A6%E3%81%BF%E3%81%9F)
+ <https://developer.atlassian.com/static/connect/docs/latest/concepts/understanding-jwt.html>

# Why JWT?

+ Secure your web without cookies
+ Stateless authentication - [Horizontal scaling](https://en.wikipedia.org/wiki/Scalability#Horizontal_and_vertical_scaling)が簡単
+ Safe from CSRF(Cross-Site Request Forgery)
+ 例えば、サービスから別のサービスへ何かの情報を改ざんされずにsecureに渡すことなどもできる


# JWTの構成

+ tokenは３つのcomponentを持つ
 + header
 + payload
 + signature


改行されてるように見えるが本来は改行はない。.(dot)で繋がっている
```
eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9           // header
.eyJrZXkiOiJ2YWwiLCJpYXQiOjE0MjI2MDU0NDV9      // payload
.eUiabuiKv-8PYk2AkGY4Fb5KMZeorYBLw261JPQD5lM   // signature
```

## header

```js
{
    "typ":"JWT",
    "alg":"HS256"
}
```

## signature

JWTが有効なのか確認するのに利用される

## Payload and Claims

### Payload

claimを含んだuserが定義したデータ

```js
{
  "owner_id": "566f88030dc86d5b19058b41",
  "iat": 1450150194,
  "exp": 1450236594
}
```

### Claims are the predefined keys and their values:

+ iss(Issuer): issuer of the token
+ exp(Expiration Time): the expiration timestamp (reject tokens which have expired). Note: as defined in the the spec, this must be in seconds.
+ iat(Issued At): The time the JWT was issued. Can be used to determine the age of the JWT
+ nbf(Not before): "not before" is a future time when the token will become active.
+ jti(JWT ID): unique identifier for the JWT. Used to prevent the JWT from being re-used or replayed.
+ sub(Subject): subject of the token (rarely used)
+ aud(Audience): audience of the token (also rarely used)



# JWT / JWS / JWE

+ JWSとJWE構造の両方の中にエンコードされるJSONオブジェクトとしてクレームのセットを表す
+ JWSはJSONデータ構造とbase64urlエンコーディングを用いてデジタル署名, もしくはMACを行ったコンテンツを表現する
+ JWEはJSONデータ構造とbase64urlエンコーディングを用いて暗号化するための仕様

# use JWT with hapi

+ [hapi-auth-jwt](https://github.com/dwyl/hapi-auth-jwt2)




