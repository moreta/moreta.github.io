---
title: AWS Lambda
date: 2016-06-12
tags: aws, lambda
---

# ３つの注意点

+ javaは遅い?
  + [lambda言語ことの速度測定](http://acro-engineer.hatenablog.com/entry/2016/08/02/120000)
  + node.jsをおすすめ
+ メモリに注意
  + 1.5GBの制限
  + 処理timeoutを指定すること

# lambdaからVPNへの接続

[LambdaファンクションからのVPC内リソースへのアクセス](http://aws.typepad.com/aws_japan/2016/02/access-resources-in-a-vpc-from-your-lambda-functions.html)

# 活用例

+ 大きなオブジェクトをS3にアップロード
  + それがトリガーとなりLambdaで画像を圧縮、そしてその圧縮済みオブジェクトがS3に保存
+ モバイルアプリやIoTのためのスケーラブルなバックエンド構築
  + モバイルアプリであればAWS SDK Mobile SDKとAmazon Cognito
  + IoTデバイスであればAWS IoT
  + Lambdaのモバイルバックエンドのブループリント、そしてデータストレージはAmazon DynamoDBを利用
+ *サーバーレスマイクロサービス*
  + AWS CloudFormation
  + [Serverless](https://serverless.com/)
  + Flourish

# References

+ [AWS Lambdaを使うときに注意する３つ](http://qiita.com/imafuku/items/55844535dcc8e3861bd0)
+ <https://aws.amazon.com/jp/lambda/faqs/>
+ <http://docs.aws.amazon.com/lambda/latest/dg/intro-core-components.html#intro-core-components-event-sources>
