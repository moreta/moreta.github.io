---
title: iOS Cocoapods & libs
date: 2014-01-21
tags: ios, cocoapod, opensource
---

# iOS Cocoapods

# ま、基本的なのはsame with ruby gem

1. <http://guides.cocoapods.org/using/getting-started.html>
2. <http://guides.cocoapods.org/using/using-cocoapods.html>

# Install

`sudo gem install cocoapods`

特別な理由がなげればsudoなしでいい
rvmなど使っているならsudoを使ったらpathの問題で`Could not find 'cocoapods' (>= 0)`のようなエラーになったりする

```
gem install cocoapods
touch PodFile
emacs PodFile
```

### PodFile syntax

```
platform :ios, '6.0'

pod 'ObjectiveSugar', '~> 1.1.0'
pod 'RestKit', '~> 0.22.0'
pod 'Facebook-iOS-SDK', '~> 3.12.0'
pod 'SBJson', '~> 4.0.0'
pod 'TestFlightSDK', '3.0.0'
pod 'google-plus-ios-sdk', '~> 1.5.0'
```

ローカルのライブラリを使うとき

```
pod 'MyLibrary', :local => 'path/to/libary'
```

githubのライブラリを使うとき

```
pod 'AFNetworking', :git => 'https://github.com/gowalla/AFNetworking.git'
```

## Install Pod

`pod install`

xxx.xcodeproj から xxx.xcworkspace に変更される
