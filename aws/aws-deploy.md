---
title: Deploy with AWS
date: 2014-06-07
tags: aws, ec2, deploy
---

# ベースインスタンスの作成

+ ステージング環境として利用する
+ ミドルウェアアップデートに利用する
+ ベースインスタンスはReboot時に動作可能な状態とする
+ 固定Private IPを避ける
+ Public IPは動的に割り当てる
+ ログをCloudWatch logsで回収する

## deploy

+ ツールはrsyncやcapistranoなどなんでもいい
  + サーバ数が多く変わることが多いならprivateを取得して、deployする。


タグに「Role=Web」「Environment=Production」が設定されているEC2インスタンスのPrivate IPを取得し処理を実行するシェルスクリプトです。

```
ipAddresses=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Role,Values=web"  "Name=tag:Environment,Values=Production" | jq -r '.Reservations[].Instances[].PrivateIpAddress')

for ip in $ipAddresses; do
  if [ $ip != "null" ]; then
    echo "$ip"
  fi
done
```

# wercker ciを利用してdeloy

[Deploying to Amazon EC2 Container Service with Wercker](http://blog.wercker.com/2015/10/02/Deploying-to-ECS-with-Wercker.html)


# rails capistranoでdeploy

上記のリンクのcapistranoのgemで`capistrano-ext`は`capistrano`にmergeされているのでいらない


# Auto scalingでのdeploy

+ [オートスケール時のデプロイを User Data と Capistrano を使って行う（BootStrap パターン）](http://dev.classmethod.jp/cloud/auto-scaling-deploy-userdata-capistrano/)
+ [Capistrano 3とaws-sdk 2でELB配下にあるインスタンスへデプロイする奴](http://qiita.com/anoworl/items/52dfc2d286110fd10a19)
+ [AWSでデプロイとスケーリングを自動化する方法まとめ](http://qiita.com/hiro_koba/items/eb438945d64c3d765e04)

方法としては以下の方法がある

+ EC2 + User Data
+ Elastic Beanstalk
+ OpsWorks
+ CodeDeploy

User Dataにshell scriptを入れてinstanceを生成し、起動するとき(最初の1回)に実行される

User Dataで渡されたスクリプトが実行されることによって、新しく起動してくるEC2は`cap deploy:setup`まで終わった状態で、
最新のコードが配置された状態でnginxなどのserverが起動するようにUser Dataスクリプトを作成する


*User data入力部分*

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-07/aws-user-data.png)


### Auto scalingではデプロイ対象サーバがダイナミックに変わっていく

`capistrano-ec2group`や`capistrano-autoscaling`などのプラグインを使ってデプロイ対象のサーバを動的に管理


#### capistrano-ec2group

#### capistrano-autoscaling

# References

+ [EC2複数台構成時の構築とデプロイ](http://dev.classmethod.jp/cloud/aws/deployment-to-ec2-instances/)
+ [AWSでのdeploy best practice](http://www.slideshare.net/AmazonWebServicesJapan/20130506-23096544)
