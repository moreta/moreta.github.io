---
title: "Mac OS X Mavericks Java6 Reinstall"
date: 2013-10-28
tags: mac, java
---

Mavericksでアップグレードしたらjava sdk6がなくなった！

<http://qiita.com/m_mysht/items/a5e60d260c7078331d66>

# 手順

0. `/Library/Java/JavaVirtualMachines/`を確認

もし、1.6.0が残っているのであればそのままそのdirectoryを
Eclipseなどで設定する以下の処理はしなくても大丈夫

## defaultで使いたいのであれば、

`ln -sf /Library/Java/JavaVirtualMachines/1.6.0_65-xxx.jdk/Contents/Home Home`


## 新しくダウンロード

1. ログイン
<https://developer.apple.com/jp/programs/>

2. リソースページ
<https://developer.apple.com/jp/resources/>

<https://developer.apple.com/downloads/index.action>

3. Search for keyword
Java for

4. Download & Install
Java for OS X 2013-005 Developer Package.dmgをインストール
