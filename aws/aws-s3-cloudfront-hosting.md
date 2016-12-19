AWS Hosting by S3 & CloudFont
============================



# S3をcloudfontをoriginに指定するときの注意点

+ 入力formからsuggestされるs3を選択したらだめ。！！！！！！！！！！！！！！１１
+ 必ず以下の部分のurlを入れること

静的ウェブサイトホスティングの

```
エンドポイント :xxxxxxxxxxxxxxx-ap-northeast-1.amazonaws.com << この部分
```

# 許可するUserAgentはCloudFontからだけにする

# IAM設定

CIなのでuploadするために必要な権限

+ GetBucketLocation
+ ListBucket
+ PutObjedt

# References

+ [Amazon S3 + CloudFront で始める静的サイトホスティング](https://kuune.org/text/2016/05/12/static-website-hosting-using-aws-s3-and-cloudfront/)
