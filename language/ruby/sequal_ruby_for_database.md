

# Read-Only Slaves/Writable Master and Database Sharding

<http://sequel.jeremyevans.net/rdoc/files/doc/sharding_rdoc.html>


# Database Sharding

<http://sequel.jeremyevans.net/rdoc/files/doc/sharding_rdoc.html#label-Sharding>


# dataset

+ ほとんどの場合datasetを使う。
+ raw sqlを利用する場合にはdatasetを使う
  + この場合 `DB[:t].with_sql (sql, *args)`を使う
  + fetchは使わない datasetのほうがいい


## unionが必要なクエリを作るexample

<http://sequel.jeremyevans.net/rdoc/classes/Sequel/Dataset.html>

```ruby
# idが is nullのデータと
# idが一致するデータをunion allする

# .unionを利用
@timelines = SequelDB[:t].where(t_id: nil)
             .union(SequelDB[:t].where(t_id: t_id), all: true) # union all
             .extension(:pagination)
             .paginate(page_no, page_size)

# .with_sqlを利用
@timelines = SequelDB[:t].with_sql(UNION_QUERY, :t_id => t_id)
             .extension(:pagination)
             .paginate(page_no, page_size)
```

# pagination plugin

* 別でinstallが必要ない内蔵されているpagination plugin

<http://sequel.jeremyevans.net/rdoc-plugins/files/lib/sequel/extensions/pagination_rb.html>

# 大量データをselect

# References

+ [documentation](http://sequel.jeremyevans.net/documentation.html)
+ [Sequel::Dataset](http://sequel.jeremyevans.net/rdoc/classes/Sequel/Dataset.html)
+ [Why you should stop using ActiveRecord and start using Sequel](https://mrbrdo.wordpress.com/2013/10/15/why-you-should-stop-using-activerecord-and-start-using-sequel/)
+ [sequel cheetsheet](https://devhints.io/sequel)
