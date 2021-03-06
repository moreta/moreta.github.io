---
title: Rails Cache
date: 2014-06-04
tags: rails, cache
---

# ActiveRecordの遅延評価とcache

```rb
Rails.cache.fetch(key) {
  Model.where(flg: true).order("created_at DESC").to_a
  # Model.where(flg: true).order("created_at DESC").to_a # NG !
}
```

+ ActiveRecordは`.to_a`や`.each`などで実際にデータを操作する段階で初めてDBにクエリを発行
+ それまではクエリの状態（どんなwhereをチェインしてるかとか）を保持しているActiveRecord::Relationを返す
+ なので、`.to_a`がないとはModelの配列ではなくActiveRecord::Relationがキャッシュされてしま


```rb
# bad
# queryした結果自体がnilの場合もあるので、これはよくない
ret = Rails.cache.read(key)
if ret.nil?
    ret = Model.where(flg: true).order("created_at DESC").to_a
    Rails.cache.write(key,ret)
end

# good
if Rails.cache.exist?(key)
  ret = Rails.cache.read(key)
else
  ret = Model.where(flg: true).order("created_at DESC").to_a
end
```


# rails cache

* page cacheとaction cacheはもうrails4で削除されている


### Fragment caching


# 参考

* [Railsアプリを66％スピードアップ ― Railsキャッシュの完全ガイド](http://postd.cc/the-complete-guide-to-rails-caching/)
* <http://www.codebeerstartups.com/2013/02/how-to-implement-action-caching-in-ruby-on-rails-with-ajax-enabled>
* <http://blog.modsaid.com/2012/03/utilizing-page-caching-while-using.html>
* [Caching with Rails: An Overview](http://guides.rubyonrails.org/caching_with_rails.html)
* [Speed Up Your Rails App by 66% - The Complete Guide to Rails Caching](https://www.speedshop.co/2015/07/15/the-complete-guide-to-rails-caching.html)
