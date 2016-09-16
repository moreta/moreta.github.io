---
title: Redmine with postgres
date: 2014-09-23
tags: redmine, issue
---

個人用で利用するのをインストールをまとめる。

defaultと違って、sqlite3とnginx+passengerを使う。


### sqlite3インストール

```
# sqlite
yum install libsqlite3*
# imagemackck
yum install ImageMagick ImageMagick-devel ipa-pgothic-fonts
```

### nginx+passenger インストール

passenger gemでインストールする。


### redmine download

`wget http://www.redmine.org/releases/redmine-2.5.2.tar.gz`
or
`curl -O http://www.redmine.org/releases/redmine-2.5.2.tar.gz`

```
tar xvf redmine-2.5.2.tar.gz
mv redmine-2.5.2 redmine
cd redmine
```

### database設定

config/database.example.yml をコピーして config/database.yml を作成してください。 
config/database.yml を編集し、"production"環境用のデータベース設定を行ってください。


#### database.yml.exampleを参考にして書けば大丈夫
PostgreSQLを使用する場合の例(デフォルトのポート):

````
production:
  adapter: sqlite3
  database: db/redmine.sqlite3
  timeout: 5000
````

### bundle install

`bundle install --path vendor/bundle`

path指定を忘れずに

### Redmineの初期設定とデータベースのテーブル作成

初期設定
```
#bundle 経由でこれからも操作を行う
bundle exec rake generate_secret_token
```

データベース作成
```
RAILS_ENV=production bundle exec rake db:migrate
```

### nginx設定

passengerとnginxがインストールされていれば以下を入れる

```
server {
  listen       80;
  listen       443 ssl;
  server_name  issue.lunchmate.me;
  root /home/app/www/redmine/public;
  passenger_enabled on;
  rails_env production;
  #charset koi8-r;
  
  # ...以下省略
}
```

## 参考

* <http://atasatamatara.hatenablog.jp/entry/20120316/1331926385>
* <http://blog.redmine.jp/articles/2_5/installation_centos/>
* <http://redmine.jp/guide/RedmineInstall/>


