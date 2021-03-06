---
title: Get rid of Nokogiri LibXML warning on OSX
date: 2013-10-25 00:23
comments: true
tags: rails, mac
---

2016/10/25追記
============

# nokorigi installに必要lib

+ libxml2
+ libxslt
+ libiconv

手順

```
# nokogiriを削除
gem uninstall nokogiri

# brewを最新に
brew doctor       # インストール内容が最新かチェック
brew update       # ログにupdateの記述があったときに行う
brew upgrade      # 利用可能なアップデート版をアップグレード

brew tap homebrew/dupes                   # リポジトリの追加を行います
brew install libxml2 libxslt libiconv     # 必須ファイルのインストール
brew link --force libxml2            # meltediceさんからのフィードバック
brew link --force libxslt            # meltediceさんからのフィードバック

# nokogiri install
gem install nokogiri -- --use-system-libraries --with-iconv-dir="$(brew --prefix libiconv)" --with-xml2-config="$(brew --prefix libxml2)/bin/xml2-config" --with-xslt-config="$(brew --prefix libxslt)/bin/xslt-config"
# nokogiri check
nokogiri 1.6.2.1
```

# References

[Mac OS X Mavericksで”gem i nokogiri”失敗の解決方法](http://qiita.com/t_732_twit/items/a7956a170b1694f7ffc2)



Get rid of Nokogiri LibXML warning on OSX
====================================


# 前に

公式ホームページの内容を一回読んでみよう

<http://nokogiri.org/tutorials/installing_nokogiri.html>

## OS X mavericksにするときに警告がでた。

OSXをアップグレードするときによく発生する


### WARNING: Nokogiri was built against LibXML version 2.9.0, but has dynamically loaded 2.7.8の場合

<https://coderwall.com/p/o5ewia>

`gem install nokogiri -- --with-xml2-dir=/usr --with-xslt-dir=/opt/local --with-iconv-dir=/opt/local`


### WARNING: Nokogiri was built against LibXML version 2.7.8, but has dynamically loaded 2.9.0場合


これを参考にしたがってnokogiriを再インストール

<http://nokogiri.org/tutorials/installing_nokogiri.html>

```sh
#gem uninstall nokogiri libxml-ruby # libxml-rubyはインストールされてないので下のを使う
gem uninstall nokogiri

brew update # brew version update
brew tap homebrew/dupes # brew repository 追加
brew install libxml2 libxslt # libxml2, libxsltをインストール
brew link libxml2 libxslt # link
brew install libiconv # libiconvをインストール
```

インストールが終わったら以下のパスを確認し、bundle config にセットする


gem installでインストールするには

```
# 以下の2.9.1などのversionはlibxmlなどをインストールする時期によって異なるので、versionは合わせて修正する
gem install nokogiri -- --with-xml2-include=/usr/local/Cellar/libxml2/2.9.1/include/libxml2
                        --with-xml2-lib=/usr/local/Cellar/libxml2/2.9.1/lib
                        --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.28
                        --with-iconv-include=/usr/local/Cellar/libiconv/1.14/include
                        --with-iconv-lib=/usr/local/Cellar/libiconv/1.14/lib

```

`gem install nokogiri -- --with-xml2-include=/usr/local/Cellar/libxml2/2.9.1/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.9.1/lib --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.28 --with-iconv-include=/usr/local/Cellar/libiconv/1.14/include --with-iconv-lib=/usr/local/Cellar/libiconv/1.14/lib`

bundleを利用してインストールするには

```sh
bundle config build.nokogiri -- --with-xml2-include=/usr/local/Cellar/libxml2/2.9.1/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.9.1/lib --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.28 --with-iconv-include=/usr/local/Cellar/libiconv/1.14/include --with-iconv-lib=/usr/local/Cellar/libiconv/1.14/lib--with-xml2-dir=/usr --with-xslt-dir=/opt/local --with-iconv-dir=/opt/local
bundle
```


### それでもまだ警告がでる！

### WARNING: Nokogiri was built against LibXML version 2.9.1, but has dynamically loaded 2.9.0

これでしてみて

```sh
gem uninstall nokogiri
bundle install
```

だめだったら
Gemfileで
gem 'rails'のすぐ下にnokogiriをおく。

```sh
gem 'rails', '3.2.13'
gem 'nokogiri'
```


# おまけ

## Command Line Toolのインストールが必要な場合

<https://developer.apple.com/downloads/index.action>

ここから最新のCommand Line Toolsをダウンロード

## gem install eventmachineでエラーの場合

<http://stackoverflow.com/questions/11675614/cant-install-eventmachine-ruby-gem-using-rvm-macos-lion>

you are using clang / LLVM to build ruby - this is only experimentally supported, you need to use gcc-4.2 which is not LLVM based, this is described pretty good in rvm requirements:

```sh
rvm get head     # get the latest update with the new requirements
rvm requirements # read carefully and follow instructions!
```

### g++4.2がない!と怒られた場合

versionとインストールされているか確認

```sh
gcc --version
Apple LLVM version 5.0 (clang-500.2.79) (based on LLVM 3.3svn)
```

```sh
g++ --version
Apple LLVM version 5.0 (clang-500.2.79) (based on LLVM 3.3svn)
```

ある？

gcc 及び g++ へのシンボリックリンクを作成する

前述のとおり、gcc と g++ はインストールされているけど、うまく参照できていないだけだったので、シンボリックリンクを作成しました。

```sh
sudo ln -sf /usr/bin/g++-4.2 /usr/bin/g++
sudo ln -sf /usr/bin/gcc-4.2 /usr/bin/gcc
```

または

```sh
sudo ln -sf /usr/llvm-gcc-4.2/bin/llvm-g++-4.2 /usr/bin/g++
sudo ln -sf /usr/llvm-gcc-4.2/bin/llvm-gcc-4.2 /usr/bin/gcc
```

これでmiddlemanがinitできた


### 他、インストール方法

```sh
gem install nokogiri -- --use-system-libraries

If you are using Bundler, tell it to use the option:

bundle config build.nokogiri --use-system-libraries
bundle install
```
