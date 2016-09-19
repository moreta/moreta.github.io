---
title: Firebase
date: 2016/09/19
tags: firebase
---

# What is firebase

+ MBass (Mobile Backend as a Service)の一つ
+ googleに2014年に買収

# 特徴

+ リアルタイム同期型データベース
  + データに変更があると，即座に各クライアントに通知される（Push型）
    + 各クライアントではそれらのイベントを適切に処理することで，リッチでリアルタイムな体験をユーザに提供することができます
  + ローカルコピーを持つ
    + オフライン時の制御が容易になります
    + internetが接続できない環境であってもデータベースへの処理が(読み、書き込み)成功したように見える
+ ユーザ認証とデータアクセス管理
  + Firebaseでサーポートする認証
    + Firebase自体にアカウントとパスワードを登録し，それを使ってログイン
    + 一時的な匿名ログイン
    + Facebook,Twitter,GitHub,GoogleアカウントなどのOAuth機能を利用したログイン
    + 完全に自前の認証基盤との連携

# References

+ [スマホアプリ開発を加速する，Firebaseを使ってみよう](http://gihyo.jp/dev/serial/01/firebase/0001)
+ [Google I/O 2016 で「Firebase」の新バージョンが発表！プッシュ通知機能を iOS アプリで使ってみた](http://dev.classmethod.jp/smartphone/firebase-notification-ios/)
