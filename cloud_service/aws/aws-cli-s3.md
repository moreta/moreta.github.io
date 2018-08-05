AWS CLI
==============


+ AWS CLI は Amazon Linux AMI にプレインストールされています。
  + Amazon Linuxを使う場合にはわざわざinstallする必要がない

# Install

## Amazon Linux

なにもする必要ない

## Linux

```sh
pip install awscli
```

## macOS

* pipを利用する
* pipがない場合、pyenvでpythonをinstallし、pipをinstallする

```sh
pip install awscli
```

# Setup & Config

cliが利用できるアクセスtoken情報を入力

```sh
aws configure --profile=PROFILE_NAME
> AWS Access Key ID [None]: myaccesskey
> AWS Secret Access Key [None]: mysecretkey
> Default region name [None]: ap-northeast-1
> Default output format [None]: json
```

これで入力した情報はいかに保存される

`~/.aws/credentials`

```sh
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

`~/.aws/config`

```sh
[default]
region=ap-northeast-1
output=json
```

## 複数のaccountを使う方法

上にもあるが`profile`を指定することで切り替えられる。

# Commands examples

## s3関連

<http://docs.aws.amazon.com/cli/latest/reference/s3/index.html#cli-aws-s3t/reference/s3/sync.html>

### bucket 一覧

```sh
# S3のバケット一覧出力
aws s3 ls
aws s3 ls --profile=PROFILE_NAME
```
### file list in bucket

ls commandを利用
[ls](http://docs.aws.amazon.com/cli/latest/reference/s3/ls.html)

```sh
aws s3 ls s3://mybucket
aws s3 ls s3://mybucket/somePrefix
aws s3 ls s3://mybucket --recursive --human-readable --summarize #読みやすく
```

### file download

+ <http://docs.aws.amazon.com/cli/latest/reference/s3/cp.html>
+ 基本的にはcp command

#### Recursively copying S3 object to local

```
aws s3 cp s3://mybucket . --recursive
```

#### Copying an S3 object to a local file

```
aws s3 cp s3://mybucket/test.txt test2.txt
```

### file upload

* cpを利用
* syncを利用
* mvを利用

の方法がある

```sh
# ファイルを個別にアップロード
aws s3 cp sample.txt s3://mybucketname/ --acl public-read --profile=PROFILE_NAME

# ファイルをまとめてアップロード
aws s3 sync . s3://mybucketname/ --include "*" --acl public-read --cache-control "max-age=3600" --profile=PROFILE_NAME

# HTMLファイルをまとめてアップロード
aws s3 sync . s3://mybucketname/ --exclude "*" --include "*.html" --acl public-read --cache-control "max-age=3600" --profile=PROFILE_NAME

# gzip圧縮したhtml,js,cssをアップロード
aws s3 sync ./build s3://mybucketname/DIRECTORY_NAME/ --exclude "*" --include "*.js"\
  --acl public-read --cache-control "max-age=600" --content-type "application/javascript"\
  --content-encoding "gzip" --profile PROFILE_NAME
aws s3 sync ./build s3://mybucketname/DIRECTORY_NAME/ --exclude "*" --include "*.css"\
  --acl public-read --cache-control "max-age=600" --content-type "text/css"\
  --content-encoding "gzip" --profile PROFILE_NAME
aws s3 sync ./build s3://mybucketname/DIRECTORY_NAME/ --exclude "*" --include "*.html"\
  --acl public-read --cache-control "max-age=300" --content-type "text/html"\
  --content-encoding "gzip" --profile PROFILE_NAME
```


# References

+ [AWS CLI](https://aws.amazon.com/jp/cli/)
+ [Configuring the AWS Command Line Interface](http://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-chap-getting-started.html)
+ [AWS CLI で S3 にファイルをアップロード](http://qiita.com/seyself/items/43426f57c50021ea55f8)
