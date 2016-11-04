Spring Executor & @Async
=========================


# Springの非同期処理

+ Springの非同期はデフォルト `SimpleAsyncTaskExecutor` が使用される。
+ pool-size等の指定があれば `ThreadPoolTaskExecutor` が使用される。
+ `ThreadPoolTaskExecutor`を使用する場合、PoolSizeとMaxPoolSize、TaskQueueCapacityの関係に注意して見積もる。

# `@Async` の処理が待ってから落ちるようにする

[参考 : Spring Boot で @Async の処理が待ってから落ちるようにする](http://qiita.com/thrakt/items/c8f33a57636e5dcf9d48)

## 概要

Spring Boot で @Async をつけた処理は非同期で実行されますが、
そのままだとアプリ停止時に容赦なく途中で落ちる

## 以下の手順で実現できます。

1.  @Asyncで使われるプールを指定
2. アプリ停止時に、プール内のタスクが完了するまで待つようにする


## code

プールの定義 (executor)

`setAwaitTerminationSeconds`をの設定がキモ。設定しないと待たなくなる

```java
@Bean
public ThreadPoolTaskExecutor asyncExecutor() {
    ThreadPoolTaskExecutor threadPool = new ThreadPoolTaskExecutor();

    // 最大3タスク
    threadPool.setCorePoolSize(3);
    threadPool.setMaxPoolSize(3);

    // アプリ終了時にshutdown
    threadPool.setWaitForTasksToCompleteOnShutdown(true);
    // shutdown時に実行完了を最大15分待つ
    threadPool.setAwaitTerminationSeconds(60 * 15);

    return threadPool;
}
```

@Asyncの設定でプールを指定

```java
@Configuration
@EnableAsync
class AsyncConfigurer extends AsyncConfigurerSupport {

    @Autowired
    private ThreadPoolTaskExecutor asyncExecutor;

    @Override
    public Executor getAsyncExecutor() {
        return asyncExecutor;
    }
}
```

## 実行

これで動かした感じ、kill -15しても終わってから落ちるらしい。やってみてない

# References

+ [Executor(SimpleAsyncTaskExecutor, ThreadPoolTaskExecutor)](http://fomsan.sakura.ne.jp/memo/java/javaSpring.html)
+ [Spring Boot で @Async の処理が待ってから落ちるようにする](http://qiita.com/thrakt/items/c8f33a57636e5dcf9d48)
+ [Java並行・並列・非同期処理チートシート](http://qiita.com/yohhoy/items/bc119324d2b69570597b)
