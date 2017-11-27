AWS Cloudfront
===============

# CloudFrontを Reverse Proxyのように使う

<http://dev.classmethod.jp/cloud/aws/wordpress_with_cloudfront_front-ended/>


# カジュアルにCloudFrontを使って動的コンテンツと静的コンテンツを振り分け

[カジュアルにCloudFrontを使って動的コンテンツと静的コンテンツを振り分け](http://qiita.com/takachan/items/2f56f1b18145af634d9d)


# CloudFrontでマルチオリジンとCache Behavior設定してみた

[CloudFrontでマルチオリジンとCache Behavior設定してみた](http://dev.classmethod.jp/cloud/aws/cloudfront-multioriginbehavior/)

# precedence & path pattern

# ログの管理

<http://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html>

+ エッジロケーションごとにログが貯まる
  + 複数のディストリビューションのログファイルを同じバケットに保存することはできる
+ 同じバケットをログファイルに使用しないことをお勧め
  + 別々のバケットを使用する方が、メンテナンスが容易になります

# References

+ [CloudFront as Reverse Proxy](<http://dev.classmethod.jp/cloud/aws/wordpress_with_cloudfront_front-ended/)
+ [カジュアルにCloudFrontを使って動的コンテンツと静的コンテンツを振り分け](http://qiita.com/takachan/items/2f56f1b18145af634d9d)
+ [CloudFrontのキャッシュ時間(TTL)はどの程度なのか](http://dev.classmethod.jp/cloud/aws/cloudfront-ttl/)
+ [アクセスログ](http://docs.aws.amazon.com/ja_jp/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html)