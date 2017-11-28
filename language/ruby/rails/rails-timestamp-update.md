ActiveRecord で timestamp を更新せずに保存する
===========================================

before rails5
```ruby
ActiveRecord::Base.record_timestamps = false
# or
model.record_timestamps = false
model.save
```

from rails5

```
model.save_wo_timestamp
```

# References

+ <https://wwwtech.de/articles/2013/oct/rails-update-dataset-without-updating-magic-timestamp-columns>
+ [](https://qiita.com/kakkunpakkun/items/b286f789ca8590104ad1)