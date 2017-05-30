---
title: docker
date: 2014-06-03
tags: docker
---

# Overview

+ [日本語document](http://docs.docker.jp/index.html)
+ [Dockerの基礎知識](http://qiita.com/tomoyamachi/items/8046deb2b3d3d0847af1)



## Docker Engine

Docker本体。コンテナに関する機能を提供。

## Docker Compose

複数のコンテナを管理することの出来るツール。

## Docker Machine

Dockerホストを構築するツール。

## Docker Swarm

Dockerホストのクラスタを管理するツール。

## Docker Images

+ ReadOnlyなコンテナ用のテンプレート
+ Dockerユーザならだれでも作れる
+ DockerHubやローカルに保存できる
+ Imageは「レポジトリ名:タグ」で特定する
+ デフォルトのタグは、「latest」
+ コンテナは1つ以上のイメージを元にして作られる

### docker search

<https://docs.docker.com/engine/reference/commandline/search/>

[docker hub](https://hub.docker.com/)から検索される

```
docker search [OPTIONS] TERM
```

# Install

## Mac Install

+ <https://docs.docker.com/engine/installation/mac/>

まだbeta(2016/07/22現在)だけど docker for macがあるのでこれでお試し

+ <https://docs.docker.com/docker-for-mac/>


## centos Install

+ <https://docs.docker.com/engine/installation/linux/centos/>


1 Log into your machine as a user with sudo or root privileges.
2 Make sure your existing yum packages are up-to-date.

```
sudo yum update
```

3 add the yum repo

```
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
```

4 Install the Docker package.


```
sudo yum install docker-engine
```

5 Start the Docker daemon.
```
sudo service docker start
```

6 Verify docker is installed correctly by running a test image in a container.

docker runすると imageがない場合 <https://cloud.docker.com/>から自動で downloadする

```
$ sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
    latest: Pulling from hello-world
    a8219747be10: Pull complete
    91c95931e552: Already exists
    hello-world:latest: The image you are pulling has been verified. Important: image verification is a tech preview feature and should not be relied on to provide security.
    Digest: sha256:aa03e5d0d5553b4c3473e89c8619cf79df368babd1.7.1cf5daeb82aab55838d
    Status: Downloaded newer image for hello-world:latest
    Hello from Docker.
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
     1. The Docker client contacted the Docker daemon.
     2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
            (Assuming it was not already locally available.)
     3. The Docker daemon created a new container from that image which runs the
            executable that produces the output you are currently reading.
     4. The Docker daemon streamed that output to the Docker client, which sent it
            to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
     $ docker run -it ubuntu bash

    For more examples and ideas, visit:
     http://docs.docker.com/userguide/
```

## Create a docker group - sudoなしでdocker commandを利用

+ defaultではunix sockerは rootユーザーに所有されている。
+ 他のユーザーがアクセスするためにはsudoが必要
+ なのでdockerを実行するときにはrootユーザーでrunする。

`sudo`の実行を避けるためには `docker`というunix groupを作る

1. Log into Centos as a user with sudo privileges.

2. Create the docker group.

`sudo groupadd docker`

3. Add your user to docker group.

`sudo usermod -aG docker your_username`

4. Log out and log back in.
This ensures your user is running with the correct permissions.

5. Verify your work by running docker without sudo.

`docker ps -a`


## Start the docker daemon at boot

```
sudo chkconfig docker on
```



# commands


```
docker ps

docker info

docker --version
# Docker version 1.12.0-rc2, build 906eacd, experimental

docker-compose --version
#docker-compose version 1.8.0-rc1, build 9bf6bc6

docker-machine --version
# docker-machine version 0.8.0-rc1, build fffa6c9
```

## docker run

Run a command in a new container

## docker ps

動いているコンテナの確認

```
docker ps # running containers
```

停止しているコンテナの確認

```
docker ps -a # all containers
```

```
⋊> ~ docker ps --help                                                                                                                                                           10:37:44

Usage:	docker ps [OPTIONS]

List containers

Options:
  -a, --all             Show all containers (default shows just running)
  -f, --filter value    Filter output based on conditions provided (default [])
      --format string   Pretty-print containers using a Go template
      --help            Print usage
  -n, --last int        Show n last created containers (includes all states) (default -1)
  -l, --latest          Show the latest created container (includes all states)
      --no-trunc        Don't truncate output
  -q, --quiet           Only display numeric IDs
  -s, --size            Display total file sizes
```

## Creating, Starting, Stopping, and Removing Containers

```
$ docker create -P --expose=1234 python:2.7 python -m SimpleHTTPServer 1234
a842945e2414132011ae704b0c4a4184acc4016d199dfd4e7181c9b89092de13
$ docker ps -a
CONTAINER ID  IMAGE       COMMAND              CREATED       ... NAMES
a842945e2414  python:2.7  "python -m SimpleHTT 8 seconds ago ... fervent_hodgkin
$ docker start a842945e2414
a842945e2414
$ docker ps
CONTAINER ID  IMAGE       COMMAND              ...   NAMES
a842945e2414  python:2.7  "python -m SimpleHTT ...   fervent_hodgkin
$ docker restart a842945e2414
a842945e2414
$ docker ps
CONTAINER ID    IMAGE       COMMAND              ...   NAMES
a842945e2414    python:2.7  "python -m SimpleHTT ...   fervent_hodgkin
$ docker kill a842945e2414
a842945e2414
$ docker rm a842945e2414
a842945e2414
$ docker ps -a
CONTAINER ID    IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
```

### To stop a running container

２つある

+ `docker kill` : which will send a SIGKILL signal to the container
+ `docker stop` : which will send a SIGTERM and after a grace period will send a SIGKILL

### docker rm

コンテナの削除

```
docker rm [コンテナID-1] [コンテナID-2]
```

## docker images : イメージの削除方法

+ 順番的にはcontainerを削除してからimageを削除するのがいい。
+ force optionをつけて削除することもできるがおすすめできない

```
# 現状のコンテナの確認
docker ps -a
# 現状のイメージの確認
docker images
```

イメージの削除

```
docker rmi [イメージID]
```


# やってみよう

nginxをたちあげ

```
docker run -d -p 80:80 --name webserver nginx
# これで80ポート使っているからエラーになる

# もう一回
docker run -d -p 8180:80 --name webserver nginx
# The name "/webserver" is already in use by containerのエラーがでる

# 確認して
docker ps

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
c22941be7ee1        nginx               "nginx -g 'daemon off"   8 minutes ago       Created                                 webserver

# 削除する
docker rm webserver

# もう一回　: 2回目
docker run -d -p 8180:80 --name webserver nginx

# http://localhost:8180/で確認
```


# docker all container stop and all container remove

```
docker stop $(docker ps -q)
docker rm -v $(docker ps -aq)
```

# Detached Mode

+ dockerをrunで起動し、backgroupでserviceを起動したい
  + run a service in the background

Use the `-d` option of docker run.

`docker run -d -p 1234:1234 python:2.7 python -m SimpleHTTPServer 1234`


# Building a Docker Image with a Dockerfile

Dockerfile

```
FROM busybox

ENV foo=bar
```

```
docker build [OPTIONS] PATH | URL | -
docker build -t testbox .

Sending build context to Docker daemon 2.048 kB
Step 1 : FROM busybox
 ---> 2b8fd9751c4c
Step 2 : ENV foo bar
 ---> Running in cc3e8c284cae
 ---> 4470cd56ad65
Removing intermediate container cc3e8c284cae
Successfully built 4470cd56ad65

docker images

docker run testbox env | grep foo
```


# remove all image

```sh
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```