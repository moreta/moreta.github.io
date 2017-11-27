

# domain redirectしたい

http://xxx.com -> http://yyy.com 
に伝送したい

# 1. s3のdomain名と同じbucketを作成とstatic website hosting設定

1. S3 に xxx.com という名前のバケットを作成
2. Properties から Static Website Hosting
3. Redirect all requests to another host name をクリック
4. Redirect all requests to に　yyy.com & saveする
5. Endpoint: yyy.com.s3????.amazonaws.com をメモ

# 2. Route 53で CNAMEを設定

1. Create Hosted Zone で my.domain を設定 (DNSの設定などは他ページ参照)
2. my.domain への CNAME 設定を上の5に設定
  * もしくは以下のように IPv4で aliasを選択して、s3を選択する

以下設定の内容

Create a resource record for example.com with the following values:

* Record Type: Choose A IPv4 address.
* Alias: Choose Yes.
* Alias Target: Select the blank value field, expand the drop-down menu, and then choose your S3 bucket under the heading S3 Website Endpoints.
* Routing Policy: Choose Simple.
* Evaluate Health Target: Choose No and then choose Create.
  * Note: The drop-down menu might take a few moments to populate your bucket name.


# References

+ [Is there a way to redirect a domain to another domain using Amazon Route 53?](https://aws.amazon.com/jp/premiumsupport/knowledge-center/redirect-domain-route-53/)
+ [Route53 + S3 を使った任意の URL へのリダイレクト](https://qiita.com/mzmttks/items/6ec434a9fde1ac37d84a)