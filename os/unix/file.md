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


# tar

### 解凍

```sh
tar xvf arch.tar
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
