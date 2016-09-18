---
title: Node.js job scheduler
date: 2016-01-20
tags: js, job, scheduler, batch
---

# 候補

+ agendar
  + donwload数は3位
  + persistance layer : mongodb
  + ui : [angenda-ui](https://github.com/moudy/agenda-ui)
  + ためしたどころ、5秒以内のrepeat job schedule(and multiple job)にはバグがある感じ？
+ kue
  + backend : redis
+ node-schedule
  + donwload数は2位
  + persistance layar : no
+ node-cron  
  + download数的には一番多い
  + persistance layar : no
+ later.js
+ node-crontab
+ timexe

## persistance layarがないとforeverなどと一緒にしないと

+ serverがエラーで死んだら再実行されない。
 + うむ、persistance layerがあってもserverを復活しないと再実行できないじゃん、
 + 実行のタイミングをのがしたjobの実行はどうする？



# References

+ [Is there a job scheduler library for node.js?](http://stackoverflow.com/questions/3785736/is-there-a-job-scheduler-library-for-node-js)
+ [Node.jsで使うJobQueueとcron型Scheduleのリソース](http://qiita.com/masato/items/fbe503dbf34e7cfd2fe3)
+ [Node.jsのagendaでジョブをスケジュールする - Part1: ジョブのCRUD](http://qiita.com/masato/items/0236e3b0cda5b99debca)
+ ★★★
+ [human-interval](https://github.com/rschmukler/human-interval)
+ [Scheduled Email Delivery with Mailgun and Node.js](http://blog.mailgun.com/scheduled-email-delivery-with-mailgun-and-nodejs/)
+ [Run Periodic Tasks in Node with node-cron](http://stackabuse.com/run-periodic-tasks-in-node-with-node-cron/)
