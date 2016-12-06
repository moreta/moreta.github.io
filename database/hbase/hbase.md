

# DockerでCDH install

```
docker pull cloudera/quickstart:latest
```

Dockerイメージを立ち上げ
ネットでよく見る手順書にはこのコマンドが載ってるけれども、

```
$ docker run --hostname=quickstart.cloudera \ 
   --privileged=true -t -i cloudera/quickstart:latest \
   /usr/bin/docker-quickstart`
```
   
これだとDocker内で立ち上がったサービスにホストOS(Mac OS)からアクセスできない。要するにブラウザからGUI操作ができない。なのでポートの設定を加えました。7180と80の２つ。
7180はCloudera managerのデフォルトポート、80はQuick start tutorial。

```
$ docker run --hostname=quickstart.cloudera \
   --privileged=true -t -i -d  -p 7180 -p 80 \
  cloudera/quickstart:latest /usr/bin/docker-quickstart
```

# References

+ [DockerでCloudera Managerを立ち上げる](http://qiita.com/junko_urata/items/7f292cbb8a57b099536b)
