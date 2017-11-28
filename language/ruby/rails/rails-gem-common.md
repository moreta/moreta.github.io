---
title: Rails Debug Gem List
date: 2014-10-13
tags: ruby, rails, gem
---


### paranoia

論理削除の手助けをしてくれる
uniqバリデーションで、論理削除されたものを対象に含めたくないならこれも入れとくといい paranoia_uniqueness_validator

### remotipart

Formを使ったAjaxでのファイルアップロードをやりたいならこれを入れると吉

### kaminari

ページネーション！

### activerecord-import

Active RecordでBULK INSERTする時に 詳しくはこちらの方のまとめがいいです。


* <https://github.com/zdennis/activerecord-import/wiki>
* [Ruby - ActiveRecordで複数レコード、BULK INSERTする方法とパフォーマンスについて - Qiita](http://qiita.com/xend/items/79184ded56158ea1b97a)

例)

```ruby
books = []
10.times do |i|
  books << Book.new(:name => "book #{i}")
end
Book.import books
```

### browser

ブラウザの判定が必要ならこちらがおすすめ
Action Pack Variantsと組み合わせれば、簡単に端末ごとに画面の切替ができたり

<http://logictkt.hatenablog.com/entry/2014/05/03/213234>

## Cron

### whenever

crontabの管理を簡単に行える
capistranoと組み合わせられるので楽！
https://github.com/capistrano/rails

## Decorator

### draper

Decorators/View-Models for Rails Applications

<https://github.com/drapergem/draper>


### active_decorator

Railsで悩まれるヘルパー周りをスッキリさせてくれる

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  # first_name:string last_name:string website:string
end

# app/decorators/user_decorator.rb
module UserDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def link
    link_to full_name, website
  end
end

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
```

```
# app/views/users/index.html.erb
<% @users.each do |user| %>
  <%= user.link %><br>
<% end %>
```

似たものにDraperというものも有ります。
<https://github.com/jcasimir/draper>

* <http://tech.gmo-media.jp/post/91900069058/rails-presenter-decorator>

### rails-erd

<https://github.com/voormedia/rails-erd>

モデルの関連図をPDFで書きだしてくれます

1. Install Graphviz 2.22
2. install gem
```
gem install rails-erd
```
3. run `bundle exec erd`

### annotate

Modelにどんなカラムがあるかをモデルファイルの先頭に書き出してくれる

```sh
annotate --exclude tests,fixtures,factories,serializers
```

### letter_opener_web

開発中に送信したメールを実際には送信せずに、ブラウザから見ることができる。
開発中のメール誤爆防止に



## Ohters

### rails_config

定数を管理するGem
環境ごとに読み込む定数を変更できるので便利

使い方とかはこちらにまとまってます


### hashie

Hashie is a collection of classes and mixins that make hashes more powerful

<https://github.com/intridea/hashie>
