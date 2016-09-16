---
title: Angualr.js
date: 2014-04-07
tags: angularjs, ruby, rails
---


# 基礎の勉強

<http://campus.codeschool.com/courses/shaping-up-with-angular-js/intro>


## sample app by rails

<https://github.com/railscasts/405-angularjs/tree/master/raffler>


```
bundle
rake db:setup
rails s
```

## gem
利用しても、直接入れてもOKだが、使った方が便利。

<https://github.com/hiravgandhi/angularjs-rails>

`gem 'angularjs-rails'`


## filter

basic syntax

`{{ data | }}`

* date:'MM/dd/yyyy @ h:mma'
* uppercase & lowercase
* limitTo:3
* orderBy:'-price' (- is descending)
