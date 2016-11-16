

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

# References

[DB インスタンスを変更し、パラメータをすぐに適用](htps://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
