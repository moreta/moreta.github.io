---
title: Rails Test with minitest
date: 2013-12-01
tags: ruby, unittest, minitest
---


これから見てみよう

1. <http://blowmage.com/2013/07/08/minitest-spec-rails4>
2. <http://willnet.in/45>


## 関連gem

* <https://github.com/blowmage/minitest-rails>
* <https://github.com/blowmage/minitest-rails-capybara>


```ruby
gem "minitest-rails"

group :test do
  gem "minitest-rails-capybara"
end

group :test do
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'minitest-colorize'
  gem 'minitest-focus'
end

```

## referece

*quick reference*

<http://mattsears.com/articles/2011/12/10/minitest-quick-reference>


*docs*

<http://docs.seattlerb.org/minitest/>


# rails3

これから見てみよう
<http://blog.crowdint.com/2013/06/14/testing-rails-with-minitest.html>


```ruby
group :test do
  gem 'minitest-rails'
  gem 'minitest-rails-capybara'
  gem 'minitest-colorize'
  gem 'minitest-focus'
end
```

`rails g mini_test:install`
で `test_helper.rb`が生成される

*test_helper.rb*

`require "rails/test_help"`の下に以下を追加
```ruby
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/focus'
require 'minitest/colorize'
```

*application.rb*

rails/allをコメントアウトし、直接requireを入れる
```ruby
# minitestの設置のため
# require 'rails/all'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'rake/testtask'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'sprockets/railtie'
require 'minitest/rails/railtie'
```

### command

`rake -T`で確認できる

sample command

```sh
rake minitest # Run default tests
rake minitest:all # Run all tests
rake minitest:all:quick # Run all tests, ungrouped for quicker execution
rake minitest:functional # Runs tests under test/functional
rake minitest:helpers # Runs tests under test/helpers
rake minitest:performance # Runs tests under test/performance
rake minitest:unit # Runs tests under test/unit
rake test # Run default tests

rake minitest:unit TEST="test/unit/example_test.rb"
```

### テスト実行

`rake minitest or rake minitest:all`


### テストファイル生成

`rails generate integration_test file_name`
`rails generate integration_test User --spec`

`--spec`はrspec風に雛形を生成するためのオプション

以下のようにファイルが生成される
```
> rails generate integration_test UserRegistFlow --spec
      invoke  mini_test
      create    test/integration/user_regist_flow_test.rb
```

#### *generators.rb*を利用する方法

```
Rails.application.config.generators do |g|
  g.test_framework :mini_test
  # or
  g.test_framework :mini_test, spec: true
end
```


```ruby
require "test_helper"

# To be handled correctly this spec must end with "Integration Test"
describe "User Integration Test" do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
end
```

# guard

```
group :development do
  gem 'guard-minitest'
end
```

`guard init minitest`

# Capybara


# summary


```
rake db:test:prepare
rake minitest:models
rake minitest:unit
```