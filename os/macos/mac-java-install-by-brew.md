---
title: Mac OS X Java Install
date: 2013-10-28
tags: mac, java
---



# 最近版をinstall 

2018/04/26 現在 java 10
```
brew update # brewを更新
brew doctor # brewのエラーチェック
brew cask install java
```

## 過去version install

```
brew tap caskroom/versions
brew cask search java # installできるversionを確認
brew cask install java8
```

## install 確認

```
brew cask info java
```

# java homeを探す

```
/usr/libexec/java_home
```

# Javaのバージョン切り替え
Java9を使いたい時

```
export JAVA_HOME=`/usr/libexec/java_home -v 9`
```

Java8を使いたい時

```
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
```

こうやって切り替えを行う


# References 

* [JAVA_HOMEについて](https://qiita.com/Terry3/items/9a1a8f1b6de349cee5ef)
+ [MacのBrewでJava8 + Java9を利用する](https://qiita.com/seijikohara/items/56cc4ac83ef9d686fab2)