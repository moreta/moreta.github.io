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

+ <https://docs.docker.com/docker-for-mac/>

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


