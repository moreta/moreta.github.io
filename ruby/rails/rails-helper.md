Rails Helper
===============

# どこで使う

+ 基本的にはxxx_helper.rb名に関係なく全helperがviewで使える

# コントローラーに該当するヘルパーしか読み込まないようにする

Rails 3.1.x 以降で、は以下のoptionがある

```ruby
config.action_controller.include_all_helpers = false
```

# view以外で使える方法


Controller以外の場所

```rb
ApplicationController.helpers.helper_method()
```

Controllerの場合

```rb
self.class.helpers.helper_method()
# または
view_context.helper_method()
```

# References

+ [Ruby on Rails: ビューヘルパーのメソッド名が重複したので、私なりのヘルパー分類方法を考察してみた。Add Star](http://d.hatena.ne.jp/komiyak/20130818/1376843076)
