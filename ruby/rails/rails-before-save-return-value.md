
# before_saveでfalseを返すのsaveされない (before Rails5)

before_xxx コールバックの最後では self か true を返すこと

```rb
 def prepare_save
    if hoge_check_ok?
      self.checked = true
    else
      self.checked = false
    end
    self # or true
  end
```

# Rails5から`before_` callbackでfalse返しても callback chainは中断されない

<http://blog.bigbinary.com/2016/02/13/rails-5-does-not-halt-callback-chain-when-false-is-returned.html>

もし、明視的に止めたい場合には`throw(:abort)`を利用する

```rb
class Order < ActiveRecord::Base

  before_save :set_eligibility_for_rebate
  before_save :ensure_credit_card_is_on_file

  def set_eligibility_for_rebate
    self.eligibility_for_rebate ||= false
    throw(:abort) # ここ
  end

  def ensure_credit_card_is_on_file
    puts "check if credit card is on file"
  end

end

Order.create!
=> ActiveRecord::RecordNotSaved: Failed to save the record
```

# References

[ActiveRecordのbefore_saveでうっかり](http://qiita.com/suginoy/items/b10a1829e008a44d8a0c)