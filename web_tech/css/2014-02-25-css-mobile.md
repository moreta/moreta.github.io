---
title: css mobile touch color
date: 2014-02-25
tags: css, mobile, touch, color
---









*css*

```
a{
    -webkit-touch-callout:none;
    -webkit-tap-highlight-color:rgba(0, 0, 0, 0);
}
```


*with javascript*

```
.touchstyle { background-color:yellow;}
.notouchstyle { background-color:transparent;}

window.onload = function() {
    var target = document.getElementById("test");
    target.addEventListener("touchstart",function(){
        this.className="touchstyle";
    }, false);
    target.addEventListener("touchend",function(){
        this.className="notouchstyle";
    }, false);
}
```