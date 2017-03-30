
nohup
===============


# feature

* nohupでコマンドを実行した場合は，ログアウトしてもプログラムを実行し続ける。
* 長い処理を行っており，席を外したいときなどに使用すると便利である。
* ログアウトした後は，ジョブではなくプロセスとして管理することになる。
* また，処理中に出力されたメッセージは`nohup.out`に保存される。

# example

1. nohup commandを使う
2. `&`の指定によってシェルスクリプトをバックグラウンドで動かせる

```sh
nohup grep "Jan" some_access_log > result &
nohup ./batch.sh &
```


# nohup.out

## nohup.out以外の場所に保存

### nohupで実行したコマンドの標準出力を、out.log に出力させてみる

```sh
nohup command > out.log &
```

### nohupで実行したコマンドの標準エラー出力を、error.log に出力させてみる

```sh
nohup command > out.log 2> error.log &
```


### なにものこさない

```
nohup command >/dev/null 2>&1 &
```



# References

+ [【 nohup 】 ログアウトした後もコマンドを実行し続ける](http://itpro.nikkeibp.co.jp/article/COLUMN/20060227/230850/)
+ [nohupを使ってsshログアウト後もシェルスクリプトを動かす](http://qiita.com/toshihirock/items/4a6b17a38f9b6e5e7116)
+ [技術/UNIX/なぜnohupをバックグランドジョブとして起動するのが定番なのか？(擬似端末, Pseudo Terminal, SIGHUP他)](https://www.glamenv-septzen.net/view/854)
+ [ログアウトしてもプログラムを実行し続けるには](http://www.atmarkit.co.jp/flinux/rensai/linuxtips/352nostopprog.html)