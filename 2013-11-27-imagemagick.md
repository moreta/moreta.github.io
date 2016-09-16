---
title: "image magick"
date: 2013-11-27
tags: aws, centos, imagemagick
---


# 基本的にCentOS系列なら以下で十分
``` sh
yum install ImageMagick
yum install ImageMagick-devel
```

# もうちょっと必要な場合

#### imagemagicに必要なライブラリを全部インストールしておく場合

``` sh
yum -y install gcc
yum -y install gcc-c++
yum -y install bzip2-devel
yum -y install freetype-devel
yum -y install libjpeg-devel
yum -y install libpng-devel
yum -y install libtiff-devel
yum -y install giflib-devel
yum -y install zlib-develperl-devel
yum -y install ghostscript-devel
yum -y install libwmf-devel
yum -y install libtool-ltdl-devel
yum -y install libX11-devel
yum -y install libXext-devel
yum -y install libXt-devel
yum -y install lcms-devel
yum -y install libxml2-devel
```

libxml2 is missing

#### yum installでimagemagickの依頼性あるライブラリをインストールする。

``` sh
yum install ImageMagick
yum install ImageMagick-devel
```

# 削除

``` sh
yum remove ImageMagick
yum remove ImageMagick-devel
```

# 参考
<http://forum.directadmin.com/showthread.php?t=44449&page=1>
<http://blog.fkei.me/2012/06/awsamazon-linux-201203imagemagickpython.html>
<http://akkunchoi.github.com/imagemagick-rmagick-centos.html>
