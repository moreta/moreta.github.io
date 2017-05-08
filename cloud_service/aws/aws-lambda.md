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

# node.js 4.3 support

[祝 LambdaのNode v4対応記念 -AWS SDK for Node.jsの処理をPromiseを使って書いてみた](http://qiita.com/toshihirock/items/4e4231c04332c209e31d)

# その他

## functionのrename

* renameはできない、別のfunctionを作る必要がある

# References

+ [AWS Lambdaを使うときに注意する３つ](http://qiita.com/imafuku/items/55844535dcc8e3861bd0)
+ <https://aws.amazon.com/jp/lambda/faqs/>
+ <http://docs.aws.amazon.com/lambda/latest/dg/intro-core-components.html#intro-core-components-event-sources>
+ [AWS LambdaでNode.js 4.3.2が利用可能になりました](http://aws.typepad.com/sajp/2016/04/node-js-4-3-2-runtime-now-available-on-lambda.html)
+ [祝 LambdaのNode v4対応記念 -AWS SDK for Node.jsの処理をPromiseを使って書いてみた](http://qiita.com/toshihirock/items/4e4231c04332c209e31d)
+ [AWS Lambdaのための関数のローカル開発とテスト](http://qiita.com/imaifactory/items/092e32b4fc0f69a94061)
