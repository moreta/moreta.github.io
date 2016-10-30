AWS VPN
==========

# VPN接続Option

+ AWS ハードウェア VPN
+ AWS Direct Connect
+ AWS VPN CloudHub
+ ソフトウェア VPN

# 接続イメージ

VPCにVPN Gatewayを追加して外部と接続可能にする

# その他

**VPNトンネル？**

+ ハードウェアVPN接続では2つのVPNトンネルを使用します
+ これはAWSの冗長性確保の思想によるもの
+ 1つのトンネルに障害が発生し使用出来なくなった場合、仮想プライベートゲートウェイは自動的にもう1つのトンネルにルーティングする

## 接続に使えうもの

+ OpenVPN
  + [tunnelblick - OpenVPNのclient](https://tunnelblick.net/documents.html)
+ [SoftEther](http://ja.softether.org/)

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


# References

+ [VPN 接続](http://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/vpn-connections.html)
+ [AWSにOpenVPNでVPNを構築してみた](http://qiita.com/saitoxu/items/b0a265edfb11ac381c89)
+ [AWS環境にOpenVPNでVPNを構築](http://qiita.com/hideki/items/657a5701133e713fcf8c)
+ [Amazon VPC ハードウェアVPN接続を設定する](http://dev.classmethod.jp/cloud/aws/configure-vpc-vpn-connect/)
+ [SoftEtherによるVPN(IPSec)に、IPhone及び、OS X からの接続してみた](http://dev.classmethod.jp/smartphone/softether_l2tp_over_ipsec/)
+ [Amazon EC2とOpenVPNでサーバ-多拠点クライアント間通信をセキュアに行う](http://dev.classmethod.jp/cloud/aws/ec2-ssl-vpn-use-openvpn/)

## VPN peering

+ [VPCピアリングを使用してみる](http://qiita.com/SatoHiroyuki/items/ebc28a39ea70c097e161)
+ [VPC ピア接続](http://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/vpc-peering.html)
