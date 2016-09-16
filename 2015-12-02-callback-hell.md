---
title: Callback Hell
date: 2015-12-02
tags: nodejs, callback, es6, javascript
---

# なぜコールバック地獄になるのか

JavaScriptにはシェルスクリプトで言うところのsleepに相当する関数がありません。

無限ループを使って無理やり再現することはできますが、
もしそうしてしまうとsleep中はブラウザーがフリーズし、
操作できなくなってしまいます。
常にsetTimeout()のような関数を使い、
非同期に処理を行っていくことが強く推奨されます。


# Generator

## yield

- `yield`と書かれた部分が一時停止・再開のポイントになる
- `yield`まで到達すると処理は中断され、`.next()`もしくは`.send()`が呼び出されると、その時点から次のyieldに到達するまで処理されます

# Refereces

- <http://techblog.yahoo.co.jp/programming/js_callback/>


