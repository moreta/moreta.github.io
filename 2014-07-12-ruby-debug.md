---
title: Ruby debug
date: 2014-07-12
tags: ruby, debug, pry
---

## pry

<http://labs.timedia.co.jp/2011/12/rubyist-should-use-pry.html>

## rails4 debug関連 gem

<http://qiita.com/yusabana/items/8ce54577d959bb085b37>

```
group :test, :development do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'

  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    # 以下はRuby1.9の時のみ使う(pry-byebugの代わりに)
    # debuggerは1.9以下でしか動作しない, remote は byebug で使えないようになった
    gem 'pry-debugger'
    gem 'pry-remote'
  end

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'tapp'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'timecop'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  # gem 'database_rewinder'
end
```
