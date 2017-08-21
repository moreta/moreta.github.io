
# bugsnag

[bugsnag](https://www.bugsnag.com/)

+ Railsでも利用できる

```rb
    begin
      # ... some process and exception occur
    rescue => e
      # 何らかのエラーが発生した場合はログの書き込みと、
      # エラー通知サービスへの通知を行う
      logger.error e
      logger.error e.backtrace.join("\n")
      Bugsnag.notify e ## <<<<<<<<<< ここ
    end
```