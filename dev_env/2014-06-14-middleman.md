---
title: html template with middleman
date: 2014-06-14
tags: middleman
---



# bootstrap

<https://github.com/bootstrap-ruby/middleman-bootstrap-navbar>

```
gem 'bootstrap-sass', :require => false
gem 'middleman-bootstrap-navbar'
```


# server

```
middleman server
```

# build

HTMLファイルとして生成


```
middleman build
```


# deploy

`gem 'middleman-deploy'`


# build後 -> deploy
```
$ middleman build [--clean]
$ middleman deploy [--build-before]
```


## s3 deploy

<http://nmbr8.com/blog/2014/03/26/middleman_foundation_s3-9/>

* S3のバケット作成


1. ドメイン名で生成
2. Static Website HostingでEnable webside hostingをチェック
3. `index.html`,`error.html`を入れて保存

* Static Website Hostingを有効化 -

1. Granting Read-Only Permission to an Anonymous Userをcopy & paste

<https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html>

ドメイン部分は修正

```
{
  "Version":"2012-10-17",
  "Statement":[{
	"Sid":"AddPerm",
        "Effect":"Allow",
	  "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::examplebucket/*"
      ]
    }
  ]
}
```




* バケットポリシーを追加
* サブドメイン⇒ネイキッドドメインへのリクエスト転送設定
* Route53の設定(AレコードおよびCNAMEレコード登録)
* ドメインのDNSサーバをRoute53のDNSサーバに変更
* middlemanのビルドファイルをS3にデプロイ

```
middleman build
middleman s3_sync
```

## ftp deploy

```
activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = 'ftp.yourserver.host'
  deploy.path     = '/'
  deploy.user     = 'username'
  deploy.password = 'password'

  # middleman deployで自動 build
  deploy.build_before = true # default: false
end
```


## 使える変数まとめ

<http://kotatu.org/blog/2013/09/01/variables-available-in-middleman-templates/>


# Rubymine setting

<http://blog.inkceptional.com/running-middleman-from-rubymine/>

Edit configuration > + Gem Command

*In Configuration tab*

+ Gem name : middleman
+ Executable name : middleman
+ Argument : s or deploy

*Bundler tab*

Check bundle exec checkbox


# Table of contents

<https://forum.middlemanapp.com/t/generate-inpage-navigation-nice-api-documentation/1002/2>
