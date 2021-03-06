SSH
=======

# 鍵作成

```
ssh-keygen -t rsa
```
ssh keyを生成するときには idをしていするのがいい

```
ssh-keygen -t rsa -C "ここのテキストは.pubに入る"

Generating public/private rsa key pair.
Enter file in which to save the key (~/.ssh/id_rsa): id_rsa_your_id
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in id_rsa_your_id.
Your public key has been saved in id_rsa_your_id.pub.
The key fingerprint is:
```

# config

## keyの指定

```
Host host1.xxx
    User ssh_user
    IdentityFile ~/.ssh/xxx_rsa
Host host1.xxx host2.xxx
    User ssh_user
    IdentityFile ~/.ssh/xxx_rsa
```

# 接続


port指定
```
ssh root@sv10.sixcore.ne.jp -p 2222
```

# 多段ssh


![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/2014-06-16/ssh-connection.png)

* 踏み台マシンを経由する必要がある
* 踏み台マシンへのログインすら、特定範囲のIPアドレスからしか受け付けてくれない

の時に踏み台サーバに接続が面倒なので
多段sshを使う

```
host gateway
   HostName sshgate.hoge
   User hoge

Host RemoteHost-out
  HostName RemoteHost
  User fuga
  ProxyCommand ssh -W %h:%p gateway
```
以下のcommandで接続
`ssh RemoteHost-out `

## ProxyCommand

netcat

`ProxyCommand ssh server nc %h %p`

ssh -W

`ProxyCommand ssh -W %h:%p server`

# agent forwarding

* <http://blog.blenderbox.com/2013/02/20/ssh-agent-forwarding-with-github/>
* <https://help.github.com/articles/using-ssh-agent-forwarding>
* <http://www.unixwiz.net/techtips/ssh-agent-forwarding.html>

## agent forwarding setting

`~/.ssh/config`に

```
Host *example.com
  ForwardAgent yes
```

# ssh loginの自動化

```sh
#!/bin/sh

PW="Password"

expect -c "
set timeout 5
spawn env LANG=C /usr/bin/ssh hoge@ServerName
expect \"password:\"
send \"${PW}\n\"
expect \"$\"
exit 0
"
```

# TODO

このリンクもうちょっと整理
* <http://qiita.com/ik-fib/items/12e4fab4478e360a82a1>
* <http://qiita.com/yudoufu/items/82f752807893c63f06db>

* agent-forwardについても整理


# login際にpassword省略

`authorized_keys`にpubキーの内容を入れる

```
chmod 700 .ssh
chmod 600 .ssh/*
```


# References

+ [Linuxの対話がめんどくさい?そんな時こそ自動化だ！-expect編-](http://qiita.com/ine1127/items/cd6bc91174635016db9b)
* <http://www.xmisao.com/2013/10/08/ssh-proxy-command.html>
* <http://qiita.com/ik-fib/items/12e4fab4478e360a82a1>
* <http://d.hatena.ne.jp/tkng/20110225/1298596697>
