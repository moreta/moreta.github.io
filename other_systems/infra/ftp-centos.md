  FTP & FTPS on CentOS
=====================

これよくない

[pyftpdlib](https://github.com/giampaolo/pyftpdlib)をつかおう

```
sudo easy_install pyftpdlib
nohup python -m pyftpdlib > pyftpdlib.log  2>&1 &
```

# 0. FTPS (File Transfer Protocol over SSL/TLS) を使う場合にはopensslで発行

```sh
sudo mkdir /etc/ssl/private # or your SSL directory
sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/pki/tls/certs/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
sudo openssl req -x509 -nodes -newkey rsa:2048 -days 365 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem # 有効期限を設定する場合
```


# vsftpdでの instal


# files

## user_list

+ vsftpd.confのuserlist_enableがYESになっている時のデフォルトファイル。
+ このファイルからrootをコメントアウトしてvsftpdを再起動してみたもののrootでは接続できない。ちなみにこのファイルに記述されているユーザでFTP接続をすると、ユーザ名を入れた後、即失敗する。コメントアウトしたユーザはパスワードまでは聞かれるが正しいパスワードを入力しても失敗する。

## ftpusers

+ このファイルに記述されているユーザは接続できない。user_listよりも優先されるとのこと。
+ ここからもrootをコメントアウトしてvsftpdを再起動して接続してみたところ、rootユーザでも接続が可能となった。

# port_range

+ 21 : 制御
+ 20 : データ転送




# 1. vstpd install

```sh
sudo yum update openssl # opensslを最新に
sudo yum install vsftpd
```

# 2. config after install

```sh
sudo emacs /etc/vsftpd/vsftpd.conf
```

```sh
# NOに変更 anonymousユーザーを無効にします
# これをNOにするときにはlocal_enable=YESにしてlinux system userをつかう
anonymous_enable=NO


# コメントアウト　デフォルト（077）にして他のユーザーの読取を拒否
#local_umask=022

# アンコメント ASCIIモードを有効にします
ascii_upload_enable=YES
ascii_download_enable=YES

# コメントアウト（vsftpdデフォルトの077マスクで、ownerのみアクセスに）
# テストでの利用する場合には コメントアウトしなくてもいいかな
#local_umask=022

# chrootを有効にして、homeディレクトリをルートにします。
# アンコメント
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd/chroot_list

# ipv6,v4両方Listenします
listen=YES
listen_ipv6=YES

# 追記  ※私はよくwritableと間違ってしまいます。writeableです。
allow_writeable_chroot=YES

# 追記　フォルダごといけるようにします
ls_recurse_enable=YES

# ここからSSL設定を追記
# SSLを有効化
ssl_enable=YES
ssl_ciphers=HIGH
# 証明書の場所を指定します
rsa_cert_file=/etc/ssl/private/vsftpd.pem
# POODLEの件もあるので明示的にNO
ssl_sslv2=NO
ssl_sslv3=NO
# TLSを使います (This is more secure than SSL)
ssl_tlsv1=YES
# ノンセキュアなFTPは使用させず、SSLを強制
force_local_data_ssl=YES
force_local_logins_ssl=YES

# ここからパッシブの設定を追記
pasv_address=公開しているホスト名
pasv_enable=YES

# PASVで使うポートの下限と上限を設定します。
# エフェメラルポートの範囲内です。setctlでport_rangeで変更していないか確認してください。
# $ sudo grep ip_local_port_range /etc/sysctl.conf
# デフォルト（設定なし）では32768〜61000
pasv_min_port=50021
pasv_max_port=50040
```
## check

+ pasvはなんだろう。。

## 最低限の設定

```

```

# 2.1 Create an FTP User

```
sudo adduser ftpuser
sudo passwd ftpuser
```


# 3. service 起動

```
sudo systemctl enable vsftpd
sudo systemctl stop vsftpd
sudo systemctl start vsftpd
sudo systemctl restart vsftpd
sudo systemctl status vsftpd

netstat -lt | grep ftp
LISTEN     0      32                     :::ftp                     :::*
```
# 4. Firewallでftpポート開放

??

# 動作確認

```

```


# References

+ [CentOSでftpsをセットアップ(vsftpd)](http://qiita.com/egnr-in-6matroom/items/38392a6509d4d0575927)
+ [DigitalOcean - How To Configure vsftpd to Use SSL/TLS on a CentOS VPS](https://www.digitalocean.com/community/tutorials/how-to-configure-vsftpd-to-use-ssl-tls-on-a-centos-vps)
