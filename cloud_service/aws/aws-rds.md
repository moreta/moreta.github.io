

# DB インスタンスを変更

+ 変更をしてもすぐ反映されるわけではない。
+ 変更をすぐ反映したい場合には ApplyImmediatelyをtrueにする
+ 変更した時の影響は下記のリンクから確認する
  + [DB インスタンスを変更し、パラメータをすぐに適用](htps://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)

# restoreするときに注意点!!

+ セキュリティグループがdefaultになってします。
  + When you restore a DB instance, only the default DB parameter and security groups are associated with the restored instance. As soon as the restore is complete, you should associate any custom DB parameter or security groups used by the instance you restored from
    + [Restoring From a DB Snapshot](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RestoreFromSnapshot.html)
    + [RDSの4つのグループと復元時の注意点](http://www.simpline.co.jp/tech/?p=1014)

# 一時的にはMulti-AZを利用して

<http://blog.serverworks.co.jp/tech/2014/10/08/tgi-multi-az-pattern/>

# aurora

<https://www.nimbo.com/blog/aws-aurora-tco-performance-migration/>

# RDSを sshトンネルで接続

<https://cloudpack.media/9675>


# maintenceについて
- EC2のように通知がない
  - lambdaでaws apiを利用して、通知を感知し、slackやmailの通知を設定する必要がある
  - からメンテナンススケージュールがわかる


## DescribePendingMaintenanceActions

+ これを使うことでメンテナンス情報を確認
+ [DescribePendingMaintenanceActions](http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribePendingMaintenanceActions.html)
    aws rds describe-pending-maintenance-actions


## メンテナンスの種類

- Available(利用可能) 
- Required(必須) 

の2つがあります。

**Required(必須)**

- 所定の日時以降のメンテナンスウィンドウで、自動的にメンテナンスが実施される
- **必ずしも次回のメンテナンスウィンドウ時にメンテナンスが実施されるわけではない**
  - 予定日時については？

**Available(利用可能)**

- 特に操作をしなければ、次回以降のメンテナンスウィンドウではメンテナンスは実施されない
- 無期限に延期が可能
# Amazon RDS のメンテナンス時間
- ほとんどは**30分**が終わるが、documentによると30分以上かかることもある
- 実際にテストしてみると1,2分で終わる
- メンテナンス時間は調整はできる
  - 【注意】調整できないmaintenanceもあるのに


| **リージョン**              | **時間ブロック**    |
|------------------------|-----------------|
| アジアパシフィック (東京) リージョン | 13:00–21:00 UTC |
| アジアパシフィック (ソウル) リージョン  | 13:00–21:00 UTC |

東京と서울は同じ時間だけ。


## メンテナンスを安全に行うための結論 - MulitA-Zの利用

- multi a-zをしておくのが一番いい
- [**高可用性 (マルチ AZ)**](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html) [](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html)
- multi a-zをしてもfail overによるdowntimeは発生する ↓


> Q1：無停止でOSアップグレードする方法ないですか？
> Q2：マルチAZでは無停止でアップグレードが進行しますか？

> A：Multi-AZの場合でも必ずフェイルオーバが1度発生し、フェイルオーバ期間中の 60 - 120 秒程度のダウンタイムが発生致します。
> まずはセカンダリのほうで適用され(セカンダリ適用中はRDSの動作に影響はございません。)、その後マスター側をメンテナンスするために1度フェイルオーバーを実施して、メンテナンス済みのセカンダリを新マスターとして利用し、旧マスター側をメンテナンスする流れとなります。
> マスター側メンテナンスのために1度は必ずフェイルオーバを実施する必要がございます。
> その為、アクセスの少ない時間帯にメンテナンスを入れて、アップグレードして頂く事になります。

# References
- [DB インスタンスを変更し、パラメータをすぐに適用](htps://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
- [Amazon RDSのメンテナンスについて調べてみた](http://blog.jicoman.info/2017/01/rds_maintenance/)
- [RDSのOSアップグレードのメンテナンス通知について](http://qiita.com/shojimotio/items/4a11a38f755974e9ad85)
- [Amazon RDS のメンテナンス](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html)
- [**高可用性 (マルチ AZ)**](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html) [](http://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html)
- [Amazon RDS のメンテナンスにどう立ち向かうべきか](https://blog.manabusakai.com/2016/01/rds-maintenance/)

