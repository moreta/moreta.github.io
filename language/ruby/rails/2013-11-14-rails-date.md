---
title: Rails date
date: 2013-11-14
tags: rails, date, format
---


## 時間を「x分前」「x時間前」

Railsで時間を「◯分前」「◯時間前」にフォーマットする

<http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-time_ago_in_words>
<http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html#method-i-distance_of_time_in_words_to_now>

<http://qiita.com/naoty_k/items/1920b7e0e8a1ac1ff5f6>


```ruby
time_ago_in_words user.created_at
```

## selectファーム

### date_select 

<http://blog.inouetakuya.info/entry/2014/01/31/233000>