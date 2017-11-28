


# CATALINA_OPTS
[CATALINA_OPTSの指定](http://park1.wakwak.com/~ima/java_tips0001.html)

| option                 | desc                                                    |
+------------------------+---------------------------------------------------------+
| -server                | サーバVMとして動く                                      |
| -Xmx                   | メモリ最大使用量                                        |
| -Xms                   | メモリ初期使用量                                        |
| -Xss                   | スレッドスタックサイズ                                  |
| java.awt.headless=true | サーブレットで画像を処理させるときの設定（J2sdk1.4以上) |
| -Xloggc:path           | GC実行ログを記録します                                  |
| -XX:+PrintGCDetails    | -Xloggcと組み合わせて指定します                         |

## 設定場所

+ catalina.sh


## java.net.BindException: permission denied: 80

Linuxまたは OSXでは 1024以下のポートをrootではないユーザーが開くのを強化しない

### 回避方法

8080で起動して80ポートを8080にフォワードする。

[port-forward](http://moreta.github.io/2014/07/21/port-forward/)を参考に


# References

+ [CATALINA_OPTSの指定](http://park1.wakwak.com/~ima/java_tips0001.html)
+ [JVMのヒープメモリを確認する - jstat](http://qiita.com/kaikusakari/items/9b7c3d1fb524eb6aa348)
+ [port-forward](http://moreta.github.io/2014/07/21/port-forward/)を参考に