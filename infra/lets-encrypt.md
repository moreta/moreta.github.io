

# certbotでinstall

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
