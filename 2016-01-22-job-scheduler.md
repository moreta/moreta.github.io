---
title: Job scheduler
date: 2016-01-22
tags: job, scheduler, batch
---

# Ruby(Rails)

+ whenever
+ resque-scheduler
  + recommand

## Rails scheduler compare (choose resque-scheduler)

There are two options

+ whenever
  + cron base
+ resque-scheduler
  + resque base
  + maybe support clustering environment.

### Disadvantage using cron

whenever also very good choice, but this time i want to implement without cron.

+ サーバがダウンして、recorverした時に対応できない
+ clustering(multi server)環境では使えない


# Java

+ spring batch with quartz
  + no choice

# 他製品

<https://en.wikipedia.org/wiki/List_of_job_scheduler_software>

+ JP1
  + hitachi
+



# References

+ [脱cron! SOS JobschedulerでRailsのジョブ管理をしてみる](http://labs.timedia.co.jp/2014/03/cron-sos-jobschedulerrails.html)
