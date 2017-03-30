---
title: Pentaho
date: 2016-08-03
tags: pentaho, BI
---



# Install


## Download Pentaho

+ <http://community.pentaho.com/>から Business Analytics Platformをダウンロード
+ ダウンロードが終わったら解凍
  + biserver-ce」というディレクトリに展開

## run

downloadして起動するとportとか被ってもろもろ面倒なのでdockerをおすすめ


```
cd /your/pentaho/path
 ./start-pentaho.sh
```

access

<http://localhost:8080/pentaho/>


# Install by docker (Running Pentaho with PostgreSQL)

<https://hub.docker.com/r/wmarinho/pentaho-biserver/>

```
git clone https://github.com/wmarinho/docker-postgresql.git
cd docker-postgresql
docker build -t wmarinho/postgresql:9.3 .
docker run --name pentaho-postgresql -d wmarinho/postgresql:9.3
docker run --name pentaho -d --link pentaho-postgresql:postgresql -p 8021:8080 wmarinho/pentaho-biserver:6.1
docker run -p 8022:8080 -d wmarinho/pentaho
docker logs -f pentaho
```

listing image

```
sudo docker images
sudo docker run -p 8080:8080 -d wmarinho/pentaho-biserver:5.0-TRUNK
sudo docker run -p 8081:8080 -d wmarinho/pentaho-biserver:5.1-TRUNK
```

Make sure your container is running

```
$ sudo docker ps
```


# References

+ [Pentaho BIサーバ　Community Edition(Ver6)をWindowsでインストールして動かしてみたよ](http://web.plus-idea.net/2016/02/pentaho-biserver-community-edition/)
