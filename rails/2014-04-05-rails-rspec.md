---
title: Rails Test with rspec
date: 2014-04-05
tags: ruby, unittest, rspec
---


# Install & Init

<http://qiita.com/luckypool/items/e3662170033347510c3c>

```
gem install rspec
rspec --init

> create   .rspec
> create   spec/spec_helper.rb
```



## db
`rake db:test:prepare`

もし、DBにdependencyな処理があるのであれば`scheme.rb`からテーブル作成したらテストが失敗する
なので、

development.rbに以下を入れて
`config.active_record.schema_format = :sql`

`rake db:migrate`すると`db/structure.sql`が生成されるのでその後テストを実行すれば大丈夫

## gem
```
group :development, :test do
  gem "rspec", "2.4.0"
  gem "rspec-rails", "2.4.1"
end
```

## setting

railsを使うときには以下でしないと`rails_helper.rb`が生成されない

```
rails generate rspec:install
```


## sample code

```
describe Array do
  context "空の場合" do
    before do
      @array = []
    end
    it "sizeが0であること" do
      @array.size.should == 0 end
    end

  context "要素が1つの場合" do
    before do
      @array = ["hello"]
    end
    it { @array.size.should == 1
    it { @array[0].should == "hello" } ❻
  end
end
```

# Rspec機能

## describe, context

* describe はテスト対象(クラス、メソッド)を記述 する
* context はテスト対象の状態や状況を記述する


## before、after

サンプルグループの 単位で一度だけ実行したい場合
```
before(:all)
after(:all)
```
のように記述


## テスト実行

### 全テスト

`rake spec`

### 一部テスト

`bundle exec rspec spec/models/user_spec.rb:10`


## command集

```
rails g integration_test password_reset
```

# Guard

guard設定ファイル
`guard init rspec`

実行
`bundle exec guard`

## rubymine

<http://stackoverflow.com/questions/11996124/is-it-impossible-to-use-guard-with-rubymine/12000765#12000765>

# FactoryGirl

<https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md>

## rspec setting
```
# rspec (spec_helper.rb)
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

```

## controller

### get、post、put、delete

```
get 'index'
post 'create', { :name => "名前" }
```

### response

アクションを呼び出した際の HTTP レスポンスを取得するためのメソッド

```
response.should be_success
response.should redirect_to(root_path)
```

### assigns

コントローラのインスタンス変数を取 得するためのメソッド

`assigns(:user).should == User.first`

###  flash、session、cookie

```
flash[:notice].should == "完了しました。"
session[:user_id].should == "xxx"
```

### HelperテストでControllerのhelper_methodを利用する方法

* <http://stackoverflow.com/questions/10537932/unable-to-stub-helper-method-with-rspec>
* <https://groups.google.com/forum/#!topic/urug/tHggdJNBPFI>

stubで追加
```
@current_user = build(:user)
helper.stub(:current_user) { @current_user }
```


## Setup Rails 4.1, Spring, Rspec, and Guard

<http://murayama.hatenablog.com/entry/2014/05/11/104108>

```
group :development, :test do
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end
```
