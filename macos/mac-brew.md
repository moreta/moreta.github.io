---
title: HomeBrew
date: 2014-03-28
tags: brew, HomeBrew
---

# summaries

```sh
brew update # brew version update
brew tap homebrew/dupes # brew repository 追加
brew install libxml2 libxslt # libxml2, libxsltをインストール
brew link libxml2 libxslt # link
brew install libiconv # libiconvをインストール
brew install postgresql
```

## install brew

`$ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"`

### Mac OSX: gemをインストールするときにこれをしておくとエラー防げる

For other gems (like nokogiri) you may need to symlink gcc to gcc4.2:

`$ sudo ln -s /usr/bin/gcc /usr/bin/gcc-4.2`

## install lib

```
brew install https://github.com/couchbase/homebrew/raw/stable/Library/Formula/libcouchbase.rb
brew install lib_name
```

## uninstall lib

`brew uninstall libcouchbase`

## doctor

`brew doctor`


## update & upgrade

```
brew update && brew upgrade
```

## リポジトリを追加してフォーミュラを増やす

```
brew tap homebrew/dupes # duplicate folmularのrepository
```

# homebrew/dupes??

+ These formulae duplicate software provided by OS X
+ OSXが提供するのをかぶるのを管理

```
brew install homebrew/dupes/<formula>

or
brew tap homebrew/dupes
brew install <formula>
```


# Installed libraries directory(Celller)

brew（醸造:じょうぞう）したお酒（libarary）はCelller（酒蔵:さかぐら）に保存される

```
/usr/local/Cellar/
```


## Homebrewの使い方一覧

<http://tech.caph.jp/2011/04/06/homebrew%E3%81%AE%E5%B0%8E%E5%85%A5%E3%81%A8%E4%BD%BF%E3%81%84%E6%96%B9/>

|             command             |                   detail                  |
|---------------------------------|-------------------------------------------|
| brew install foo                | install foo                               |
| brew install --HEAD foo         | install HEAD version of foo               |
| brew install --force --HEAD foo | install new HEAD version of foo           |
| brew search                     | display all installable formular          |
| brew search foo                 | display installable formular name had foo |
| brew search /foo/               | regex search                              |
| brew list                       | display installed formular                |
| brew list foo                   | display installed foo formular            |
| ... etc                         |                                           |
| brew services                   | display service list                      |
|                                 |                                           |

## brew services

つかうためには

```
brew tap homebrew/services
```

### commands

$ brew services list | grep mongodb
$ brew services start mongodb
$ brew services stop mongodb

# homebrewで複数のversionを使う方法

<http://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula>

+ 

# homebrew-cask

## brew bundle & cask

brew bundle でアプリケーションインストール & caskでdmgインストール

+ <http://www.1x1.jp/blog/2014/04/how-to-setup-application-on-osx.html>
+ <http://www.task-notes.com/entry/20150129/1422459342>
+ <http://www.task-notes.com/entry/20150406/1428289200>


## homebrew-cask install

Homebrew-caskをインストールします。インストールすることでbrew caskという外部コマンドが使えるようになります
`brew install caskroom/cask/brew-cask`

これは次のようにbrew tapしてインストールするのと同じです

`brew tap caskroom/cask`
`brew install brew-cask`

## アプリを探す

`brew cask search <app-name>`でインストール可能なアプリを検索

### パプリをインストール

`brew cask install <app-name>`

`brew cask install java7`

#### インストール先

```
$ ls /Library/Java/JavaVirtualMachines/
jdk1.7.0_76.jdk jdk1.8.0_05.jdk
```

```
$brew cask search java
==> Exact match
java
==> Partial matches
eclipse-java		  java6			    java7		      javafx-scene-builder	yourkit-java-profiler
```

dmgをマウントしてアプリアイコンをドラッグしてインストールする

`brew cask install dropbox`


## brewdler

<https://github.com/andrew/brewdler>


### Brewdler

rubyの bundlerのようなもの

#### Install

`brew tap Homebrew/brewdler`

#### *Brewfile*

```
tap 'caskroom/cask'

brew 'tig'
brew 'pgcli'

cask 'google-chrome'
```

### run - Brewfileであるdirectoryで実行

`brew brewdle`


## UTILS

### Postgresql - Database

```
brew install postgresql
brew info postgresql
```

#### brew upgradeなどしたらpostgresqlが起動しない場合

<http://rcmachado.github.io/postgres/postgis/2014/12/20/upgrading-postgresql-using-homebrew.html>

```
cd /usr/local/
./Cellar/postgresql/9.4.1/bin/pg_upgrade -d var/postgres.old -D var/postgres -b Cellar/postgresql/9.3.5_1/bin -B Cellar/postgresql/9.4.1/bin

Performing Upgrade
------------------
Analyzing all rows in the new cluster                       ok
Freezing all rows on the new cluster                        ok
...
...
Upgrade Complete
----------------
Optimizer statistics are not transferred by pg_upgrade so,
once you start the new server, consider running:
    analyze_new_cluster.sh

Running this script will delete the old cluster's data files:
    delete_old_cluster.sh
```

Don’t forget to adjust the paths to correct versions!

`pg_upgrade` will ran some checks and start migrating you data from old directory to the new one - this shouldn’t tak much time,
but it depends on the size of databases. After it finishes, startup your database server again. If you use launchd:

`launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`
Now we can run some more commands to generate optimizer statistics and cleanup old files:

./analyze_new_cluster.sh
./delete_old_cluster.sh

```
brew cleanup postgres
Removing: /usr/local/Cellar/postgresql/9.3.5_1...
Removing: /usr/local/Cellar/postgresql/9.4.0...
```

#### postgres start & stop
```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

### Console Util - Pgcli

`brew install pgcli`

`pgcli -h localhost -U postgres db_name`

# Recommand Packages : 入れて置くべき

+ ccat
  + syntax color with cat
+ tree
  + tree view ls
+ jq
  + json parser cli
+ rename
  + file rename

# References

* <http://deeeet.com/writing/2013/12/23/brewfile/>
