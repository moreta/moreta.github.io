---
title: Rubys job scheduler
date: 2016-01-20
tags: ruby, job, scheduler, batch
---

# よさそうな

+ [resque](https://github.com/resque/resque)
  + [resque-scheduler](https://github.com/resque/resque-scheduler)
  + persistance layer is redis
+ [Skidekiq](https://github.com/mperham/sidekiq)
+ [ActiveJob](http://railsguides.jp/active_job_basics.html)
+ [delayed_job](https://github.com/collectiveidea/delayed_job)
  + persistance layer(backeds) - <https://github.com/collectiveidea/delayed_job/wiki/Backends>
    + ActiveRecord = RDB
    + Redis
    + mongodb

# ActiveJob

まずこれを読む

+ [Active Job の基礎](http://railsguides.jp/active_job_basics.html)

## できること

+ バックグラウンドで実行
  + メールの送信
  + バッチ処理な
  + などなど
  
ActiveJobでAPIが統一されているので以下のどれをつかっても同じコードを走らせる

+ Delayed Job
+ Resque
+ Sidekiq


# 他References


+ [Railsで非同期処理：キュー。Sidekiq（+ActiveJob）がResqueよりも、とても簡単便利](http://qiita.com/zaru/items/8385fdddbd1be25fe370)
+ [Rails 4.2で導入されたActive Jobを使ってみよう - ActiveJob + resque](http://qiita.com/ryohashimoto/items/2f8fd685920a5318def4)
