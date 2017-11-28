---
title: Robots.txt
data: 2014-12-29
tags: seo, robots
---

複数定義する場合には**改行**を入れる

## すべてのクローラに対してアクセス禁止

User-agent: *
Disallow: /

## 特定 bot

```
User-agent: SemrushBot
User-agent: istellabot
User-agent: MJ12bot
User-agent: BLEXBot
User-agent: YandexBot
User-agent: Sogou
Disallow: /
```

## 特定botを特定時間間隔で

```
User-agent: xbot
Disallow: /

User-agent: bingbot
Crawl-delay: 2
```


が！、 bingbot, googlebotは Crawl-delayが聞かない

# bingbotの場合にはbing用 webmaster toolsで設定する

<http://www.bing.com/toolbox/webmaster>

設定しようとしたが、