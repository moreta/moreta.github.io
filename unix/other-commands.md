---
title: UNIX
date: 2014-05-21
tags: unix, command
---

# line count

`wc -l file_name.txt`

# tail


# メモリ

## メモリ使用状況の確認

free

```
> free
             total       used       free     shared    buffers     cached
Mem:       7634740    4923520    2711220          0    2629756    1359232
-/+ buffers/cache:     934532    6700208
Swap:            0          0          0
```

Mem : 全メモリサイズ
-/+buffers/cache : ページキャッシュ、バッファキャッシュのメモリサイズ
Swap : スワップのメモリサイズ


## メモリーの利用状況を調査

```
procs -----------memory---------- ---swap-- -----io---- --system-- -----cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 2706648 2629756 1359340    0    0     0     8    0    0  4  1 95  0  0
```

si（1秒当たりのスワップインのメモリ量（Kbytes））とso(スワップアウト)の値を確認し、
頻繁に発生している場合はメモリの増設などの対策が必要



## メモリ－は十分なはずなのに 余裕が無い？

<http://www.math.kobe-u.ac.jp/~kodama/tips-free-memory.html>

おや？ 残りメモリ－が 1.6M(free が 1628) しかない？ free の表示単位は 1k ブロックだから, 1.6M の余裕しかないように見える. ピンチなのか？
```
$ free
             total       used       free     shared    buffers     cached
Mem:        192572     190944       1628      54912      20112     126848
....略

```
-/+ buffers/chche を見よう

Linux(っていうか UNIX かな？) では, 各プロセスにメモリを割り振った残りを バッファ(buffer)とキャッシュ(cache)に利用して, ディスク入出力の負荷を減らしている. そのため, free コマンド等で見える残りメモリ－(free)は 1M 程度の 瞬間的な使いまわしに対処する程度しか残っていない事が多い.

```
$ free
             total       used       free     shared    buffers     cached
Mem:        192572     190944       1628      54912      20112     126848
-/+ buffers/cache:      43984     148588  ＜----ここを見る
Swap:        96384          0      96384
```

この例では, 実質的な残りメモリ－は, バッファとキャッシュに転用された分も考慮すると free+buffers+cached で計算できる. 上の例で云うと free+buffers+cached = 1628+20112+126848 = 148588. まだまだ, メモリ－には余裕がある.

## どのプロセスがメモリを消費しているのか？

個々のプログラムがメモリを浪費しているかどうか, 大雑把に観察する場合どうするか.
free コマンドでは全体のメモリーの使用状況しか分からない. 個々のプロセスのメモリーの使用状況を調べるには top や ps を用いる.

top コマンドを起動してから "M"(大文字) すると消費メモリの順に表示される.
ps コマンドで ps -xl --sort -vsize としても良い.

```
top > M
ps -xl --sort -vsize
```

## display color man pages

<http://www.cyberciti.biz/faq/unix-linux-color-man-pages-configuration/>

```
apt-get install most # Debian / Ubuntu
yum install most # Fedora / RHEL / SL / CentOS Linux
brew install most # OSX
```

### setting

bashrc or bash_profile

`export PAGER="most"`


# lsof- プロセスが使用中のファイルを調べる

<http://d.hatena.ne.jp/hogem/20070223/1172221315>

```
### プロセスID指定
lsof -p 12345
### バッククォート使うとこんな感じ
lsof -p `pgrep -n java`
```

### -cオプションでプロセス名指定

`lsof -c java`

### -uオプションでユーザ指定

`lsof -u hoge`

### -i : @IPアドレス:ポート番号

```
lsof -i           # Listenしてるのずらずら表示
lsof -i :22       # ssh
lsof -i :22,80    # ssh or http
lsof -i :http     # 名前でもいける
lsof -i @192.168.0.1    # interface指定
lsof -i @192.168.0.1:80 # interfaceとポート指定
```

# ポートの確認

## 開けているポートを確認

`netstat -l`

## TCPに限定するなら次のオプションです。

`netstat -l -t`

## telnetとnetstatでポート番号の状態を確認する。

<http://togattti.hateblo.jp/entry/2014/01/19/124912>

### telnetで外部からポート番号が空いているか調べる

`telnet xxx.xxx.xxx.xxx 80`

# tree

mac install
```
brew install tree
```

## man page

<http://mama.indstate.edu/users/ice/tree/tree.1.html>

#### LISTING OPTIONS

| options |                desc                |
|---------|------------------------------------|
| -a      | all file(include hidden file)      |
| -d      | directories only                   |
| -L      | Max display depth of the directory |
|         |                                    |

#### FILE OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|
| -u      | print the username                                   |
| -g      | print the groupname                                  |
| -h      | print the size of file in a more human readable way, |
|         |                                                      |

#### SORTING OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|

#### GRAPHICS OPTIONS

| options |                         desc                         |
|---------|------------------------------------------------------|


# ln

## examples


```
# Set up launchctl to auto start mongod
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
```


- -s : シンボリックリンクを作成します。このオプションを省略した場合は、ハードリンクを作成します
- -f : 作成するリンクファイルと同一名のファイルが存在しても、問い合わせなしに上書きします。(force)
- -v : 処理内容を出力します。(verbose)


# 重複を削除する

`sort file.txt | uniq > new_file.txt`

# OS info | OS情報

```
uname -a
cat /etc/issue.net
cat /etc/redhat-release
cat /etc/debian_version
```
