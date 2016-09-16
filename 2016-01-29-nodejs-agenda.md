---
title: Agenda
date: 2016-01-29
tags: js, job, scheduler, node
---

# Agenda

ながれ

1. Defining job
2. on ready
3. Creating job

## sample code

<http://code.runnable.com/U2RE8d2YyYk_iaGU/agenda-module-example-for-node-js-for-npmawesome-and-nodejitsu>

## Defining Job Processors | Job Processorsの定義

+ define(jobName, [options], fn)

### Async & sync job

違いは `done()`を使うは使わないか

Async Job

```
agenda.define('some long running job', function(job, done) {
  doSomelengthyTask(function(data) {
    formatThatData(data);
    sendThatData(data);
    done();
  });
});
```

sync job

```
agenda.define('say hello', function(job) {
  console.log("Hello!");
});
```


## Creating Jobs

Jobを生成する方法

以下のmethodがある

+ every(interval, name, [data, [options]], [cb])
  + 指定されたintervalで継続して実行する
+ schedule(when, name, [data], cb)
  + 指定された時間に一回実行
+ now(name, [data], [cb])
  + 即時に実行
+ create(jobName, data)

## Managing Jobs

+ jobs(mongodb-native query)
+ cancel(mongodb-native query, cb)
+ purge(cb)

## Starting the job processor

+ start
  + Starts the job queue processing
+ stop

## Multiple job processors


## Human Interval

<https://github.com/rschmukler/human-interval>

agendaで利用している

`every`のintervalをしていするにはこれを使う

- `interval` can be a **human-readable format** String, a **cron format** String, or a **Number**.

# 注意

### `agenda.on('ready', function() {}`の中に
