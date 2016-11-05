---
title: Jetbrain Editor Watcher setting
date: 2016-02-11
tags: java, editor, watcher
---

watcherの利用はテスト用か個人用かな、
実際にproductを作るときにはserverを起動して利用するのがいい。

# Babel watcher

+ File type: Javascript
+ Scopeを作って選択
   
directoryを選択し、includeをクリックすると以下のようになる
![source scope create](https://dl.dropboxusercontent.com/u/21522805/blog/editor/jetbrain-source-scope-create.png)

+ Program : .../bin/babelを指定
  + babel6なら babel-cliとpresetがglobal installされていること

```
"babel-cli": "^6.4.5",git
"babel-preset-es2015": "^6.3.13",
"babel-preset-react": "^6.3.13",
"babel-preset-stage-0": "^6.3.13"
```

+ Argument : --source-maps --out-file $FileNameWithoutExtension$-compiled.js $FilePath$
+ Working Directory: $FileDir$
+ Output paths to refresh : $FileNameWithoutExtension$-compiled.js:$FileNameWithoutExtension$-compiled.js.map
