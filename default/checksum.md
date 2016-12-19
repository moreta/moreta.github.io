check sum
===========================

# check sumとは

チェックサムとは、データを送受信する際の誤り検出方法の一つ。
送信前にデータを分割し、それぞれのブロック内のデータを数値とみなして合計を取ったもの。求めたチェックサムはデータと一緒に送信する。
受信側では送られてきたデータ列から同様にチェックサムを計算し、送信側から送られてきたチェックサムと一致するかどうかを検査する。
両者が異なれば、通信系路上でデータに誤りが生じていることになるので、再送などの誤り訂正手続きをとる。


# check sumの確認方法

## SHA-1

`shasum [file path]``
```
$shasum test_file.txt
407fe935d942b3d14c85bf12415a37ce46b19c51  test_file.txt
```

or

`openssl sha1 [file path]`
```sh
$/usr/sbin/openssl sha1 test_file.txt
SHA1(test_file.txt)= 407fe935d942b3d14c85bf12415a37ce46b19c51
```


## MD5

```sh
$ /usr/bin/openssl md5 test_file.txt
MD5 (test_file.txt) = 6cf0f4ff7f11ad2d78058541831c4bcc
```

or
```sh
md5sum  foo.oso
```


# Reference link

+ <http://osxdaily.com/2012/02/05/check-sha1-checksum-in-mac-os-x/>
