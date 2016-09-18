---
title: Google Cloud Platform Deploy
date: 2015-12-08
tags: GCP, google, cloud, nodejs
---


Google Cloud Platform Deploy
=============================

# Before you begin

+ Create a project in the Google Cloud Platform Console.
+ Enable billing for your project.
+ Install the Google Cloud SDK.

をしておくこと

# Download and run the app

local 環境へsourceをdownloadし、起動

```
git clone https://github.com/GoogleCloudPlatform/nodejs-getting-started.git
cd nodejs-getting-started/1-hello-world
npm install
npm start
http://localhost:8080
```

# Deploy the app to Google Cloud Platform

```
gcloud preview app deploy app.yaml --promote
```

これでdeployされる

open <https://your-app-id.appspot.com>

## command説明

# Deploy MongoDB with Node.js

<https://cloud.google.com/nodejs/getting-started/deploy-mongodb>

1. Cloud LauncherからMongoDBをdeployする
2. 生成されたらfirewall設定をする

以下の設定はproductionでは利用しないこと
```
gcloud compute firewall-rules create default-allow-mongo \
    --allow tcp:27017 \
    --source-ranges 0.0.0.0/0 \
    --target-tags mongodb \
    --description "Allow mongodb access to all IPs"
```

# Create a Cloud Storage bucket for your project

```
gsutil mb gs://<your-project-id>
gsutil defacl set public-read gs://<your-project-id>
```

# Cleaning Up

+ <https://cloud.google.com/nodejs/getting-started/delete-tutorial-resources>

## Deleting app versions

+ App EngineのVersions Pageで **Default** version以外を削除できる
+ Default versionはCloud Platform Consoleから削除

## Deleting Cloud SQL instances

+ Cloud Platform Consoleから

## Deleting Cloud Storage buckets

+ Cloud Platform Consoleから

## Deleting Compute Engine resources


# その他

## gcloud preview

preview version CLI

<https://cloud.google.com/sdk/gcloud/reference/preview/>

## f1-micro で動かしたい。

[Google Managed VMs で nginx を建ててみた](http://yano.hatenadiary.jp/entry/2015/06/04/125122)

g1-small ですら破産する、と言う方は app.yaml に以下の設定を追加することで f1-micro で動かすことができます。先日価格改定があり 30% 値下げされた結果、月 500 円で動かすことが可能です。

最初

```
resources:
  cpu: 0.5
  memory_gb: 0.6
  disk_size_gb: 10
```
    
と f1-micro になりそうな設定でデプロイしたところ g1-small になってしまいました。なので、cpu, memory_gb の両方を 0.1 にして試してみたところ、f1-micro になりました。
ちなみに、disk_size_gb は 10 以上を指定しなければなりません。これ以下を指定してしまうとデプロイ時にエラーになります。

変更
```
resources:
  cpu: 0.1
  memory_gb: 0.1
  disk_size_gb: 10
```  


以上です。App Engine に nginx を建てたい人は是非参考にしてください。




# References

[Node.js Starter Project | Deploy Hello world](https://cloud.google.com/nodejs/getting-started/hello-world)
