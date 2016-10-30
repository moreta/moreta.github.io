


# ベースインスタンスの作成

+ ステージング環境として利用する
+ ミドルウェアアップデートに利用する
+ ベースインスタンスはReboot時に動作可能な状態とする
+ 固定Private IPを避ける
+ Public IPは動的に割り当てる
+ ログをCloudWatch logsで回収する

# deploy

+ ツールはrsyncやcapistranoなどなんでもいい
  + サーバ数が多く変わることが多いならprivateを取得して、deployする。


タグに「Role=Web」「Environment=Production」が設定されているEC2インスタンスのPrivate IPを取得し処理を実行するシェルスクリプトです。

```
ipAddresses=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Role,Values=web"  "Name=tag:Environment,Values=Production" | jq -r '.Reservations[].Instances[].PrivateIpAddress')

for ip in $ipAddresses; do
  if [ $ip != "null" ]; then
    echo "$ip"
  fi
done
```

# wercker ciを利用してdeloy

[Deploying to Amazon EC2 Container Service with Wercker](http://blog.wercker.com/2015/10/02/Deploying-to-ECS-with-Wercker.html)

# References

+ [EC2複数台構成時の構築とデプロイ](http://dev.classmethod.jp/cloud/aws/deployment-to-ec2-instances/)
