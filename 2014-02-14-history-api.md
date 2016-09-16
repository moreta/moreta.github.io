---
title: HTML5 history API
date: 2014-02-14
tags: html5, history-api
---


# history api

## support browser
<http://caniuse.com/#feat=history>

## presenation
<http://www.zachstronaut.com/posts/jsmn-history/#/>

### Manipulating History Creates Problems
(If you use the History API to kill a page's own grandfather...)

* History remembers scroll position
* History forgets DOM manipulation**
* Using Back/Forward between pushed states does not reload page

### 問題点
history apiを使った時にbackで戻るとcontentは変わらない
なので、onpopstateを使う

<http://www.zachstronaut.com/posts/jsmn-history/#/26>
<http://www.zachstronaut.com/posts/jsmn-history/#/27>

### だがまだ問題が scroll backしたら？

So close, and yet so far away
No longer totally b0rked, but still lacking UX finesse
More we could do with scroll position
And what about when user scrolls back up?

# infinite scroll

## with kaminari & jquery

<https://github.com/amatsuda/kaminari/wiki/How-To:-Create-Infinite-Scrolling-with-jQuery>

## infinite-scroll js

<https://github.com/paulirish/infinite-scroll>
<http://www.infinite-scroll.com>

# rails

## wise link

pjaxやturbolinkよりおすすめ

<https://github.com/igor-alexandrov/wiselinks>


```
#= require jquery
#= require wiselinks

$(document).ready ->
    window.wiselinks = new Wiselinks($('body'), html4: false )
```


wiselinks sample
<https://github.com/igor-alexandrov/wiselinks_example/blob/master/app/assets/javascripts/application.js.coffee>


### role.js

<https://github.com/kossnocorp/role>

#### role rails

<https://github.com/kossnocorp/role-rails>