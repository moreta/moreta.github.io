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
