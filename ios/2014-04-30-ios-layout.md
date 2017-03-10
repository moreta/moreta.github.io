---
title: iOS layout
date: 2014-04-30
tags: ios, layout
---




# layoutSubviews

* <http://qiita.com/yuch_i/items/b4612fae110254c816f4>

ViewControllerからViewのコードを切り離すべし

## layoutSubviewが呼ばれるタイミング

必要なタイミングで自動でよばれる

任意のタイミングで手動で実行する場合には`setNeedsLayout`を呼べば手動で実行