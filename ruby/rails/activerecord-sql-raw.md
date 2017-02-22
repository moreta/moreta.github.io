ActiveRecordで生のSQLを書く
==========================

+ find_by_sql
+ ActiveRecord::Base.connection.select_all
  + 返り値はActiveRecord::Result、各要素はHashになっておりドットアクセスができない。プレースホルダーもActiveRecord::Base::sanitizeとかを使わないと利用できない。
+ ActiveRecord::Base.connection.execute
  + 返り値はMysql2::Result。各要素の取得に一手間必要で面倒。
+ ActiveRecord::Base.connection.select


# find_by_sql

```rb
users = User.find_by_sql(['select * from users where id = ?', 1])

puts users.class.name
#=> "Array"

puts users.first.class.name
#=> "User"

puts users.first.id
#=> 1

# 名前付きプレースホルダバージョン
users = User.find_by_sql(['select * from users where id = :id', {id: 1}])
```

+| 

# References

+ [ActiveRecordで生SQLを使いたいときに便利なメソッド達](http://qiita.com/yut_h1979/items/4cb3d9a3b3fc87ca0435)