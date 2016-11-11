---
title: unix user
date: 2014-09-23
tags: unix, user
---


# file

+ /etc/passwd - ユーザアカウント情報
+ /etc/shadow - 安全なユーザアカウント情報
+ /etc/group  - グループ情報

## ユーザーリスト

```sh
cat /etc/passwd
```

# パスワード変更 - passwd

```sh
passwd app
```

# usermod

<http://itpro.nikkeibp.co.jp/article/COLUMN/20060228/230982/>

# user list


```sh
cat /etc/passwd
```

# user delete

```sh
userdel user-name
```

# group関連

```sh
usermod -aG docker your_username
```
