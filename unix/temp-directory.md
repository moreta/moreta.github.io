Unix temp directory
===================

# /tmpと/var/tmpの違い


/tmp | /var/tmp 
--|--
再起動時にファイルが削除される | 再起動しても消えない
10日間アクセスが無い場合削除 | 30日間アクセスが無い場合削除

## `tmpwatch`で確認ができる


```sh
$ cat /etc/cron.daily/tmpwatch
#! /bin/sh
flags=-umc
/usr/sbin/tmpwatch "$flags" -x /tmp/.X11-unix -x /tmp/.XIM-unix \
        -x /tmp/.font-unix -x /tmp/.ICE-unix -x /tmp/.Test-unix \
        -X '/tmp/hsperfdata_*' 10d /tmp
/usr/sbin/tmpwatch "$flags" 30d /var/tmp
for d in /var/{cache/man,catman}/{cat?,X11R6/cat?,local/cat?}; do
    if [ -d "$d" ]; then
        /usr/sbin/tmpwatch "$flags" -f 30d "$d"
    fi
done
```

## 使い分け

+ `/tmp`は「見返すことのない、ファイル名も適当で良いような一時ファイル」
+ `/var/tmp`は「また参照するかもしれない、ファイル名がある一時ファイル(sqlのdumpなど)」


# References

[Tmpディレクトリの活用法について改めて考える](http://www.rickynews.com/blog/2014/09/20/importance-of-temporary-directories/)
