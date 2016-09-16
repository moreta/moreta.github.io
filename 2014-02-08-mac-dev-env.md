---
title: MAC OS Development Environment
date: 2014-02-08
tags: mac, dev-env,
---


## sudoコマンドをパスワードなしで

<http://blog.bungu-do.jp/archives/2417>

*LINUXの場合*

`/etc/sudoers`

こんな感じ

```
ec2-user ALL = NOPASSWD: ALL
```

なのでOSXでも同じ

`emacs /etc/sudoers`

read onlyになっているので編集可能に
`chmod +w /etc/sudoers`


```
# User privilege specification
root    ALL=(ALL) ALL
%admin  ALL=(ALL) ALL
# ここの許可するユーザーを追加
youruser ALL=(ALL) NOPASSWD: ALL
```

## brew install
```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```
## brew bundle でアプリケーションインストール

<http://www.1x1.jp/blog/2014/04/how-to-setup-application-on-osx.html>

*Brewfile*

```
update
upgrade

tap homebrew/versions
tap phinze/homebrew-cask
tap homebrew/binary
tap josegonzalez/php

install brew-cask
install zsh
install autojump
install git
install ctags
install tmux
install tig
install ansible
install wget
install curl
install jq
install vim
install boot2docker
install reattach-to-user-namespace
install php55 --with-pgsql --with-pdo-pgsql
install php55-mcrypt php55-xdebug php55-opcache composer

cask install dash
cask install phpstorm
cask install iterm2
cask install google-chrome
cask install firefox
cask install virtualbox
cask install vagrant
cask install kobito
cask install alfred
cask install dropbox
cask install evernote
cask install skitch
cask install github
cask install sequel-pro
cask install lastpass-universal
cask install openoffice
cask install bettertouchtool
cask install google-japanese-ime
cask install the-unarchiver
cask install coteditor
cask install istat-menus
cask install bartender
cask install skype

cask alfred link # for Alfred
```

Brewfileであるdirectoryで実行

`brew bundle`


## key binding

Karabiner(旧KeyRemap4MacBook)を使うと便利

### \(バックスラッシュ)と￥(円)

rubymineで\の入力ができないとき、他の方法だどうまくいかないので
karabinerを利用する。

![backslash](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-02-08/backslash.png)

## apache

### httpd.confはここ

`/etc/apache2/httpd.conf`
`/etc/`は`/private/etc/`のシンボリックリンク

`sudo emacs /private/etc/apache2/httpd.conf`
or
`sudo emacs /etc/apache2/httpd.conf`

### 起動中なのか確認

`ps aux | grep httpd`

### command

`sudo apachectl start|restart|stop`

### 自動startをやめたい

<http://stackoverflow.com/questions/20439788/how-to-stop-apache-permanently-on-mac-mavericks>

`sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist`


`/private/var/db/launchd.db/com.apple.launchd/overrides.plist`

### Sites folder以外の場所を読みたいときには symbolic linkがいい

`ln -s ~/Dropbox/Projects/MyWebsite ~/Sites/MyWebsite`

### DocumentRootはここ

`/Library/WebServer/Documents/`


