---
title: GCP deploy rails
date: 2016/07/13
tags: GCP, google, rails
---


# deploy with compute engine

## startup-script

+ 起動時に毎回実行される

# deploy with app engine

作成したプロジェクトで以下を実行しapp.yamlを作る

```
# app.yamlを作成
gcloud init
```

app.yamlは

```
api_version: 1
entrypoint: bundle exec rackup -p 8080 -E production config.ru
runtime: ruby
vm: true
```

deployしてみる

```
gcloud preview app deploy

You are about to deploy the following services:
 - projectid/default/20160xxxxxxxxxxx7 (from [/xxxx/your-app/app.yaml])
     Deployed URL: [https://projectid.appspot.com]
```

このままデプロイすると、デプロイは出来るが
なんか”product環境なのにSECRET_KEYがありません”みたいなのが出るので記述してあげる

まずはSECRET_KEYの作成コマンドとして下記を実行
