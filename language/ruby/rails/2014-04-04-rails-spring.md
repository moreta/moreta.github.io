---
title: Rails Spring & gem update
date: 2014-04-04
tags: ruby, gem-spring
---


 `gem "spring", group: :development`

 ```
 bundle install
 bundle exec spring binstub --all
 ```

 もし以下のような警告なでるのであればruby gemをupgradeしよう
 ```
 Warning: You're using Rubygems 1.8.24 with Spring. Upgrade to at least Rubygems 2.1.0 and run `gem pristine --all` for better startup performance.
 * bin/rake: generated with spring
 * bin/rails: spring inserted
 ```


```
gem -v
1.5.2
gem list rubygems-update

# rubygems-updateがあったら削除して再インストール
gem uninstall rubygems-update

gem install rubygems-update
update_rubygems
gem -v
2.2.2

gem pristine --all
```

## gem pristine --allでエラー

```
Compiling v8 for x64
Using python 2.7.5
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Unable to find a compiler officially supported by v8.
It is recommended to use GCC v4.4 or higher
Using compiler: g++

```

### libv8だけ入れる場合

`gem install libv8 -- --with-system-v8`

bundle でインストールする場合には

```
gem uninstall libv8
brew install v8
gem install libv8 -- --with-system-v8
```

```
gem uninstall libv8
brew install v8
bundle config build.livb8 --with-system-v8
bundle install
```

上のでもだめだったら以下のものでしてみる

### therubyracerを入れる場合

<http://stackoverflow.com/questions/19577759/installing-libv8-gem-on-mavericks>

Because libv8 is the interface for the V8 engine used by therubyracer,
you may need to use libv8, even if you have V8 installed already.
If you wish to use your own V8 installation, rather than have it built for you, use the --with-system-v8 option.

```
gem uninstall libv8
gem uninstall therubyracer

brew install apple-gcc42

sudo ln -sf /usr/local/bin/gcc-4.2 /usr/bin/gcc
sudo ln -sf /usr/local/bin/g++-4.2 /usr/bin/g++
sudo ln -sf /usr/local/bin/cpp-4.2 /usr/bin/cpp

bundle install
```

## 他

<http://d.hatena.ne.jp/suu-g/20121222/1356189597>

# Setup Spring

rspecをすでに使っていることが前提

<http://girders.org/blog/2014/02/06/setup-rails-41-spring-rspec-and-guard/>

```
spring binstub --all
* bin/rake: spring already present
* bin/rspec: generated with spring
* bin/rails: spring already present
```

私の場合はこれだけだったので

```
* bin/rake: generated with spring
* bin/rails: spring inserted
```

`gem 'spring-commands-rspec'`を追加する

その後もう一度`spring binstub --all`

```
* bin/rake: spring already present
* bin/rspec: generated with spring
* bin/rails: spring already present
```
これでrspecでspringを使えうようになる

## start stop status

```
> spring status

Spring is running:

 7335 spring server | yourapp | started 4 hours ago
88294 spring app    | yourapp | started 2 hours ago | development mode
```

```
> spring stop

Spring stopped.
```

## guard設定

```
guard :rspec do
# to
guard :rspec, cmd:"spring rspec" do
```