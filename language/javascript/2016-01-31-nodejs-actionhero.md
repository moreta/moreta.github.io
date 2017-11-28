---
title: Node.js Actionhero
date: 2016-01-31
tags: nodejs, actionhero
---

+ [actionhero](https://github.com/evantahler/actionHero)
+ [actionhero-tutorial](https://github.com/evantahler/actionhero-tutorial)

# Quick start

```
npm install actionhero
./node_modules/.bin/actionhero generate
npm start
```

```
2016-06-11T12:21:17.933Z - info: Generation Complete.  Your project directory should look like this:
|- config
| -- api.js
| -- errors.js
| -- i18n.js
| -- logger.js
| -- redis.js
| -- routes.js
| -- tasks.js
| -- servers
| ---- web.js
| ---- websocket.js
| ---- socket.js
|-- (project settings)
|
|- actions
|-- (your actions)
|
|- initializers
|-- (any additional initializers you want)
|
|- log
|-- (default location for logs)
|
|- node_modules
|-- (your modules, actionhero should be npm installed in here)
|
|- pids
|-- (pidfiles for your running servers)
|
|- public
|-- (your static assets to be served by /file)
|
|- servers
|-- (custom servers you may make)
|
|- tasks
|-- (your tasks)
|
|- locales
|-- (translation files)
|
|- tests
|-- (tests for your API)
|
readme.md
package.json
```

# Action

+ actionは : workの基本単位
+ actionの目的はdata.paramsを読で data.responseにセットすること

## generate Action
```
 ./node_modules/.bin/actionhero generateAction --name=myAction
```

## versions

+ 同じactionに対してmultiple versionをサポート
