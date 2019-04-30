Homebrew Formulas (Mac Brew Packages)
===================


# Recommand Formulas : 入れて置くべき

+ ccat
  + syntax color with cat
+ tree
  + tree view ls
+ jq
  + json parser cli
+ rename
  + file rename
+ pgcli
  + postgresql cli
+ pstree
  + psをtreeで見せる

## rename - file rename Util

<http://plasmasturm.org/code/rename/>

```sh
rename -nvs searchword replaceword *
```

```sh
# .bakの拡張子を削除
## -x/--remove-extension を利用
rename -x *.bak
rename 's/\.bak\z//' *
## -s/--subst from to を利用
rename -s .bak '' *
rename -s .tgz .tar.gz -s .tbz2 .tar.bz2 *.t?z* # 複数を変換

# numberingをして名前を変換
## -N/--counter-format
## -X/--keep-extension
## -e/--expr=code
rename -N ...01 -X -e '$_ = "File-$N"' * # This will throw away all the existing filenames and simply number the files from 1 through however many files there are – except that it will preserve their extensions
```

## Pgcli - Postgresql Console Util


```sh
pgcli -h localhost -U postgres db_name
```

## pstree

```sh
pstree
-+= 00001 root /sbin/launchd
 |--= 00010 root /usr/libexec/kextd
 |--= 00011 root /usr/libexec/UserEventAgent -l System
 |--= 00012 _mdnsresponder /usr/sbin/mDNSResponder -launchd
 |--= 00013 root /usr/libexec/opendirectoryd
 |--= 00014 root /usr/sbin/notifyd
 |--= 00015 root /usr/sbin/diskarbitrationd
 |--= 00016 root /usr/libexec/configd
 |--= 00017 root /usr/sbin/syslogd
```