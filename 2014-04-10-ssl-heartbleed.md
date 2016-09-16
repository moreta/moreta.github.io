---
title: "heartbleed : openssl security bug"
date: 2014-04-10
tags: openssl, https, 証明証, heartbleed
---

# heartbleed bug

<http://heartbleed.com/>

# セキュリティに問題があるかを確認するサイト

[Heartbleed test](https://filippo.io/Heartbleed/)

# AWSでの報告ページ

[AWSからOpenSSLの脆弱性について AWS のサービスアップデート](http://aws.amazon.com/jp/security/security-bulletins/aws-services-updated-to-address-openssl-vulnerability/)

yum update openssl to update your system and restart all services that are using openssl

```
yum update openssl

=========================================================================================================================================================================================
 Package                                     Arch                                  Version                                             Repository                                   Size
=========================================================================================================================================================================================
Updating:
 audit                                       x86_64                                2.3.2-3.19.amzn1                                    amzn-main                                   258 k
 openssl                                     x86_64                                1:1.0.1e-37.66.amzn1                                amzn-updates                                1.7 M
Updating for dependencies:
 audit-libs                                  i686                                  2.3.2-3.19.amzn1                                    amzn-main                                    84 k
 audit-libs                                  x86_64                                2.3.2-3.19.amzn1                                    amzn-main                                    87 k
 glibc                                       i686                                  2.17-36.81.amzn1                                    amzn-updates                                6.0 M
 glibc                                       x86_64                                2.17-36.81.amzn1                                    amzn-updates                                5.6 M
 glibc-common                                x86_64                                2.17-36.81.amzn1                                    amzn-updates                                 28 M

Transaction Summary
=========================================================================================================================================================================================
Upgrade       7 Package(s)

```

## EC2の対応方法

[Amazon Linux AMI:](https://aws.amazon.com/jp/amazon-linux-ami/security-bulletins/ALAS-2014-320/)

## GMOの証明証再発行手順

[再発行のお手続き](https://jp.globalsign.com/support/proceeding/42.html)

## openssl

### version確認

`openssl version`

必要によってopensslをupgrade

`yum update openssl`

### nginx用再発行

<https://jp.globalsign.com/support/csr/532.html?service=ssl>

`openssl genrsa -des3 -out ./ssl.globalsign.com.key 2048`

# その他

* <http://d.hatena.ne.jp/nekoruri/20140408/heartbleed>

# mac 

