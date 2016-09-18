---
title: "Rails4 trouble shoot"
date: 2013-12-16
tags: rails, rails4, trouble
---


<http://qiita.com/shu_0115/items/1cf6220758a9c64c7adf>


`[deprecated] I18n.enforce_available_locales will default to true in the future. If you really want to skip validation of your locale you can set I18n.enforce_available_locales = false to avoid this message.`


`config/application.rb`の

``` ruby
config.i18n.enforce_available_locales = true
# or if one of your gem compete for pre-loading, use
I18n.config.enforce_available_locales = true
```

しかし、上記の解決はしなくていい、バグのようで、すでに解決されている。
新しい i18n gemをアップデートすればいい??
<http://stackoverflow.com/questions/20487127/rails-i18n-validation-deprecation-warning-after-setting-enforce-available-local>

このanswerは全部読んでおこう。
<http://stackoverflow.com/questions/20361428/rails-i18n-validation-deprecation-warning>



## 4.1.4

`gem install rails -v 4.1.4`


##  migrationするときの downtimeを減らす方法

<http://blog.codeship.io/2014/02/11/rails-migrations-zero-downtime.html>


## production 環境でSECRET_KEY_BASE 設定

config/secrets.ymlに
```
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

があるので`rake secrert`生成したキーを.bashrcまたは .bash_profileに

```
# rails config/secrets.yml
export SECRET_KEY_BASE=d779d1a98e0b006120c194f2ac7fe6a687f3cb8a3cc38d031e8d6c7b18672be43af088e0d722ac435129abc7f57dce9e91126588fa6240638d52cbd7fb3772ff
```
