---
title: Mobile detect library
date: 2014-02-26
tags: mobile, detect, nginx, js
---


# simple

```
var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
//        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        return navigator.userAgent.match(/iPhone|iPod/i); // iPadはPCに
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
```

# GIT hubで jsの mobile detect
<https://github.com/search?l=JavaScript&q=mobile+detect&ref=cmdform&type=Repositories>

## modernizr

mobile-detect-modernizr.js




# nginx
Nginxなどwebserverの設定ファイルはここからがいい


<http://detectmobilebrowsers.com/>


