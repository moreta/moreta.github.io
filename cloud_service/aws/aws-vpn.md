AWS VPCへVPN接続
===============


# VPN接続Option

+ AWS ハードウェア VPN
+ AWS Direct Connect
+ AWS VPN CloudHub
+ ソフトウェア VPN

# VPCのセキュリティ

### ３つのfeature

+ セキュリティグループ(Security Group)
+ ネットワークアクセスコントロールリスト (ACLs - Network access control lists)
+ フローフラグ(Flow logs)

### instanceとsecurity group

+ instanceを起動するときにsecurity groupに属することになる
+ security groupを指定しないとdefault security groupが自動に割り当てられる。
+ security group以外にACLsでsecond layer of defenseをすることができる

### Comparison of Security Gruops and Network ACLs

| Security Group                                          | Network ACL                                            |
|:--------------------------------------------------------|:-------------------------------------------------------|
| Operates at the instance level (first layer of defense) | Operates at the subnet level (second layer of defense) |
| Supports allow rules only                               | Supports allow rules and deny rules                    |


# 接続イメージ

VPCにVPN Gatewayを追加して外部と接続可能にする

## 接続に使えうもの

+ OpenVPN
  + [tunnelblick - OpenVPNのclient](https://tunnelblick.net/documents.html)
+ [SoftEther](http://ja.softether.org/)
+ [setup-ipsec-vpn](https://github.com/hwdsl2/setup-ipsec-vpn)
  + [docker-ipsec-vpn-server](https://github.com/hwdsl2/docker-ipsec-vpn-server)

まだ２つの違いがなにかはわからない。

# VPNピアリング

+ AWSコンテンツの集約
  + Redshiftなどを複数のVPCからアクセスし１つに集約したいときに使用する。
+ アカウント間の通信
  + AWSアカウントが複数ある場合で通信を行いたい際に使用する。
+ VPNを使用する場合
  + AWSとVPNを使用する際には、同一IPで２つのVPNを作成できない制約があります。
  + VPCピアリングと踏み台サーバを利用することでVPN経由でSSHなどを使用することができます。
  + ※踏み台を挟まないとVPCを跨いで直接通信することはできない。

# やってみよう

ここでは　docket-ipsec-vpn-serverを利用してVPN serverを構築する

## client setting

<https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/clients.md>

#### macOS

#### iOS

## uninstall VPN

+ <https://github.com/hwdsl2/setup-ipsec-vpn/blob/master/docs/uninstall.md>
+ docketの場合は docketを作成すればOK?

# 用語

## NAT

+ ネットワークアドレス変換
+ IPアドレスレンジを他のIPアドレスレンジに変換するマプを持っている
+ NAT では、複数のプライベート IP アドレスが 1 つのパブリック IP アドレスにマップされます
+ NAT デバイスは Elastic IP アドレスを持ち、インターネットゲートウェイを介してインターネットに接続されます

## VPNトンネル

+ ハードウェアVPN接続では2つのVPNトンネルを使用します
+ これはAWSの冗長性確保の思想によるもの
+ 1つのトンネルに障害が発生し使用出来なくなった場合、仮想プライベートゲートウェイは自動的にもう1つのトンネルにルーティングする

# setup-ipsec-vpnで設置してみる

Option 1: Have the script generate random VPN credentials for you (will be displayed when finished):

centosを利用

```sh
yum update
wget https://git.io/vpnsetup-centos -O vpnsetup.sh && sudo sh vpnsetup.sh
```

ubuntuを利用

```sh
sudo apt-get update && apt-get dist-upgrade
wget https://git.io/vpnsetup -O vpnsetup.sh && sudo sh vpnsetup.sh
```

UDP ports 500 & 4500, and TCP port 22を許可

# References

+ [VPN 接続](http://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/vpn-connections.html)
+ [AWS環境にOpenVPNでVPNを構築](http://qiita.com/hideki/items/657a5701133e713fcf8c)
+ [SoftEtherによるVPN(IPSec)に、IPhone及び、OS X からの接続してみた](http://dev.classmethod.jp/smartphone/softether_l2tp_over_ipsec/)
+ [Amazon EC2とOpenVPNでサーバ-多拠点クライアント間通信をセキュアに行う](http://dev.classmethod.jp/cloud/aws/ec2-ssl-vpn-use-openvpn/)
+ [Amazon VPCとGoogle Compute EngineをVPN接続する](http://dev.classmethod.jp/cloud/vpn-interconnect-amazon-vpc-and-gce/)
+ [Scripts to build your own IPsec VPN server, with IPsec/L2TP and Cisco IPsec on Ubuntu, Debian and CentOS](https://github.com/hwdsl2/setup-ipsec-vpn)

## vpcへのhardware VPN接続について

+ [ 1 Amazon VPC- ハードウェアVPN接続についてまとめてみた](https://dev.classmethod.jp/cloud/aws/vpc-connect-hardware-vpn/)
+ [ 2 Amazon VPC ハードウェアVPN接続を設定する](http://dev.classmethod.jp/cloud/aws/configure-vpc-vpn-connect/)

## slide

+ [AWS Black Belt Techシリーズ Amazon VPC](http://www.slideshare.net/AmazonWebServicesJapan/aws-black-belt-tech-amazon-vpc-47025202)

## VPN peering

+ [VPCピアリングを使用してみる](http://qiita.com/SatoHiroyuki/items/ebc28a39ea70c097e161)
+ [VPC ピア接続](http://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/vpc-peering.html)

## VPN basic

+ [VPN接続時に接続先が認識するIPについて](http://d.hatena.ne.jp/japanrock_pg/20090526/1243339020)
+ [L2TP/IPsec VPN プロトコルを用いた筑波大学 VPN サービスへの接続方法](http://campus-vpn.cc.tsukuba.ac.jp/ja/howto_l2tp.aspx#mac)
