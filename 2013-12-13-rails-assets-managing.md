---
title: "Rails Assets Management"
date: 2013-12-13
tags: rails, assets
---

# RailsAssets?

## bowerで管理しているパッケージをbundlerで利用できる

<https://rails-assets.org/components>

gem命名ルールは

`gem 'rails-assets-BOWER_PACKAGE_NAME'`


## setting

Gemfile

```
source 'https://rails-assets.org'

gem 'rails-assets-bootstrap'
gem 'rails-assets-angular'
gem 'rails-assets-leaflet'
```



application.js

```
//= require bootstrap
//= require angular
//= require leaflet
```


application.css
```
*= require bootstrap
*= require leaflet
```

