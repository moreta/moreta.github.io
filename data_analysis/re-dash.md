Re:dash
=============


# Setup & Install

docker based install 

+ [Docker Based Developer Installation Guide](https://redash.io/help-onpremise/dev/docker.html)
+ [Developer Installation Guide](https://redash.io/help-onpremise/dev/setup.html)


##  dockerの準備

1. redash directoryを任意の場所に作成
2. redash gitをclone https://github.com/getredash/redash.git

Once you have the above setup, you need to create the Docker services:


### test用

```sh
git clone https://github.com/getredash/redash.git
cd redash
```

```sh
emacs docker-compose.production.yml
# 編集内容は以下の sampleを参照
```

起動してみる

```sh
docker-compose -f docker-compose.production.yml up postgres
# postgresが無事起動したら終了
```

databaseを作成のため scriptを一回実行
```sh
./setup/docker/create_database.sh
# 結果はエラーになるが特に問題は無かった
```

起動
```sh
docker-compose -f docker-compose.production.yml up
docker-compose -f docker-compose.production.yml up -d # deamonにしたい場合は-d
```


docker-compose.production.yml sample

```yml
# This is an example configuration for Docker Compose. Make sure to atleast update
# the cookie secret & postgres database password.
#
# Some other recommendations:
# 1. To persist Postgres data, assign it a volume host location.
# 2. Split the worker service to adhoc workers and scheduled queries workers.
version: '2'
services:
  server:
    # image: redash/redash:latest
    image: redash/redash:1.0.3.b2864 # 1. versionを指定
    command: server
    depends_on:
      - postgres
      - redis
    ports:
      - "5000:5000"
    environment:
      PYTHONUNBUFFERED: 0
      REDASH_LOG_LEVEL: "INFO"
      REDASH_REDIS_URL: "redis://redis:6379/0"
      REDASH_DATABASE_URL: "postgresql://postgres@postgres/postgres"
      REDASH_COOKIE_SECRET: veryverysecret
  worker:
    image: redash/redash:latest
    command: scheduler
    environment:
      PYTHONUNBUFFERED: 0
      REDASH_LOG_LEVEL: "INFO"
      REDASH_REDIS_URL: "redis://redis:6379/0"
      REDASH_DATABASE_URL: "postgresql://postgres@postgres/postgres"
      QUEUES: "queries,scheduled_queries,celery"
      WORKERS_COUNT: 2
  redis:
    image: redis:3.0-alpine
  postgres:
    image: postgres:9.5.6-alpine
    volumes: # 2. コメントアウトする
      - /opt/postgres-data:/var/lib/postgresql/data # 3. ここを自分の環境に合わせて適切に変更
  nginx:
    image: redash/nginx:latest
    ports:
      # - "80:80"
      - "30080:80" # 4. 80にしたくないので 30080
    depends_on:
      - server
    links:
      - server:redash

```

### 実行

```sh
docker-compose -f docker-compose.production.yml up
# または - docker-compose.ymlで保存している場合
docker-compose up
```

### Webページへ接続

http://127.0.0.1:30080
ID: admin
PASS: admin

## 破棄

起動したRedashを停止するには、

```sh
docker-compose down
```

Postgresに保存したデータを含めて削除するには、
```sh
docker-compose down --volumes
```


# for oracle

+ <http://nihonzaru.net/post/redash/>
+ <https://redash.io/help-onpremise/setup/supported-data-sources-options-reqs.html>

## cx_Oralceが必要

Oracle instant clientのため

```sh
# python package for Oracle
pip install cx_Oracle
```

## errorの場合

<https://stackoverflow.com/questions/4307479/install-cx-oracle-for-python>

## その他 for oracle

[Redash で Oracle 接続の Docker を作ってみた](http://qiita.com/sutoh/items/d19c787069ff43aeebcf)

# References

+ [Docker Based Developer Installation Guide](https://redash.io/help-onpremise/dev/docker.html)
+ [Developer Installation Guide](https://redash.io/help-onpremise/dev/setup.html)
+ [RedashをDockerで起動する（2017年3月版）](http://qiita.com/wizpra-koyasu/items/aa8b3fc069816d91ae05)


## mac install & run

```sh
# 1.git clone と　ディレクトリ移動
git clone https://github.com/getredash/redash.git
cd redash/

# 2.docker-compose-example.ymlより、docker-compose.ymlを作成
mv docker-compose.yml docker-compose.yml.bak
cat docker-compose.production.yml | sed -e "s/\/opt\/postgres-data/\.\/postgres-data/" > docker-compose.yml

# 3. Create Docker Services
docker-compose up

# 4. Install npm package
npm install

# 5. Create Database
# Create tables
docker-compose run --rm server create_db

# 6.バックグラウンド起動をつけて起動
docker-compose up -d
```