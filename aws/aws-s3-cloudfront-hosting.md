AWS Hosting by S3 & CloudFont
============================



# S3をcloudfontをoriginに指定するときの注意点

## orgin設定

+ 入力formからsuggestされるs3を選択したらだめ。！！！！！！！！！！！！！！１１
+ 必ず以下の部分のurlを入れること

静的ウェブサイトホスティングの

```
エンドポイント :xxxxxxxxxxxxxxx-ap-northeast-1.amazonaws.com << この部分
```
この部分のURLを設定することs

## 許可するUserAgentはCloudFontからだけにする

* これはoption、確認が不便になることがあるので、
* セキュリティ的にはおすすめ

## javascript routerを使う場合

[Deploying create-react-app to S3 and CloudFront](https://medium.com/@omgwtfmarc/deploying-create-react-app-to-s3-or-cloudfront-48dae4ce0af#.pz0h5qeap)

s3には当該するobjectがなく、403エラーか、404エラーが発生する

s3ではエラーdocumentをindex.htmlにする
![s3](https://dl.dropboxusercontent.com/u/21522805/blog/aws/s3_for_js_router.png)


cloudfrontを利用する場合には Error Pagesから Create Custom Erorr Responseを設定する
![cloudfont](https://dl.dropboxusercontent.com/u/21522805/blog/aws/cloudfront_for_js_router.png)




# IAM設定

CIなのでuploadするために必要な権限

+ GetBucketLocation
+ ListBucket
+ PutObjedt

# References

+ [Amazon S3 + CloudFront で始める静的サイトホスティング](https://kuune.org/text/2016/05/12/static-website-hosting-using-aws-s3-and-cloudfront/)
