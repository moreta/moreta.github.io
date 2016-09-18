---
title: Dovecot with Postgresql
date: 2014-08-02
tags: dovecot, postgresql, mail
---

*参考*

* <http://wiki2.dovecot.org/HowTo>
* <http://wiki2.dovecot.org/HowTo/DovecotPostgresql>

*読んでみるべくリンク*

* <http://shirkerphp.blogspot.jp/2013/10/postfix-dovecot-postgresql-amavis.html>

## install

Debianだとこれだけ
`aptitude install postfix-pgsql sasl2-bin libsasl2-modules postgresql libpam-pgsql dovecot-pgsql dovecot-imapd dovecot-pop3d`

### CentOS

dovecot & postgresql support

`yum install dovecot dovecot-pgsql`

SASL

`yum install cyrus-sasl`

postfix

`yum install postfix`

postgres

`yum install postgresql`

#### postgresql

localhost(127.0.0.1)がpassword認証を許可するように

`host    all     all      127.0.0.1/32 password`

#####  db create

```
sudo su postgres
createdb mails
psql mails
```

##### create table & view

```
CREATE TABLE transport (
  domain VARCHAR(128) NOT NULL,
  transport VARCHAR(128) NOT NULL,
  PRIMARY KEY (domain)
);
CREATE TABLE users (
  userid VARCHAR(128) NOT NULL,
  password VARCHAR(128),
  realname VARCHAR(128),
  uid INTEGER NOT NULL,
  gid INTEGER NOT NULL,
  home VARCHAR(128),
  mail VARCHAR(255),
  PRIMARY KEY (userid)
);
CREATE TABLE virtual (
  address VARCHAR(255) NOT NULL,
  userid VARCHAR(255) NOT NULL,
  PRIMARY KEY (address)
);
create view postfix_mailboxes as
  select userid, home||'/' as mailbox from users
  union all
  select domain as userid, 'dummy' as mailbox from transport;
create view postfix_virtual as
  select userid, userid as address from users
  union all
  select userid, address from virtual;
```

##### db user for read, write

```
CREATE USER mailreader PASSWORD 'secret';
grant select on transport, users, virtual, postfix_mailboxes, postfix_virtual to mailreader;
create user mailwriter password 'secret';
grant select, insert, update, delete on transport, users, virtual, postfix_mailboxes, postfix_virtual to mailwriter;
```


##### test data

```
insert into transport (domain, transport) values ('domain.org', 'virtual:');
insert into transport (domain, transport) values ('foo.org', 'virtual:');
insert into users (userid, uid, gid, home) values ('user@domain.org', 1001, 1001, 'domain.org/mails/user');
insert into users (userid, uid, gid, home) values ('user2@domain.org', 1001, 1001, 'domain.org/mails/user2');
insert into users (userid, uid, gid, home) values ('user@foo.org', 1002, 1002, 'foo.org/mails/user');
insert into virtual (address, userid) values ('foo@foo.org', 'user@foo.org');
```

ここでは uidとgidをdomainことに分けている。
これは単純性とセキュリティを両方を取るための十分な設定である。
UIDとGIDは /etc/passwd and /etc/groupでは必要ない。

##### postfix

postfixがインストールされた時点で`transport` `virtual`のファイルがすでに存在する。
そのファイルを使ってもいいが、初期のファイルと区別するため、`*.cf`のファイルを指定するようにする

main.cf
```
myhostname = mail.example.com
mydomain = example.com
myorigin = $mydomain
inet_interfaces = all # メールを受け取るinterface指定 
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
mynetworks = 192.168.0.0/24, 127.0.0.0/8
relay_domains = # 空白にすることによって untrustedなネットワークに対してopen relayしなくなる
home_mailbox = Maildir/
smtpd_banner = $myhostname ESMTP unknown # 追加(メールサーバーソフト名の隠蔽化)
message_size_limit = 10485760 # 追加(受信メールサイズ制限 : 受信メールサイズを10MB=10*1024*1024に制限)

transport_maps = pgsql:/etc/postfix/transport.cf
virtual_uid_maps = pgsql:/etc/postfix/uids.cf
virtual_gid_maps = pgsql:/etc/postfix/gids.cf
virtual_mailbox_base = /home
virtual_mailbox_maps = pgsql:/etc/postfix/mailboxes.cf
virtual_maps = pgsql:/etc/postfix/virtual.cf
# mydestination = $mydomain, $myhostname # 上で定義したから
```

ここで`virtual_mailbox_base`を`/home`にしたのは、databaseに保存されるdirectoryのprefixを`/home`にするためで、実際にそのdirectoryが利用されるわけではない？

##### SASL

main.cf
```
smtpd_recipient_restrictions = permit_sasl_authenticated, permit_mynetworks, reject_unauth_destination
smtpd_sasl_auth_enable = yes
smtpd_sasl_security_options = noanonymous
smtpd_sasl_local_domain = domain.org
smtp_sasl_auth_enable = no
```

/etc/postfix/sasl/smtpd.conf

```
pwcheck_method: saslauthd
saslauthd_path: /etc/mux
```

##### そのほかtransport & virtual

/etc/postfix/transport.cf
```
user=mailreader
password=secret
dbname=mails
table=transport
select_field=transport
where_field=domain
hosts=localhost
```

/etc/postfix/uids.cf
```
user=mailreader
password=secret
dbname=mails
table=users
select_field=uid
where_field=userid
hosts=localhost
```

/etc/postfix/gids.cf
```
user=mailreader
password=secret
dbname=mails
table=users
select_field=gid
where_field=userid
hosts=localhost
```

/etc/postfix/mailboxes.cf
```
user=mailreader
password=secret
dbname=mails
table=postfix_mailboxes
select_field=mailbox
where_field=userid
hosts=localhost
```

/etc/postfix/virtual.cf:
```
user=mailreader
password=secret
dbname=mails
table=postfix_virtual
select_field=userid
where_field=address
hosts=localhost
```

#### Configuring SASL2

saslauthd経由でPAM認証をつかう。

SMTP process は chrootedで /var/spool/postfixなかで走る。
UNIX socketを経由し

/etc/default/saslauthd
```
START=yes
MECHANISMS=pam
PARAMS="-r -m /var/spool/postfix/etc"
```

Configure libpam-pgsql in /etc/pam_pgsql.conf:
```
database = mails
host = localhost
user = mailreader
password = secret
table = users
user_column = userid
pwd_column = password
#expired_column = acc_expired
#newtok_column = acc_new_pwreq
pw_type = crypt
#debug
```

/etc/pam.d/smtp:
```
auth        required    pam_pgsql.so
account     required    pam_pgsql.so
password    required    pam_pgsql.so
```

もう、やまた、私が必要なのはこれじゃないから、rubyで一から作る