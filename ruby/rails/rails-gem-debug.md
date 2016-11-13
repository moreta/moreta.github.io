---
title: Rails Debug Gem List
date: 2014-10-13
tags: ruby, rails, gem
---

# debug & console


## awesome_print

```ruby
gem "awesome_print", require:"ap"
```

<https://github.com/michaeldv/awesome_print>


コード上で利用

```ruby
require "awesome_print"
ap object, options = {}
```

pryで

~/.prycに以下を追加
```ruby
require "awesome_print"
AwesomePrint.pry!
```

rails consoleで

```ruby
rails c
ap User.last
```

#### 設定によって出力を変える

.aprcを使うか

```ruby
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

```ruby
require "awesome_print"
data = { :now => Time.now, :class => Time.now.class, :distance => 42e42 }
ap data, :indent => -2  # <-- Left align hash keys.
```


## quiet_assets

```ruby
gem 'quiet_assets', group: :development
```

開発中にうっとうしいassets系のログを出さないように

## pry-rails

```ruby
gem 'pry-rails', :group => :development
```

consoleからpryが使えるようになる

pry-byebug
hirb
hirb-unicode
この辺りも入れるといいかも
特にpry-byebugは、任意の箇所にブレークポイントを設置することができるので、デバックのつよーい味方
rack-mini-profiler

DBへのアクセスとかViewの表示速度とかをWebページ上に表示してくれる
重いページやクエリ等の発見に


## better_errors

説明いらないでしょう

## bullet

N + 1問題を起こしている箇所を検出して教えてくれる
N+1の解決方法はこちらがすごく良くまとめてくれています。

+ Rails - ActiveRecordのjoinsとpreloadとincludesとeager_loadの違い - Qiita

## rack-dev-mark

develop環境でwebページに「開発環境だよー」ってわかるようにラベルを張ってくれる
powを使ってたりすると重宝するのかな？
powについてはこちらのブログがまとめてくれています。

+ 開発サーバをThinからPowに切り替えて開発効率アップ！ (Mac限定) - 酒と泪とRubyとRailsと
