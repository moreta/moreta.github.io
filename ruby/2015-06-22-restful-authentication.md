---
title: RESTful Authentication
date: 2015-06-22
tags: ruby, rails, api, grape
---

# 方法

How to handle authentication in a RESTful Client-Server architecture is a matter of debate.
Commonly, it can be achieved, in the SOA over HTTP world via:

+ HTTP basic auth over HTTPS;
+ Cookies and session management;
+ Token in HTTP headers (e.g. OAuth 2.0);
+ Query Authentication with additional signature parameters.


# HTTP basic auth over HTTPS

```
GET /spec.html HTTP/1.1
Host: www.example.org
Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==
```

# Granted via Token (OAuth2)

```
GET /resource/1 HTTP/1.1
Host: example.com
Authorization: Bearer mF_9.B5f-4.1JqM
```


+ <http://nginx.org/en/docs/http/ngx_http_auth_basic_module.html>

# rails token authentication

+ <http://stackoverflow.com/questions/18605294/is-devises-token-authenticatable-secure>
このarticleをベースにdeviseを利用して作られたgemがある。

## devise token auth gem

現状、これが良さそう

+ <https://github.com/lynndylanhurley/devise_token_auth>
+ [実装例](http://qiita.com/jwako/items/d9f966a5edca1b07c393)



# 参照

+ <http://stackoverflow.com/questions/319530/restful-authentication>
+ <http://stackoverflow.com/questions/18605294/is-devises-token-authenticatable-secure>
