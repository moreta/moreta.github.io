
# gems

+ [octopus]()
  + もう使わないほうがいいか
+ [switch_point](https://github.com/eagletmt/switch_point)
  + shardingよりは read/write spliting
+ [makara](https://github.com/taskrabbit/makara)
  + [for background job - distribute_read by instacart](https://github.com/ankane/distribute_reads)

# bestは？

基本は**switch_point**を使う

swithc pointは 1master 1slave。じゃ **multiple slaveの場合**はどうする？

mutiple slaveは DB Proxyを利用する。(HAProxyとか？)
なので、applicationでは slaveが何台あるか気にしないように構成するのがベストかと思う

もし、DB Proxy serverを使えない場合

**makara**を使う

# bestは？2 - AWSを利用するならNLB(Network Load Balancer)を使おう !!!!!!!!??

2017/9月の熱々サービス

+ [新しいNetwork Load Balancer – 秒間数百万リクエストに簡単にスケーリング](https://aws.amazon.com/jp/blogs/news/new-network-load-balancer-effortless-scaling-to-millions-of-requests-per-second/)
+ [NLBでプライベートなEC2やRDSの負荷分散が可能に！](https://dev.classmethod.jp/cloud/aws/load-balancing-private-ec2-rds-nlb/)

RDSの場合、フェイルオーバーした際にIPが変わる可能性があるので、そこをどう自動化（ターゲットグループに反映）していくかは考えなければならないと思われる >> のコメントがあった
もし、NLBでIP指定でなく、endpointができるのであれば問題ないけど、多分できるんじゃない？ >> できなさそう

# 負荷が高いシステムの場合 warmingが必要な場合がある

+ <https://www.postgresql.org/docs/9.6/static/pgprewarm.html>
+ <https://labs.contactually.com/adding-read-replicas-in-a-production-ruby-on-rails-system-with-zero-downtime-using-makara-be1d004654b0>


# References

+ [Rails で複数 DB の migration をする方法の調査と考察](https://qiita.com/dany1468/items/93a36356df695d537a8a)

## makara

+ [Makara — a read-write splitting adapter for Active Record](https://blog.evantahler.com/makara-a-read-write-splitting-adapter-for-active-record-5142df310e44)
+ [Adding Read Replicas in a Production Ruby on Rails App with Zero Downtime](https://labs.contactually.com/adding-read-replicas-in-a-production-ruby-on-rails-system-with-zero-downtime-using-makara-be1d004654b0)
  + <https://github.com/ankane/shorts/blob/master/Scaling-Reads.md>

## octopus

+ [Using Database Replicas In Rails With Octopus Gem](https://freeletics.engineering/2017/03/06/database-replicas.html)

## DB schema tool

gemを使うことによって　schemaの管理を別にしたい場合使う

+ [Ridgepole is a tool to manage DB schema](https://github.com/winebarrel/ridgepole)

## 複数DBのmigration

+ [複数databaseのmigration](https://qiita.com/y1row/items/b05cc0d78dd6b671e16b)