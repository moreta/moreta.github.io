
# timezoneを設定しているとcron実行時間がずれることがある


```sh
# Timezoneを変更してみて
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
# 時間確認
date  
2016年 12月  9日 金曜日 01:10:31 JST  
```

JSTで出るようになったのですが、

cronの判定時間はずれる

```sh
# cron logで確認
tail -f /var/log/cron
```

を参考にして、 crontab の先頭に

`TZ="Japan"`
と追記。または
`CRON_TZ="Japan"`

```sh
sudo /sbin/service crond restart
# or
service crond restart
```


# list

```sh
crontab -l
```

# 編集

```sh
crontab -e
```


# 全ユーザーのcronジョブ一覧を表示する

```sh
for user in $(cut -f1 -d: /etc/passwd); do echo $user; crontab -u $user -l; done
```

# References

+ [全ユーザーのcronジョブ一覧を表示する](http://qiita.com/ironsand/items/fb05869080f6ed724816)
+ [cronが設定した時間どおりに実行されない！](http://jmblog.jp/archives/774)