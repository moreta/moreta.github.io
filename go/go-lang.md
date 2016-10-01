---
title: GO Lang
date: 2016-06-13
tags: go-lang
---

# Install & setting

```
brew install go
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
