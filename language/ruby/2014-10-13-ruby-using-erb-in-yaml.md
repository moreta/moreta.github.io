---
title: Ruby YAML & ERB
date: 2014-10-13
tags: ruby, yaml, erb
---


<http://urgetopunt.com/rails/2009/09/12/yaml-config-with-erb.html>


基本的なymlロードはこんな感じだが
```
# config/initializers/load_config.rb
APP_CONFIG = YAML.load_file("#{Rails.root}/config/app_config.yml")[Rails.env]
```

以下のようにERB.newにして渡せば使えるようになる。

```
# config/initializers/load_config.rb
APP_CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/app_config.yml")).result)[Rails.env]
```



## yamlを扱うときの注意点

railsだけ使ってると
ymlから値を取得するのにsymbolを使ったりするが、yamlのsyntaxにはsymbolとstringを区分できるようになっている

```
# symbol
:test:
  key1: yourkey

# string
test:
  key1: yourkey
```

なので、キーを全部symbolで取得したいならactivesupportの[symbolize_keys](http://api.rubyonrails.org/classes/Hash.html#method-i-symbolize_keys)を使う

### しかし、ActiveRecordをstand aloneで使うとき

database.ymlを手動で読み込ませる時があるが、
このときには`symbolize_keys`は使わない。
使うと逆にエラー

`ActiveRecord::Base.configurations = YAML::load(IO.read('database.yml'))`

## 参考

* <http://qiita.com/nao58/items/38dbca8ba744269f4ccd>