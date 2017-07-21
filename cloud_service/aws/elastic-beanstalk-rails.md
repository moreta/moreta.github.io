
# Deploy

## デプロイメントポリシー

* All at once
* Rolling
* Rolling with additional batch
* Immutable

### Rolling

+ AWS Elastic Beanstalk は環境を複数のバッチに分割し、アプリケーションの新しいバージョンを一度に 1 つのバッチにデプロイする + ローリングデプロイ中は、アプリケーションの古いバージョンでリクエストを処理するインスタンスもあり、新しいバージョンでリクエストを処理するインスタンスも存在します

# Immutable

+ 変更不可能な更新を実行して、古いバージョンを起動しているインスタンスと並行して、別の Auto Scaling グループにあるアプリケーションの新しいバージョンを起動している新しいインスタンスのフルセットを起動します。+ [Immutable] デプロイは、部分的に完了したローリングデプロイにより発生する問題を防止できます。
+ 新しいインスタンスがヘルスチェックをパスしなかった場合、Elastic Beanstalkはそれを終了し、元のインスタンスをそのまま残します



# References

+ [Ruby on Railsの環境構築をElastic Beanstalkで行う](http://qiita.com/yuyasat/items/4d93b4ad4f86a6e13d50)