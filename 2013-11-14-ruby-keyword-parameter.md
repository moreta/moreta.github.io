---
title: "ruby キーワード引数"
date: 2013-11-14
tags: ruby, parameter, hash, keyword, ruby2
---





[ruby2-0のキーワード引数で面倒事からさようなら](http://www.techscore.com/blog/2013/02/12/ruby2-0%E3%81%AE%E3%82%AD%E3%83%BC%E3%83%AF%E3%83%BC%E3%83%89%E5%BC%95%E6%95%B0%E3%81%A7%E9%9D%A2%E5%80%92%E4%BA%8B%E3%81%8B%E3%82%89%E3%81%95%E3%82%88%E3%81%86%E3%81%AA%E3%82%89/)


```ruby
# ウェルカムメッセージ (Ex. 'こんにちは、太郎さん') を生成する.
def welcome_message(message, options={})
  # デフォルト値とマージする.
  default_options = {name: 'ゲスト'}
  options = default_options.merge(options)

  # 許可していないキーが渡された場合のチェックは面倒なので省略しよう…

  # 表示用のメッセージを構築する.
  "#{message}、#{options[:name]}さん"
end
```

```ruby
# ウェルカムメッセージ (Ex. 'こんにちは、太郎さん') を生成する.
def welcome_message(message, name: 'ゲスト')
  # 表示用のメッセージを構築する.
  "#{message}、#{name}さん"
end
```

