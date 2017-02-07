AWS Cognito
============

# Pricing

+ <https://aws.amazon.com/jp/cognito/pricing/>
+ 月間アクティブユーザー(MAU)単位

# User Pool作成

+ ユーザーの作成
+ ユーザーのと管理
+ グループへのユーザーの追加
+ グループからのユーザーの削除

## Arrtibutes

注意

+ 一度作ったらattributesは変更できない
  +  例えば update_atを必須にすると管理画面で登録ができなくなる。。。（汗）

### alias

+ User Poolは defaultで一意なUserId

# ユーザープールデバイス追跡設定の指定

<http://docs.aws.amazon.com/ja_jp/cognito/latest/developerguide/amazon-cognito-user-pools-device-tracking.html>

セキュリティの強化方法として、ユーザーのログインしているdeviceの追跡ができる

## device記憶設定

+ No (デフォルト) – デバイスは記憶されません。
+ Always – アプリケーションのユーザーにより使用されるすべてのデバイスが記憶されます。
+ User Opt-In – ユーザーがデバイスの記憶を選択した場合のみ、ユーザーのデバイスが記憶されます。

# User Group

+ グループと **Amazon API Gateway** を使用したアクセス権限の管理がGroup単位でできる
+ ユーザーがメンバーであるグループは、ユーザーがサインインするときにユーザープールによって提供される ID トークンに含まれています

# User Import

+ csvでできる
+ passwordは Import
  + つまり、最初のログインでpasswordを設定する必要がある

# cliでユーザー登録

```sh
aws cognito-idp sign-up --client-id ＜作成したClientId＞ --username user01 --password 00000000 --user-attributes Name=email,Value=＜任意のEmailアドレス＞
aws cognito-idp admin-confirm-sign-up --user-pool-id ＜作成したPoolId＞ --username user01
```

# SDK

## Javascript SDK

<http://docs.aws.amazon.com/ja_jp/cognito/latest/developerguide/setting-up-the-javascript-sdk.html>


# Signup & Login

## Signup

<http://dev.classmethod.jp/cloud/aws/singup-to-cognito-userpools-using-javascript/>

JavaScript実行時に必要なのは次の情報です。

+ リージョン: us-east-1 （現在はVirgnia固定）
+ UserPoolId: UserPool作成後にPool Details画面で確認できます。us-east-1_で始まるIDです。
+ ClientId: UserPoolにAppsを登録するとApp client idとして確認できます。なおAppsを作るときにGenerate client secretのチェックはオフにしてください。


## Login

<http://dev.classmethod.jp/cloud/aws/login-form-by-using-aws-sdk-for-javascript/>