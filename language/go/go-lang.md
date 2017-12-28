---
title: GO Lang
date: 2016-06-13
tags: go-lang
---

# Install & setting

```
brew install go
```

## install by gvm

<https://qiita.com/nrainiero/items/28ab4fbe728986bf72dd>


fisherman install

```sh
$ curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
```

bass install

```sh
fisher edc/bass // bassのインストール
bash            // bash環境に入ります

// 先程のgvmをインストールするコマンドを実行
$ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

~/.config/fish/config.fish へgvm設定
```sh
function gvm
  bass source ~/.gvm/scripts/gvm ';' gvm $argv
end
```

install go
```sh
gvm install go1.4 -B # -Bしないとエラー
gvm install go1.9.2 -B # -Bしないとエラー
```

default設定
```
gvm list
gvm use go1.4 --default
```

```
echo $GOPATH
# /home/ec2-user/.gvm/pkgsets/go1.8.3/global
echo $GOROOT
# /home/ec2-user/.gvm/gos/go1.8.3
```


## go path設定

go getを使うためにはGOPATH設定が必要

<https://golang.org/doc/code.html#GOPATH>

```
# bash shell
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# fish shell
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH
```



## tour install

```
go get golang.org/x/tour/gotour
gotour

2016/06/14 00:25:02 Serving content from /$HOME/go/src/golang.org/x/tour
2016/06/14 00:25:02 A browser window should open. If not, please visit http://127.0.0.1:3999
2016/06/14 00:25:03 accepting connection from: 127.0.0.1:64176
```
