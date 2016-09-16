---
title: linux chkconfig
data: 2014-11-24
tags: linux
---

# chkconfig ユーティリティ

選択したサービスをどのランレベルで起動するかを指定できるツール

# サービス一覧

システムサービス (/etc/rc.d/init.d/ ディレクトリからのサービスおよび xinetd により制御されているサービス

`chkconfig --list [service_name]`

service_nameは省略可能

xinetdで管理されてないサービスは以下のように表示される

```
> chkconfig --list rsync
rsync           off
```


## run level

```
nginx          	0:off	1:off	2:on	3:on	4:on	5:on	6:off
```
前にある数字がrun level

## サービスの有効化

`chkconfig service_name on`

run level 2,3,4,5でサービスが有効化される


特定レベルだけ有効にする場合には以下のように設定

`chkconfig service_name on --level runlevels`
`chkconfig abrtd on --level 35 # sample`


# 参考

* <https://access.redhat.com/documentation/ja-JP/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/s2-services-chkconfig.html>