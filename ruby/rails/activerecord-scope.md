

sample code
```ruby
class User < ActiveRecord::Base
  scope :male,   ->{ where(sex: :male) }   # 男性
  scope :female, ->{ where(sex: :female) } # 女性
  scope :adult,  ->{ where(arel_table[:age].gteq 20) } # 成人
  scope :minor,  ->{ where(arel_table[:age].lt 20) }   # 未成年
  scope :men,    ->{ adult.male }   # 成人,男性
  scope :women,  ->{ adult.female } # 成人,女性
  scope :boys,   ->{ minor.male }   # 未成年,男性
  scope :girls,  ->{ minor.female } # 未成年,女性
end
```

# References

+ [既存のscopeからor条件のSQLを組み立てる](http://qiita.com/ichi_s/items/22f3535c3e8adb901902)
