AWS Auto Scaling下での deploy
============================


# User Dataを利用

ながれ

+ instanceの起動のときにuser dataがkickされる (launch config)の設定
+ User Data からshellを呼び出す
+ shellでgit source checkoutする
+ checkoutしたソースにはcapistrano設定があって localでcapistranoでdeployを行う

## Auto Scaling で User Data を実行するには、> launch config

**launch config** の作成時に指定が必要
以下は、aws cli を使って指定する例になります。

```
$ aws autoscaling create-launch-configuration \
> --launch-configuration-name "my-lc" \
> --image-id "ami-xxxxxxxx" \
> --user-data "/path/to/user-data.txt" \
> --instance-type "t2.micro"
```

## User Data からシェルを呼び出す


# References

+ [google search](https://www.google.co.jp/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=aws+autoscaling+deploy)
+ [オートスケール時のデプロイを User Data と Capistrano を使って行う（BootStrap パターン）](http://dev.classmethod.jp/cloud/auto-scaling-deploy-userdata-capistrano/)
  + ようはlocalhostで capistranoでdeployする(外部からではない)
