

# master設定

```
wal_level = hot_standby
max_wal_senders = 4
wal_keep_segments = 16
```

+ "wal_level=host_standby" でマスタがスレーブからの接続を受け付けられるようにwad_levelにhot_standbyを指定
+ max_wal_senders でマスタが受け付けるスレーブの最大接続数を設定
+ wal_keep_segments にレプリケーション用に残しておくWALファイルの数を指定
  + wal_keep_segments の設定により最低限残しておくWALファイル数が決まるようです。なお、スレーブ側がまだ反映していない分のWALファイルが削除されてしまった場合、レプリケーションはできないようです(その場合はデータの同期からやり直しと思われます...)。なので多めにとっておいたほうが安全ですね。


# References

+ [PostgreSQL9.1ためしてみた【非同期レプリケーション編】](http://d.hatena.ne.jp/hiroe_orz17/20111113/1321180635)
