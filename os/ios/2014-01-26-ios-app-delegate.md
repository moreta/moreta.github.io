---
title: iOS Delegate
date: 2014-01-26
tags: objective-c, ios, delegate
---



# AppDelegate

アプリケーションの起動や終了や中断などの処理を記載


アプリがはじめて起動する場合
* [ViewController] shouldAutorotateToInterfaceOrientation
* [AppDelegate] didFinishLaunchingWithOptions
* [ViewController] viewDidLoad
* [ViewController] shouldAutorotateToInterfaceOrientation
* [ViewController] viewWillAppear
* [ViewController] shouldAutorotateToInterfaceOrientation
* [AppDelegate]  applicationDidBecomeActive
* [ViewController] viewDidAppear

アプリが終了する場合
* [AppDelegate] applicationWillResignActive
* [AppDelegate] applicationDidEnterBackground

アプリが2回目の起動の場合
* [AppDelegate] applicationWillEnterForeground
* [AppDelegate] applicationDidBecomeActive