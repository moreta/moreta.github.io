---
title: jquery resize window
date: 2014-02-05
tags: javascript, resize
---




```
var timer = false;
$(window).resize(function() {
    if (timer !== false) {
        clearTimeout(timer);
    }
    timer = setTimeout(function() {
        console.log('resized');
        // 何らかの処理
    }, 200);
});
```
