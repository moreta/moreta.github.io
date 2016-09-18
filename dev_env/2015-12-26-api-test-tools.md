---
title: API test tool 
date: 2015-12-26
tags: http, test, api
---




# Httpbin


<https://httpbin.org/>


こんな感じでつかえる

```curl
$ curl -I http://httpbin.org/status/418
HTTP/1.1 418 I'M A TEAPOT
Server: nginx/0.7.67
Date: Mon, 13 Jun 2011 04:25:38 GMT
Connection: close
x-more-info: http://tools.ietf.org/html/rfc2324
Content-Length: 135
```

```js
fetch('https://httpbin.org/status/400', {method: 'POST'}).then(function(res) {
    document.getElementById('res').textContent = JSON.stringify(res);
}).catch(function(err) {
    document.getElementById('error').textContent = err;
});
```


# Mockbin

custom endpointをつくることができる

http://mockbin.org/


## example

<http://mockbin.org/bin/d87acbb0-526e-4d66-aea4-b827d9c35031/view>
