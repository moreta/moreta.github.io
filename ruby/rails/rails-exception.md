

# rails exception notification gem
<https://github.com/smartinez87/exception_notification>


# Exception family tree

<http://ruby.bastardsbook.com/chapters/exception-handling/>

```
Exception
    NoMemoryError
    ScriptError
        LoadError
        NotImplementedError
        SyntaxError
    SignalException
        Interrupt
    StandardError
        ArgumentError
        IOError
            EOFError
        IndexError
            StopIteration
        LocalJumpError
        NameError
            NoMethodError
        RangeError
            FloatDomainError
        RegexpError
        RuntimeError
        SecurityError
        SystemCallError
        SystemStackError
        ThreadError
        TypeError
        ZeroDivisionError
    SystemExit
    fatal
```

# StandardErrorについて

## raise 関数に型を渡さない時に発生する例外は、 RuntimeError

```rb
raise "エラーメッセージ" # => RuntimeError が発生
```

# やってはいけない

## Exceptionクラスをrescueしないこと

+ RubyのExceptionクラスはすべての例外の祖先となるクラスであり
+ NoMemoryError等の致命的なエラー(Rubyの実行そのものが危うくなるエラー)まで含んでいる。

```rb

# NG!!
def self.send_daily_summary_to_all_users
  User.all.each do |user|
    begin
      UserMail.daily_summary(user).deliver
    rescue Exception => e ####### NG!!!!!!!!!!!
      ErrorUtility.log_and_notify e
    end
  end
end

# OK
def self.send_daily_summary_to_all_users
  User.all.each do |user|
    begin
      UserMail.daily_summary(user).deliver
    rescue StandardError => e ######## ここ重要
    # rescue => e # これは上と同じ StandardErrorは省略できる
      ErrorUtility.log_and_notify e
    end
  end
end
```

# railsでどこのcustom exception classを配置するか？

lib/以下に配置して

```ruby
module YourAppExceptions
  class AuthenticationError < StandardError; end
  class InvalidUsername < AuthenticationError; end
end
```

以下のように使う

```ruby
raise YourAppExceptions::InvalidUsername
```

# References

+ [rubyの例外についてまとめてみた](http://qiita.com/kasei-san/items/75ad2bb384fdb7e05941)
+ [Railsアプリケーションにおけるエラー処理（例外設計）の考え方](http://qiita.com/jnchito/items/3ef95ea144ed15df3637)
  + [ ] よんで
+ [Where to define custom error types in Ruby and/or Rails?](http://stackoverflow.com/questions/5200842/where-to-define-custom-error-types-in-ruby-and-or-rails)
