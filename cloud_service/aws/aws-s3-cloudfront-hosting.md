AWS Hosting by S3 & CloudFont
============================



# S3をcloudfontをoriginに指定するときの注意点

## (注意する必要なし) orgin設定

~~+ 入力formからsuggestされるs3を選択したらだめ。！！！！！！！！！！！！！！１１~~
~~+ 必ず以下の部分のurlを入れること~~

~~静的ウェブサイトホスティングの~~

```
エンドポイント :xxxxxxxxxxxxxxx-ap-northeast-1.amazonaws.com << この部分
```

~~この部分のURLを設定することs~~


最初は
<https://kuune.org/text/2016/05/12/static-website-hosting-using-aws-s3-and-cloudfront/>
をみて、上のようにサジェストされる S3 Originを選択せずに、直接入力したが、
cloudfrontのbehavior登録のときにサジェストされるs3を選択すると

「Restrict Bucket Access」の選択optionが表示される
ここを yesにし、
「Grant Read Permissions on Bucket」で Yes, Update Bucket Policyを選択すると
cloudfrontが当該s3 bucketに policyを自動に追加してくれるので、

サジェストされるs3を選択してもいいし、逆に選択すべきであると思う。


## 許可するUserAgentはCloudFontからだけにする

* これはoption、確認が不便になることがあるので、
* セキュリティ的にはおすすめ

## javascript routerを使う場合 !!!!!!!!

* Vue Routerなど利用するとき
* SPAは index.htmlしかないので、urlで指定してアクセスすると403になってします。
* それを回避し、javascriptをrouteを使うためにcloudfrontの設定が必要

[Deploying create-react-app to S3 and CloudFront](https://medium.com/@omgwtfmarc/deploying-create-react-app-to-s3-or-cloudfront-48dae4ce0af#.pz0h5qeap)

s3には当該するobjectがなく、403エラーか、404エラーが発生する

s3ではエラーdocumentをindex.htmlにする
![s3](https://www.dropbox.com/s/n52eoh1gv2s12wk/s3_for_js_router.png?dl=0)


cloudfrontを利用する場合には Error Pagesから Create Custom Erorr Responseを設定する
![cloudfont](https://dl.dropboxusercontent.com/u/21522805/blog/aws/cloudfront_for_js_router.png)


# restrict bucket accessをyesにすること??

<https://dev.classmethod.jp/cloud/aws/cloudfront-s3-origin-access-identity/>

## 実際に既存のものを修正でやってみたけどエラーで変更できなかった

com.amazonaws.services.cloudfront.model.InvalidHeadersForS3OriginException: Your request contains forwarded Header Name * that is not allowed by S3. (Service: AmazonCloudFront; Status Code: 400; Error Code: InvalidHeadersForS3Origin; Request ID: exxxxx)

<https://forums.aws.amazon.com/thread.jspa?threadID=181392>のスレー

```
Hi,

It's not the friendliest error message ever, but it is true, alas. You can forward only three headers to an Amazon S3 origin: Access-Control-Request-Headers, Access-Control-Request-Method, and Origin. This is explained in the Amazon CloudFront Developer Guide in the topic "Selecting the Headers on Which You Want CloudFront to Base Caching":

http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html#header-caching-web-selecting
```

```
Here's some additional detail about how this works and why:

The Forward Headers option in the CloudFront console controls only the headers that CloudFront uses for caching. Regardless of the value that you specify for this setting, CloudFront forwards most of the headers in a request to Amazon S3. For a list of exceptions, see "HTTP Request Headers that CloudFront Removes or Updates" in the Amazon CloudFront Developer Guide:

http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/RequestAndResponseBehaviorS3Origin.html#request-s3-removed-headers

When the origin for a cache behavior is an Amazon S3 bucket, you can't set the value of Forward Headers to "All" for the cache behavior because CloudFront would forward every request to your S3 bucket and would not cache any of your objects. Valid values are none or a whitelist of up to three headers. (Forwarding custom headers to S3 is not supported.) For more information, see "Selecting the Headers on Which You Want CloudFront to Base Caching":

http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/header-caching.html#header-caching-web-selecting. 

When the origin for a cache behavior is a custom origin, you can set the value of Forward Headers to "All." Note, however, that in this configuration CloudFront doesn't cache your objects and will forward every request to the origin.
```

ふむ　Query String Forwarding and Cachingの設定で
Forward all, cached based on allになっていたからかな


# IAM設定

CIなのでuploadするために必要な権限

+ GetBucketLocation
+ ListBucket
+ PutObjedt

# References

+ [Amazon S3 + CloudFront で始める静的サイトホスティング](https://kuune.org/text/2016/05/12/static-website-hosting-using-aws-s3-and-cloudfront/)
+ [SPAを S3+CloudFront で表示する方法](http://christina04.hatenablog.com/entry/2017/05/25/190000)
+ [AWS LambdaでSSRやってみた Vue.](https://mya-ake.com/slides/vuejs-ssr-on-lambda#0)
