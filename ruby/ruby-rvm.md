---
title: ruby rvm
date: 2013-12-03
tags: ruby, rvm
---

# インストール

<https://rvm.io/rvm/install>

## macでインストールするときにあらかじめ入っていたらいいもの

```
brew install gpg2
brew install coreutils
brew install openssl
brew link --force openssl
```

## Install RVM stable with ruby

以下のcommandはuserことにするのがいい。

もし、rootでするのであれば、あとからuserことにインストールするときにrvmでうまく行かなかったりする
すでにrootでインストールしているのであれば、したので[single user install]を参考

```
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
```
※ gpg2が入っていない場合は以下のコマンド

```
brew install gpg2
```

```
rvm get stable
rvm list known
rvm install 1.9.3-p327
rvm use 1.9.3-p327 --default
```

もし、macでエラーがなる場合には xcode toolがインストールされてない場合がある。

Can't find Tcl configuration definitions このようなエラー

```
sudo xcode-select --install
```

*upgrade*

```
rvm install 2.1.4
rvm upgrade 2.1.3 2.1.4
rvm upgrade 2.1.3 2.1.5
rvm install 2.2.0
```

*remove*

```
rvm remove 2.1.4
```

# gemset

```sh
rvm gemset create [gemset_name] # 生成
rvm gemset delete [gemset_name] # 削除
rvm gemset use [gemset_name]
```

# Trouble Shooting

## shell_session_update: command not found 

```
/var/folders/jp/vhlgbc4x3f3bb6551hybl5f80000gp/T/rvm.fish.XXXXXXXXXX.Znu6IC3C: shell_session_update: command not found
```
がでたときには

```
rvm get stable
```

## なんらかインストールがうまくいかないときやcompileされないとき

<https://gist.github.com/zenkay/3237860>

```
gem install pg -v '0.15.1' -- --with-pg-config=/Applications/Postgres93.app/Contents/MacOS/bin/pg_config
```

## Getting “Warning! PATH is not properly set up” when doing rvm use 2.0.0 --defaultのようなwarningが出る

<http://stackoverflow.com/questions/18276701/getting-warning-path-is-not-properly-set-up-when-doing-rvm-use-2-0-0-defaul>


## eventmachine install error on MacOS

```
make "DESTDIR="
compiling binder.cpp
In file included from binder.cpp:20:
./project.h:116:10: fatal error: 'openssl/ssl.h' file not found
#include <openssl/ssl.h>
```

解決

```
brew link openssl --force
gem install eventmachine -v '1.0.8'
```

## nio4rがエラー

```
brew update
```

```
softwareupdate --list # see the list of outdated software.
softwareupdate --install --all # update all outdated software.
softwareupdate --install <product name> # update the software you named.
```

<http://wknar.hatenablog.com/entry/update-gcc-and-v8>

```
brew tap homebrew/versions
brew install gcc49
ln -s /usr/local/bin/gcc-4.9 /usr/local/bin/gcc
ln -s /usr/local/bin/g++-4.9 /usr/local/bin/g++
```


## rvm : Warning! PATH is not properly set up.../bin is not at first place

```
Warning! PATH is not properly set up, '/Users/seo/.rvm/gems/ruby-2.2.5/bin' is not at first place,
         usually this is caused by shell initialization files - check them for 'PATH=...' entries,
         it might also help to re-add RVM to your dotfiles: 'rvm get stable --auto-dotfiles',
         to fix temporarily in this shell session run: 'rvm use ruby-2.2.5'.
```

これ
```
rvm use ruby-2.1.0
```
とかしてuseを実行するとなくなるけど、もう一回ターミナルを開くとまたでる。多分default rubyが読みこまれないんだと思う。

結局 rvm fish pluginを削除して、rvmサイトにあるscritpを適用した

```
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
echo "rvm default" >> ~/.config/fish/config.fish
```

## eventmachine error

```
brew install openssl
brew link --force openssl
bundle install
```


# Uninstall

```
rvm implode
rvm 
```
