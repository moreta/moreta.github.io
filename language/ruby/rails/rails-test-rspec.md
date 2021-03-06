Rails Test with rspec
=============================



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

```ruby
# sample 1
describe 'FizzBuzz' do
  describe '#run' do
    context '3の倍数' do
      example 'Fizzという文字列を返すこと' do
        expect(FizzBuzz.run(3)).to eq('Fizz')
        expect(FizzBuzz.run(6)).to eq('Fizz')
      end
    end
  end
end
# sample 2
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

## describe, context, example, it

+ describe
  + はテスト対象(クラス、メソッド)を記述 する
  + テストの対象
+ context
  + はテスト対象の状態や状況を記述する
  + 特定の条件
+ example & it
  + アウトプット
  + 日本語にするときにはexample
  + 英語でするときにはit

## before、after & let

* サンプルグループの 単位で一度だけ実行したい場合


```rb
before(:all)
after(:all)
```
のように記述

### beforeで共通の前準備をする

```rb
describe User do
  describe '#greet' do
    before do
      @params = { name: 'たろう' }
    end
  end
end
```
しかし、`@params`のinstance variableより`let`syntaxを使うのがいい
なぜなら、「遅延評価」されるため

* <https://qiita.com/jnchito/items/42193d066bd61c740612#user-%E3%82%92-let-%E3%81%AB%E3%81%99%E3%82%8B>
* [RSpecのletを使うのはどんなときか？（翻訳）](https://qiita.com/jnchito/items/cdd9eef2ed193267c651)


## テスト実行

### 全テスト

`rake spec`

### 一部テスト

`bundle exec rspec spec/models/user_spec.rb:10`


## command集

```sh
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

```rb
# rspec (spec_helper.rb)
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

```

## controller

### get、post、put、delete

```ruby
get 'index'
post 'create', { :name => "名前" }
```

### response

アクションを呼び出した際の HTTP レスポンスを取得するためのメソッド

```ruby
response.should be_success
response.should redirect_to(root_path)
```

### assigns

コントローラのインスタンス変数を取 得するためのメソッド

`assigns(:user).should == User.first`

###  flash、session、cookie

```sh
flash[:notice].should == "完了しました。"
session[:user_id].should == "xxx"
```

### HelperテストでControllerのhelper_methodを利用する方法

* <http://stackoverflow.com/questions/10537932/unable-to-stub-helper-method-with-rspec>
* <https://groups.google.com/forum/#!topic/urug/tHggdJNBPFI>

stubで追加

```rb
@current_user = build(:user)
helper.stub(:current_user) { @current_user }
```


# Rspec setup

```rb
RSpecのセットアップ

Gemfile
group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "guard-rspec"
  gem "spring-commands-rspec"
end

group :test do
  gem "faker"
  gem "capybara"
  gem "database_cleaner"
  gem "launchy"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
```

* rspec-rails
  * RSpec を含んでいる gem である。この gem は Rails 専用の機能を追加する RSpec の ラッパーライブラリになっている。
* factory_girl_rails
  * Rails がデフォルトで提供するフィクスチャをずっと便利な ファクトリ で置き換える。フィクスチャやファクトリはテストスイート用のテストデータを作成するために使われる。
* guard-rspec
  * 指定されたファイルを監視する。そして監視対象のファイルに応じてタスクを実行する。
* spring-commands-rspec 
  * Spring に bin/rspec コマンドのサポートを追加する。
* faker
  * は名前やメールアドレス、その他のプレースホルダを ファクトリ に提供する。
* capybara
  * ユーザと Web アプリケーションのやりとりをプログラム上で簡単にシミュレートできるようにする。
* database_cleaner
  * まっさらな状態で各 spec が実行できるように、テストデータベースのデータを掃除する。
* launchy
  * はあなたの好きなタイミングでデフォルトの webブラウザを開き、アプリケーションの表示内容を見せる。テストをデバッグするときには 大変便利である。
* selenium-webdriver
  * ブラウザ上で JavaScript を利用する機能を Capybara でテストできるようにする。
* shoulda-matchers
  * 数多くの便利なマッチャを自動的に使えるようにする。


# References

+ [RSpecの(describe/context/example/it)の使い分け](http://qiita.com/uchiko/items/d34c5d1298934252f58f)
+ [Better Specs { rspec guidelines with ruby }](http://betterspecs.org/jp/)
+ [RSpecによるRailsテスト入門](https://qiita.com/Morinikiz/items/cf179583c2c5d2e24c3c)
  + 初期設定は親切に書いてある
+ [使えるRSpec入門・その1「RSpecの基本的な構文や便利な機能を理解する」](https://qiita.com/jnchito/items/42193d066bd61c740612)
  + これよかった2018/05/30

## database_cleaer

<https://qiita.com/yoshitsugu/items/3470dbcadfdd677be543>