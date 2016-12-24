---
title: Rails Cache
date: 2014-06-04
tags: rails, cache
---



## page cacheとquery stringについて

<http://blog.modsaid.com/2012/03/utilizing-page-caching-while-using.html>


query stringの場合URL単位で cacheされない
なので、railsのrouteで定義した設定に合わせて web server側でurl rewriteして上げる必要がある。

っか、action cacheを利用しよう

## action cache

`aches_action :index, :cache_path => Proc.new { |c| c.params }`

# rails cache


### Page Caching

* cacheしたhtmlを publicに保存
* 一度cacheしたら filterなどは無視される

### Action Caching

*
* filterは適用される

action cacheでparameterでcacheをそれぞれ保存したい

`aches_action :index, :cache_path => Proc.new { |c| c.params }`



### Fragment caching


# 参考

* [Railsアプリを66％スピードアップ ― Railsキャッシュの完全ガイド](http://postd.cc/the-complete-guide-to-rails-caching/)
* <http://www.codebeerstartups.com/2013/02/how-to-implement-action-caching-in-ruby-on-rails-with-ajax-enabled>
* <http://blog.modsaid.com/2012/03/utilizing-page-caching-while-using.html>
* [Caching with Rails: An Overview](http://guides.rubyonrails.org/caching_with_rails.html)
* [Speed Up Your Rails App by 66% - The Complete Guide to Rails Caching](https://www.speedshop.co/2015/07/15/the-complete-guide-to-rails-caching.html)
