UNIX file commands
=================

# zip

## Switch into the website folder, then run

```sh
zip -R foo '*.php' '*.html' '*.js' '*.css'
```

## You can also run this from outside the website folder:

```sh
zip -r foo website_folder -i '*.php' '*.html' '*.js' '*.css'
```


# .tar & .tar.gz & .tgz

+ tar : 圧縮
+ tar.gz : tarコマンドでまとめたアーカイブファイルを「gzip」コマンドで圧縮した圧縮ファイルに付く拡張子
  + tar > gzipの順
+ tgz : tarコマンドで tar + gzipをいっぺんにしたもの
  + tar + gzip

### 解凍

```sh
tar xvf arch.tar
tar zxvf arch.tar.gz
tar zxvf arch.tgz
```

### 圧縮


The following creates a new archive called file.tar.gz that contains two files source.c and source.h:

```sh
tar -czf file.tar.gz source.c source.h
```

To view a detailed table of contents for this archive:

```sh
tar -tvf file.tar.gz
```

To examine the contents of an ISO 9660 cdrom image:

```sh
tar -tf image.iso
```

#### folder 圧縮 と 解凍

compress 

```
tar -zcvf archive-name.tar.gz directory-name
```

+ -z : Compress archive using gzip program
+ -c: Create archive
+ -v: Verbose i.e display progress while creating archive
+ -f: Archive File name


extract 

```
tar -zxvf prog-1-jan-2005.tar.gz
```