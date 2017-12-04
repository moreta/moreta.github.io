
VPN Basic
===============


# 誰でもわかるVPNの仕組みと３つの導入手順

<https://blog.watchjtv.com/index.php/2017/01/02/what-is-vpn/>



# VPN接続時に接続先が認識するIPについて

いつもの インターネット

```
「自分」 -> 「ルータ(IP:xxx.xxx.xxx.xxx)」 -> 「接続先」（お！IP:xxx.xxx.xxx.xxxというやつが接続してきたぞ）
```

VPNを使ったインターネット パターン１

```
「自分」 -> 「ルータ(IP:xxx.xxx.xxx.xxx)」 -> 「VPN接続先（IP:yyy.yyy.yyy.yyy）」 -> 「接続先」（お！IP:yyy.yyy.yyy.yyyというやつが接続してきたぞ）
```

VPNを使ったインターネット パターン２

```
「自分」 -> 「ルータ(IP:xxx.xxx.xxx.xxx)」 -> 「VPN接続先（IP:yyy.yyy.yyy.yyy）」 -> 「接続先」（お！IP:xxx.xxx.xxx.xxxというやつが接続してきたぞ）
```

## パターン１，２の違いは？

### パターン１
+ VPNのIPを使うパターン
+ 以下の設定を入れるとVPNのIPを使う

windowなら
+ TCP/IP詳細設定 -> 「全般」->「リモート ネットワークでデフォルト ゲートウェイを使う」にチェック

macなら
  + VPN設定を作った -> Advanced.. -> Send all traffic over VPN connectionのチェック

### パターン２

上の設定でチェックを外す
