ec2のtimezon設定
=========================

# 対応方法まとめ

* 暫定対応 - /etc/localtimeの修正
* 永久対応 - /etc/sysconfig/clock + reboot

## 暫定対応方法 - `/etc/localtime` をセット

`cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime` 

変更を確認

    # before
    > strings /etc/localtime
    TZif2
    TZif2
    UTC0
    
    # after
    > cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
    cp: overwrite ‘/etc/localtime’? y
    > strings /etc/localtime
    TZif2
    TZif2
    JST-9

しかし、これは**今すぐ時間を合わせたいときに**は有効だけど
そのインスタンスの時間の設定をFIXすることにはならないので注意。

**初期化条件**

- yum update
- server restart

うっかりUTCに戻ってしまわないようにするには
/etc/localtimeではなく、/etc/sysconfig/clockを編集すること。


## 永久対応 - `/etc/sysconfig/clock` ファイルを新しい時間帯で更新する

**1****.** **/etc/sysconfig/clockを修正**

    ZONE="Aaia/Tokyo"
    UTC=true # これはtrueのまま修正しない
- UTCはhardware clockに利用されるらしく修正しないでねって書いてある
  - http://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/set-time.html
  > **注記**
  > UTC=true` エントリを別の値に変更しないでください。このエントリは、ハードウェアクロックに使用されるため、インスタンスで別のタイムゾーンを設定する場合は調整する必要はありません。

**2****.** **/etc/localtimeにsymbolic linkを貼る**

    sudo ln -sf /usr/share/zoneinfo/Aaia/Tokyo /etc/localtime

**3****.** **設定後システムを再起動する !!!!!!!!!!!!って書いてある**

    sudo reboot



# References

- [Linux タイムゾーン(Timezone)の変更](http://qiita.com/azusanakano/items/b39bd22504313884a7c3)
- <http://dev.classmethod.jp/cloud/aws/glibc-changed-timezone/>