Lets's ssl
================

## zero sslを利用する方法
+ [Let’s EncryptとZeroSSLで、もっと簡単にSSL証明書を用意する](http://dev.classmethod.jp/cloud/zerossl-june-2016/)
  + [zero ssl](https://zerossl.com/)
  + online toolを利用すると便利だが有効期限が90日
    + 直接設置しないといけない
    + 90日で有効期限が切れるが自動更新されない
  
  
  
## certbotを利用する方法


```bash
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto

./certbot-auto certonly \         # 証明書の作成
  --webroot \                   # 既存のウェブサーバを使うモードを選択
  -w /usr/share/nginx/html \    # ドキュメント・ルートのパス
  -d your.domain.com \            # 認証するドメイン名
   --email <メール>@<アドレス>     # メールアドレス登録（証明書期限切れの通知用）
```



# References

+ [let's encrypt](https://letsencrypt.org/getting-started/)
+ [cert bot](https://certbot.eff.org/#centos6-nginx)
+ [zero ssl](https://zerossl.com/)
+ [Let’s EncryptとZeroSSLで、もっと簡単にSSL証明書を用意する](http://dev.classmethod.jp/cloud/zerossl-june-2016/)
