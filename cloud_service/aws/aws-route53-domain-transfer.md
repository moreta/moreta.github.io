AWS Route53へ既存ドメインを移管
===================================

# ステップ 1: Amazon Route 53 で最上位ドメインがサポートされていることを確認する

# ステップ 2: DNS サービスを Amazon Route 53 または別の DNS サービスプロバイダーに移管する

[ステップ 2: DNS サービスを Amazon Route 53 または別の DNS サービスプロバイダーに移管する](http://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html#domain-transfer-to-route-53-transfer-dns)


DNS を最初に移管する理由

* 一部レジストラーは無料でDNSを提供してるが、
* 登録を移管すると、以前のレジストラはドメイン登録を更新せず、Amazon Route 53 からドメインの移管リクエストを受領すると**すぐにドメインのDNS サービスを無効にする可能性があります**

なので、以下「既存ドメインの DNS サービスを Amazon Route 53 に移行する」を先にする。(下にリンクがある)

私のが場合name serverを最初から route53でしたので、必要はなかった。

# ステップ 3: 現在のレジストラで設定を変更する

# References

+ [ドメイン登録の Amazon Route 53 への移管](http://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html)
+ [既存ドメインの DNS サービスを Amazon Route 53 に移行する](http://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/MigratingDNS.html)


