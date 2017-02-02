rename
============

# example

##  拡張子 .htm を.html に変更する


```
rename 's/.htm/.html/' *.htm
```

## 先頭に文字「20070610-」を加える

```
rename 's/^/20070610-/' *
```

## 上の2007を2008に変更する

```
rename 's/2007/2008/' *
```

## ファイル名を全部小文字に変更する

```
rename 'y/A-Z/a-z/' *     または     $ rename 'tr/A-Z/a-z/' *
```

# References

+ [UbuntuTips/FileHandling/RenameCommand](https://wiki.ubuntulinux.jp/UbuntuTips/FileHandling/RenameCommand)
