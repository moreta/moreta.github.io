---
title: Deploy with AWS
date: 2014-06-07
tags: aws, ec2, deploy
---



## AWSでのdeploy best practice

<http://www.slideshare.net/AmazonWebServicesJapan/20130506-23096544>




## capistrano

上記のリンクのcapistranoのgemで`capistrano-ext`は`capistrano`にmergeされているのでいらない


### Auto scalingでのdeploy 

User Dataにshell scriptを入れてinstanceを生成し、起動するとき(最初の1回)に実行される

User Dataで渡されたスクリプトが実行されることによって、新しく起動してくるEC2は`cap deploy:setup`まで終わった状態で、
最新のコードが配置された状態でnginxなどのserverが起動するようにUser Dataスクリプトを作成する


*User data入力部分*

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-07/aws-user-data.png)


### Auto scalingではデプロイ対象サーバがダイナミックに変わっていく

`capistrano-ec2group`や`capistrano-autoscaling`などのプラグインを使ってデプロイ対象のサーバを動的に管理


#### capistrano-ec2group

#### capistrano-autoscaling


