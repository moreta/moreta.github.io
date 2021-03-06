Rails Log
===============


# Log Level

loggerは次の5つのレベルを持ち、設定によって書き出すログのレベルを制御します。

option | 説明
-------|---------------------------
fatal  | プログラムのクラッシュなど、制御できないエラー
error  | プログラムで制御できるエラー
warn   | 警告
info   | システム操作や、管理に役立つ情報
debug  | 開発者向けの情報


# initialize

```rb
logger = Logger.new('log/rake.log')
```


# log level

```rb
logger.unknown("不明なエラー")
logger.fatal("致命的なエラー")
logger.error("エラー")
logger.warn("警告")
logger.info("通知")
logger.debug("デバッグ情報")
```

# 途中でエラーが発生しても続けたいケース

```rb
    begin
      # ... some process and exception occur
    rescue => e
      # 何らかのエラーが発生した場合はログの書き込みと、
      # エラー通知サービスへの通知を行う
      logger.error e
      logger.error e.backtrace.join("\n")
      Bugsnag.notify e

      # エラーが起きても次の処理へ進む
    end
```

# renderログが表示させない

[Railsログ中の”Rendered xxxx.html.erb”を静かにさせたかった](http://daily.belltail.jp/?p=2270)

action viewのログを全部消す

```rb
# config/environments/production.rb
MyApplication::Application.configure do
  ...
  # Not to show logs like Rendered xxxx.html.erb
  config.action_view.logger = nil
  ...
end
```

## logrageを使う
<https://github.com/roidrage/lograge/>

+ rails 3 : <https://github.com/roidrage/lograge/tree/v0.3.6>

```rb
gem 'lograge'
```
Enable it in an initializer or the relevant environment config:

```rb
# config/initializers/lograge.rb
# OR
# config/environments/production.rb
Rails.application.configure do
  config.lograge.enabled = true
end
```


# References

+ [Rakeタスクの賢いロギング](http://qiita.com/naoty_k/items/0be1a055932b5b461766)
+ [Railsアプリケーションにおけるエラー処理（例外設計）の考え方](http://qiita.com/jnchito/items/3ef95ea144ed15df3637)