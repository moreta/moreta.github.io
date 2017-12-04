---
title: Rails5 API
date: 2016-06-11
tags: rails, rail5
---

# Rails5 install

2016/06/11現在 rc version

```sh
gem install rails -v 5.0.0.rc1
gem install rails -v 5.0.0.1
```

# Create app by API models

```sh
rails new backend --api
rails new backend --api --skip --database=postgresql
```

# Active Job with resque

+ <http://qiita.com/iguchi1124/items/e4bf7426ac916acd45e5>

```
rails g migration AddViewCountToPosts view_count:integer
```


# Action Cable


# Unit test
なんかDBを全部削除してしまうみたい
<https://github.com/DatabaseCleaner/database_cleaner/issues/445>

なので以下のようにdbをセットアップする必要がある

# ActiveType::Object
<https://qiita.com/jkr_2255/items/271ed85e03c0ae27d5e5>

# ApplicationRecord

<https://techracho.bpsinc.jp/hachi8833/2017_04_27/36050>

```
class Article < ActiveRecord::Base # Rails 4
end

class Article < ApplicationRecord  # Rails 5
end
```