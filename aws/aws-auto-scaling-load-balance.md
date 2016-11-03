---
title: AWS Auto scaling & ELB
date: 2014-05-15
tags: aws, auto-scaling, elb, deploy, emi
---

# auth scaling

をするためには AWS - Cloud Design Patternの

* [Clone Server Pattern](http://aws.clouddesignpattern.org/index.php/CDP:Clone_Server%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3)
* [Scale Out Pattern](http://aws.clouddesignpattern.org/index.php/CDP:Scale_Out%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3)

を見ておこう
 

# 実装

ロードバランサーサービースのELBとマシンイメージAMIを利用する。

サーバの負荷が重くなればクローン用AMIからECインスタンスを起動する。

AWSの ELB + CloudWatch + Auto Scalingの３つのサーバを組み合わせることで、負荷に応じて自動でスケールアウトするシステムを構築する。

## 手順

1. ELBを立ち上げて、EC2をその配下に置く
2. 現在稼働しているEC2からクローン用AMIを作成しておく。
3. EC2数を増減させるトリガーとなる条件（メトリクス）を定義する。(EC2の平均CPU使用率、ネットワークの流量、セッション数、EBSのレイテンシーなど)
4. 上記のメトリクスをCloudWatchを使って監視し、一定の条件を満たすとアラームを出す。
5. アラームを受けた際、Auto ScalingがEC
3. クローン用EC2は必要に応じてマスターEC2とファイルの同期を行う
rsyncとかcapistranoを利用


## 注意点

マスターEC２がSPOFになっていしまう。

[SPOF(Single Point Of Failure)](http://www.sophia-it.com/content/SPOF)

システム上のあるコンポーネントが異常を来たすと、そのシステム全体が障害に陥ってしまうようなコンポーネントの総称である。



# ELB

<http://aws.amazon.com/jp/elasticloadbalancing/>

## 注意

### AZと ELB

*毎のEC2インスタンスは同じにする！* <http://tech.basicinc.jp/AWS/2013/07/21/aws_elb_point/>

*HTTPS→HTTPでの場合、アプリケーションでSSL判定するにはX-Forwarded-Proto*

*ELBのCross-Zone Load Balancingを*使うと上記の問題が解決する <http://okochang.hatenablog.jp/entry/2013/11/09/233732>

## Create an internal load balancer :
 
 <http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/UserScenariosForVPC.html>
[Create a Basic Internal Load Balancer in Amazon VPC](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/USVPC_creating_basic_lb.html)

ELBを privateか publicか選択して作ることができる。

外部(internet)にELBをだすなら publicで vpc内で外部に出さないのであればprivate(interal)にする


## NginxとInternalELBとのDNS名前解決方法

* <http://blog.suz-lab.com/2012/12/elbhosthaproxy.html>
こんな感じかな？

* <http://kkurahar.github.io/blog/2013/07/18/elb-nginx-499/>
* <http://infra.hatenablog.com/entry/2014/01/29/140528>
