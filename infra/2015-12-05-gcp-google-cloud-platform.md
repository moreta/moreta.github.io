---
title: Google Cloud Platform
date: 2015-12-05
tags: GCP, google, aws, cloud
---

# References

- <https://cloud.google.com/compute/docs/quickstart>

# Compute Engine

## ssh接続

+ id addressを ephemeralを選択したときにはこれを利用するのがいい
+ ephemeralサーバーを再起動するとipが変わってしまうので

```
gcloud compute --project "projectid" ssh --zone "asia-east1-b" "instance-name"
```
でもこのcommandだけ $USERでログインされる
USER specifies the username with which to SSH. If omitted, $USER from the environment is selected.

なので以下のcommandが望ましい

```
# username@をつけて指定userでログイン
gcloud compute --project "projectid" ssh --zone "asia-east1-b" "username@instance-name"
```


### by gcloud command

### by 既存ssh

keyを登録する
+ インスタンス生成時
+ インスタンスの詳細画面で登録

```
ssh-keygen -t rsa -C "ユーザー名"
```

instanceにキーを登録すると、instance内でuseraddしてくれる


## tutorial

### server end

pdate packages and install MongoDB. When asked if you want to continue, type 'Y'.

```sh
sudo apt-get update
sudo apt-get install mongodb
```

The MongoDB service started when you installed it. You must stop it so you can change how it runs.

```sh
sudo service mongodb stop
```

Create a directory for MongoDB and then run the MongoDB service in the background on port 80.


```sh
sudo mkdir $HOME/db ; sudo mongod --dbpath $HOME/db --port 80 --fork --logpath /var/tmp/mongodb
```

After you enter the final command, click Done and then confirm that you want to leave the page to close the SSH browser window.


### front end

Update packages and install git, Node.js and npm. When asked if you want to continue, type 'Y'.

```sh
sudo apt-get update
sudo apt-get install git nodejs npm emacs
ln -s /usr/bin/nodejs /usr/bin/node # nodejsでインストールしたのでnode commandが使えない
```

Clone the sample application and install application dependencies.

```sh
git clone https://github.com/GoogleCloudPlatform/todomvc-mongodb.git
cd todomvc-mongodb; npm install
```

Start the todo web application. Note: The IP addresses below are internal IPs for communication between servers. You can find these IP addresses on each server’s details page.

```sh
nohup nodejs server.js --be_ip 10.240.0.2 --fe_ip 10.240.0.3 &
```

### front ent static file only

```
sudo npm install -g nws
nws -p 8080

# or

sudo npm install -g node-static
static # default 8080
static -p 8081
```

### apache 利用

- <https://cloud.google.com/compute/docs/linux-quickstart>

```sh
sudo apt-get update && sudo apt-get install apache2 -y
echo '<!doctype html><html><body><h1>Hello World!</h1></body></html>' | sudo tee /var/www/index.html
```

### nginx

- <https://cloud.google.com/compute/docs/tutorials/setup-lemp>

# サービス アカウント (Service account)

プリケーションがリソースにアクセスすることを可能にするプロジェクトに固有のタイプのロール アカウントです。
Cloud Platform の外部では、認証ベースのサービス アカウントを使用してリモートからセキュアなアクセスを実現できます。
サービス アカウントは Cloud プロジェクト内から簡単に作成して呼び出すことができます。

# Cloud Storage

## How to Host Static Website

- <https://cloud.google.com/storage/docs/website-configuration>

# Google Cloud SDK

<https://cloud.google.com/sdk/docs/>


```sh
# install
./google-cloud-sdk/install.sh
# initial setting
./google-cloud-sdk/bin/gcloud init
```

```sh
# to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to get help on any gcloud command
gcloud --help
gcloud topic -h
```

# deploy

gcloud preview app deployはなにをするのか？

<http://qiita.com/imaimiami/items/e7e5bdce1cd493d17016>
