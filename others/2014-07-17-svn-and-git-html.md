---
title: SVN & git
date: 2014-07-17
tags: git,svn
---

## 100年ぶりのSVN

久しぶりにSVNを（原始時代に戻った）つかったら迷った。

標準的な構成

```
/
  + READMEe
  + branches/
  |   + 1.0.x/
  |   + 1.4.x/
  |   + 1.4.x-r24119,r24121/
  |   + 1.5.x-issue2489/
  |   + arterm-soc-work/
  |   + issue-2382/
  + tags/
  |   + 0.10.0/
  |   + 1.0.0/
  |   + 1.0.0-beta1/
  + trunk/
```

### Subversionにおけるブランチ

Subversionにおいては、ブランチとは単なるディレクトリに過ぎない

```
project - trunk
        - branches - foo
                   - bar
```

ブランチを作成するというのは「ディレクトリをコピーすること」と操作的には同じであり、１コミットとして扱われます。


## svn server

### mac

<http://biblelab.net/mydiary/20110323/2763.html>

#### 1.リポジトリの作成

`svnadmin create SvnRepository`

#### 2. リポジトリの公開設定をする

`SvnRepository/conf/svnserve.conf`

以下の内容を修正

```
[ general ]
anon-access = none
auth-access = write
password-db = passwd
realm = [レポジトリの説明]
```

#### 3. リポジトリにアクセスできるユーザの作成


* ユーザの設定が必要ない場合は，ここは飛ばしてください．
* ユーザの設定は，2.においてpassword-dbで指定したファイルに記述します．本記事の例では，/Users/hoge/mysvn/conf/passwdに記述することになります．
* 以下のように，ユーザ名とパスワードを設定します．

[ users ]
[ユーザ名] = [パスワード]

#### 4. リポジトリの公開

以下のコマンドを実行します．

`svnserve -d`

これで，`svn://[IPアドレス]/repositorypath/SvnRepository`にアクセスすれば，作成したSubversionのリポジトリをチェックアウトしたりコミットしたりできます．

#### 5. server停止

`killall svnserve`


## なのでやはりgitを使うことにする - でもやめた。ややこしい問題がいろいろ発生しそう。

ちょっとやってみたところ、
git-svnを使うメリットより、トラブルによるストレスが多いそうなので
以下はやめる。

### gitとsvn

<http://git-scm.com/book/ja/Git%E3%81%A8%E3%81%9D%E3%81%AE%E4%BB%96%E3%81%AE%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E9%80%A3%E6%90%BA-Git-%E3%81%A8-Subversion>

### `git-svn`

### 注意

* 業内容をリベースする
* 歴史をできるだけ一直線に保つようにし
* 歴史を書き換えてもう一度プッシュしようなどとしてはいけません(Subversion が扱えるのは一本の直線上の歴史だけで)


### svn のログを見る

`git svn log`

### svn のリポジトリを git svn でclone

`git svn clone svn://example.com/svn/repo -T trunk -b branches -t tags`


`git svn clone`は以下の２つを続けて投げたのと同じ

```
git svn init
git svn fetch
```

#### `-T trunk -b branches -t tags`

trunk branches tagsの指定

標準を使うならこのように省略できる(`-s`)

`git svn clone svn://example.com/svn/repo -s`

**もし数百数千のコミットがあるプロジェクトで試すと、終わるまでには数時間から下手をすると数日かかってしまうかもしれません**

*local なら ex)*

`git svn clone svn://localhost/pathtosvn/SvnServer -s`


#### Can't locate SVN/Core.pm in @INC エラー

<http://blog.victorquinn.com/fix-git-svn-in-mountain-lion>

The problem here is that the git svn command requires Perl libraries that aren’t linked in Mavericks (or Mountain Lion). [1] So, we’ll have to manually link them

```
# Perl 5.16を使っている場合 (Mavericks)
sudo ln -s  /Applications/Xcode.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level/SVN /System/Library/Perl/Extras/5.16/SVN
sudo ln -s /Applications/Xcode.app/Contents/Developer/Library/Perl/5.16/darwin-thread-multi-2level/auto/SVN/ /System/Library/Perl/Extras/5.16/auto/SVN

# Perl 5.12を使っている場合 (Moutain Lion)
sudo ln -s  /Applications/Xcode.app/Contents/Developer/Library/Perl/5.12/darwin-thread-multi-2level/SVN /System/Library/Perl/Extras/5.12/SVN
sudo ln -s /Applications/Xcode.app/Contents/Developer/Library/Perl/5.12/darwin-thread-multi-2level/auto/SVN/ /System/Library/Perl/Extras/5.12/auto/SVN
```
