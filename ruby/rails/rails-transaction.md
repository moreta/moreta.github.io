

# 基本形

```rb
begin
  ActiveRecord::Base.transaction do
    .
    .
    raise 'ロールバックします'
  end

  p 'コミット' # トランザクション処理を確定
rescue => e
  p 'ロールバック' # トランザクション処理を戻す
end
```

# ActiveRecord::RecordInvalidでrescue
<http://api.rubyonrails.org/classes/ActiveRecord/RecordInvalid.html>

```rb
begin
  complex_operation_that_internally_calls_save!
rescue ActiveRecord::RecordInvalid => invalid
  puts invalid.record.errors
end
```


# References

+ [rails save! create! update!のバリデーション例外を捕捉する](http://qiita.com/metheglin/items/db595d972df99b3849c2)
+ [begin~rescue~ensureとraiseを利用した例外処理の流れと捕捉について](http://qiita.com/ktarow/items/9d8f3217bb148f2e51d2)
