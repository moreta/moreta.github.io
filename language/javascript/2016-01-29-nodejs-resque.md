---
title: Node resque
date: 2016-01-29
tags: js, job, scheduler, resque, node
---

# Queue

```js
var queue = new NR.queue({connection: connectionDetails}, jobs);
```

+ jobsは必須ではないが、pluginを利用する場合には必須
  + <https://github.com/taskrabbit/node-resque/issues/105>
  +
   
## re-queueしたい

<https://github.com/taskrabbit/node-resque/blob/master/lib/plugins/simpleRetry.js>



# When failed

基本的にはfailed queueに入る

カスタムで処理したい場合にはpluginを作る


## pluginの例

+ node-resqueに基本的に入っている
  + <https://github.com/taskrabbit/node-resque/tree/master/lib/plugins>
  + これはチェックしておいたほうがいい
+ <https://github.com/lantins/resque-retry>
+ <https://github.com/resque/resque/wiki/Failure-Backends>

