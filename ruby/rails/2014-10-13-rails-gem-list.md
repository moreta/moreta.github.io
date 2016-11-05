---
title: Ruby & Rails Gem List
date: 2014-10-13
tags: ruby, rails, gem
---

## debug & console


### awesome_print


<https://github.com/michaeldv/awesome_print>

`gem install awesome_print`


コード上で利用

```
require "awesome_print"
ap object, options = {}
```

pryで

~/.prycに以下を追加
```
require "awesome_print"
AwesomePrint.pry!
```

#### 設定によって出力を変える

.aprcを使うか
```
# ~/.aprc file.
AwesomePrint.defaults = {
  :indent => -2,
  :color => {
    :hash  => :pale,
    :class => :white
  }
}
```

optionsを利用、以下の例では `:indent`
```
require "awesome_print"
data = { :now => Time.now, :class => Time.now.class, :distance => 42e42 }
ap data, :indent => -2  # <-- Left align hash keys.
```



### paranoia

論理削除の手助けをしてくれる
uniqバリデーションで、論理削除されたものを対象に含めたくないならこれも入れとくといい paranoia_uniqueness_validator



Ruby - Railsで定数を環境ごとに管理するrails_config - Qiita

### remotipart

Formを使ったAjaxでのファイルアップロードをやりたいならこれを入れると吉

### kaminari

ページネーション！

### activerecord-import

Active RecordでBULK INSERTする時に 詳しくはこちらの方のまとめがいいです。


* <https://github.com/zdennis/activerecord-import/wiki>
* [Ruby - ActiveRecordで複数レコード、BULK INSERTする方法とパフォーマンスについて - Qiita](http://qiita.com/xend/items/79184ded56158ea1b97a)

例)
```
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

```
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

モデルの関連図をPDFで書きだしてくれます

### quiet_assets

開発中にうっとうしいassets系のログを出さないように

### pry-rails

consoleからpryが使えるようになる

pry-byebug
hirb
hirb-unicode
この辺りも入れるといいかも
特にpry-byebugは、任意の箇所にブレークポイントを設置することができるので、デバックのつよーい味方
rack-mini-profiler

DBへのアクセスとかViewの表示速度とかをWebページ上に表示してくれる
重いページやクエリ等の発見に

### annotate

Modelにどんなカラムがあるかをモデルファイルの先頭に書き出してくれる

### letter_opener_web

開発中に送信したメールを実際には送信せずに、ブラウザから見ることができる。
開発中のメール誤爆防止に

### bullet

N + 1問題を起こしている箇所を検出して教えてくれる
N+1の解決方法はこちらがすごく良くまとめてくれています。



Rails - ActiveRecordのjoinsとpreloadとincludesとeager_loadの違い - Qiita

### rack-dev-mark

develop環境でwebページに「開発環境だよー」ってわかるようにラベルを張ってくれる
powを使ってたりすると重宝するのかな？
powについてはこちらのブログがまとめてくれています。



開発サーバをThinからPowに切り替えて開発効率アップ！ (Mac限定) - 酒と泪とRubyとRailsと

### better_errors

説明いらないでしょう


## Ohters

### rails_config

定数を管理するGem
環境ごとに読み込む定数を変更できるので便利

使い方とかはこちらにまとまってます


### hashie

Hashie is a collection of classes and mixins that make hashes more powerful

<https://github.com/intridea/hashie>
