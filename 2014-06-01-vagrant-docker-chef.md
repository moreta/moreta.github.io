---
title: Vagrant Docker Chef Packer
date: 2014-06-01
tags: vagrant, docker, chef, packer
---


## Docker

* <http://www.slideshare.net/dotCloud/docker-intro-november>

* コンテナ型なので起動が早い
* レイヤによる差分ファイルシステム
* ディスク、ネットワーク節約

### macでためすには

* dockerコンテナが動かない
* コマンドは使える

なので、通常Vagrantを利用するが、`Boot2Docker`を利用しても大丈夫

#### Vagrantで

Vagrantをすでに利用しているユーザならvagrantでも利用がいいかも。


##### docker provisioner

<http://docs.vagrantup.com/v2/provisioning/docker.html>

#### Boot2Dockerで 

`Boot2Docker`は公式サイトのインストールガイドからリンクがある。
* <https://docs.docker.com/installation/mac/>
* <https://github.com/boot2docker/boot2docker>


## dockerとvagrant

<http://www.slideshare.net/shin1x1/lt-up-33437883>

![container-vs-vm](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-01/container-vs-vm.png)

#### same

* 独立した仮想環境が容易に作れる 
* ベースイメージを利用 
* 構築手順（Dockerﬁle, Vagrantﬁle）を  書いて、自動構築 
* どの環境でも同じ環境が作れる

#### different

* 動作方式（ハイパーバイザー型とコンテナ型） 
* 起動速度 
* ファイルシステム  （フルバックアップと差分バックアップ） 
* ポータビリティ 
* 想定しているユースケース

#### 検証環境 (Vagrant, Docker)

* ミドルウェアのインストールや設定の検証など 
* 手軽に作って、壊してができるので良い 
* 検証用のベース image を用意しておく 
* image のキャッシュを生かすため  同じ VM 上で Docker デーモンを動かす

#### 開発環境 (Vagrant)

* OSX の IDEで書いて、コードの実行はVM  => Vagrant の synced_folder を利用 
* プロジェクト毎に独立した環境にしたい  => Vagrant の方がより独立した環境に 
* 全く同じ環境にしたい  => アクセス IP も固定した方が吉 
* OSXでは、どのみちVMが必要 
* Vagrant 内でプロビジョナで Docker 使うならアリ

#### CI環境 (Docker)

* Jenkinsでオールテスト実行環境として利用 
* ビルドの度にコンテナを生成して、テスト実行 
* ビルド毎に独立した環境 
* 軽量な動作で複数実行されても問題無い 
* いま、一番導入しやすいところ 
* Vagrant だとオーバーヘッドが大きい

#### 本番環境 (Docker使ってもいい？)

## packer

### mac install 

download and install
<http://www.packer.io/downloads.html>

非公式だけbrewでもできる

```
$ brew tap homebrew/binary
$ brew install packer
```

## vagrant

### インストール

以前はgemもあったが、今(2014年7月14日)は公式サイトからのダウンロードをおすすめしている。


`vagrant --version`

### agent-forward

<https://coderwall.com/p/q8z1rg>


## chef

### chef-solo

<http://tsuchikazu.net/chef_solo_start/>



## 参考

* <http://www.scriptrock.com/articles/docker-vs-vagrant>
* <http://www.vagrantup.com/>
* <http://knowledge.sakura.ad.jp/tech/1552/2/>
* <http://tsuchikazu.net/chef_solo_start/>
* <https://coderwall.com/p/q8z1rg>>
* [インフラ系ツールまとめ](http://qiita.com/kasaharu/items/59b8d3a76b4a22eab88e)

### chef

* <http://tsuchikazu.net/chef_solo_start/>

### docker

* <http://www.slideshare.net/dotCloud/docker-intro-november>
* <http://www.slideshare.net/shin1x1/lt-up-33437883>