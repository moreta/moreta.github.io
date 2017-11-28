---
title: express
date: 2015-12-01
tags: nodejs, api, express
---

# expressとkoaで悩んでいた

- 実はloopbackも検討はしたが、licenseの問題があったため、やめた。
- koaをprosはいろいろあるが、nodeは始めてだし割りと安定的にdocumentを探せるexpressにすることにする。
- es6,7を使えないことでもないので、勉強しながら方法を探す。
- koaの方も続けてwatching

## Update : 2015/12/01

やはり、error handlingとerrorメッセージの表示など
hapi.jsがよさよう  

# generator vs step by step

v4からgeneratorのnpm packageが分離されている、勉強するときには一つずつするのが理解しやすい。