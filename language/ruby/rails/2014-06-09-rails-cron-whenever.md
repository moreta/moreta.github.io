---
title: Rails cron
date: 2014-06-09
tags: rails, whenever, cron
---


## whenever

### 環境で区分する

<https://github.com/javan/whenever/wiki/Setting-variables-on-the-fly>

```
case @environment
when 'production'
  every 1.day, :at => "#{Time.parse('12:00 A').getlocal.strftime("%H:%M")}" do
    runner "Company.send_later(:create_daily_stories!)"
  end 
when 'staging'
  every 15.minutes do
    command "thinking_sphinx_searchd  reindex"
  end
end
```

## cronのevery x 時間がかぶらないように

でも、これだめだった。システムによってsyntaxがちがったりするみたい。
```
*/5+2 * * * * 1st-script
*/5+4 * * * * 2nd-script
```

## cron generator

<http://www.generateit.net/cron-job/>

## 参考

* <http://qiita.com/icb54615/items/ec84f2ed150909e56274>

# capistrano setting

