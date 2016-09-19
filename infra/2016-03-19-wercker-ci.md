---
title: Wercker CI
date: 2016-03-19
tags: ci, wercker
---


# CI's

cloud系

+ AppVeyor
+ CircleCI
+ Drone IO
+ Magnum CI
+ semaphore
+ shippable
+ Travis CI
+ wercker

install系

+ gitlab CI


# wercker

## basics

+ bitbucketでも使えるし、まだ無料だからこれを使って見ることにする。
+ dockerベースもできる
+ CLI
  + Running builds locally
    + localでもbuildできる
+ workflow
+ pipeline


## workflow

![wercker workflow](https://dl.dropboxusercontent.com/u/21522805/blog/cloudservice/wercker-workflow-local-dev-cloud.png)

+ [workflows introduction](http://devcenter.wercker.com/learn/workflows/introduction.html)
+ Defines the sequence of pipelines. Allows for branching (one pipeline completion results in the triggering of multiple pipelines), and limiting to a specific Git branch
  + pipelineたちのsequenceを定義
  + ブランチングができる
    + 意図つのpipllineが終わったら、他の複数のpipelineをtrggerできたり、
    + 特定git branchに限定することもできる

### workflowの例

![workflow_branch_deploy](https://dl.dropboxusercontent.com/u/21522805/blog/wercker/workflow_branch_deploy.png)

1. commitのよってbuildがtriggerされる
2. triggerしたbranchがdevelopmentであれば、developmentへdeploy
3. triggerしたbranchがmasterであれば、stagingへdeploy


## pipeline

+ The pipeline is the heart and soul of wercker
+ Build pipelines are triggered when new code is committed to your source control provider
+ Series of steps defined in your wercker.yml file. Can be kicked off by a commit to a specific branch, or on successful completion of another pipeline (via chaining)

## step

[Steps](http://devcenter.wercker.com/docs/steps/index.html)

Steps make up the wercker pipeline and can either be executed in the build or deploy phase within the pipeline.

+ npm installしたり
+ lintしたり
+ scriptやcommand実行したり
+ deployしたり

### script step

+ custom step
+ bash scriptで入れることができる
+ name, codeが必要

```
- script:
    name: echo python information
    code: |
      echo "python version $(python --version) running"
      echo "pip version $(pip --version) running"
```

### creating step

stepを作る前にscript stepで出来ないのか検討しよう。

<http://devcenter.wercker.com/docs/steps/creating-steps.html>

+ どんな言語でもできるがbashやgolangをおすすめしている

## Services

+ services can be databases, queue servers

# Docs

## environment variables

+ <http://devcenter.wercker.com/docs/environment-variables/index.html>
+ <http://devcenter.wercker.com/docs/environment-variables/creating-env-vars.html<

+ deployするときに必要なapi_key, passwordなど設定ができる
+ wercker.ymlの `$NAME`して wercker adminのApplication settings > Environment variablesで $を抜いた文字列で登録する


# やってみよう

## setting and build on wercker

+ accountを連動すると自動にsshkeyがbitbucketに入るようになっている
+ 修道で入れても大丈夫かな

1. applicationを作って
2. wercker.ymlを入れてpushする
 + wercker.ymlの簡単な設定はapplicationを作ったときにsnip codeをcopyできる
3. werckerでbuildされた


## deploy to s3

reference

+ http://devcenter.wercker.com/docs/deploy/s3.html

react appをs3へdeployしてみる

利用するのは [S3sync step](https://app.wercker.com/#applications/51c82a063179be4478002245/tab/details)

1. create deploy target on wercker web admin
2. update wercker.yml config
3. setting environment variables
  + s3 urlは aws cliの s3 syncで利用するURLを指定
    + `s3://bucket-name`
    + <http://docs.aws.amazon.com/cli/latest/userguide/using-s3-commands.html>

### s3側のsetting

1. bucketを作成
2. 静的ベージをhostingできるように設定
  + 静的ウェブサイトホスティング
    + インデックスドキュメン: index.html
    + エラードキュメント: 404.html


### 環境によってdeploy pathを変更したい

もし、環境によってs3のbuckerを分けるとしたら




## local build

First, need to install cli.



# References
