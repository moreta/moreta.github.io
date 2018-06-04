
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


# 削除

## remove container

停止しているコンテナをすべて削除する

```
docker container prune
```

コンテナをすべて削除する - すべてのコンテナが「不要」だと判断した場合に

```
docker rm -f $(docker ps -a -q)
```

## remove image 

### コンテナが使っていないイメージをすべて削除する - container基準で考える
```
docker image prune
```

もう一度docker imagesで確認すると、不要なimageが削除されています。


### image 一個削除

<https://docs.docker.com/engine/reference/commandline/image_rm/>


```
docker image rm [OPTIONS] IMAGE [IMAGE...]
```

## tagの削除 - docker tagでつけて

docker tagでつけて imageはそのままで、tagだけ削除したい

```
docker rmi [REPOSITORY_ID]
```


# 使っていないcontainerの一括削除

起動しているcontainerを確認する
docker ps

起動していないものも含め全てのcontainerを確認する
docker ps -a

使われていないcontainerを一括削除する
docker container prune

もう一度docker ps -aで確認すると、不要なcontainerが削除されてdocker psした時と同じになっているはずです。


# Makefileをつかうとcommandが便利に


<https://codereviewvideos.com/course/docker-tutorial-for-beginners/video/docker-compose-multiple-environments>

```
docker_build:
    @docker build \
        --build-arg WORK_DIR=/var/www/dev/ \
        -t docker.io/codereviewvideos/symfony.dev .

docker_push:
    @docker push docker.io/codereviewvideos/symfony.dev

bp: docker_build docker_push

dev:
    @docker-compose down && \
        docker-compose build --pull --no-cache && \
        docker-compose \
            -f docker-compose.yml \
            -f docker-compose.dev.yml \
        up -d --remove-orphans

acceptance:
    @docker-compose down && \
        docker-compose build --pull --no-cache && \
        docker-compose \
            -f docker-compose.yml \
            -f docker-compose.acceptance.yml \
        up -d --remove-orphans
```