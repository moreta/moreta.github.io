---
title: Graph with ruby
date: 2014-06-07
tags: graph, ruby
---



# mac gnuplot install

2014-06-07 実行

```
brew install gnuplot

==> Installing dependencies for gnuplot: lua, libpng, gd
==> Installing gnuplot dependency: lua
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/lua-5.1.5.mavericks.bottle.tar.gz
######################################################################## 100.0%
==> Pouring lua-5.1.5.mavericks.bottle.tar.gz
🍺  /usr/local/Cellar/lua/5.1.5: 15 files, 276K
==> Installing gnuplot dependency: libpng
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/libpng-1.6.10.mavericks.bottle.tar.gz
######################################################################## 100.0%
==> Pouring libpng-1.6.10.mavericks.bottle.tar.gz
🍺  /usr/local/Cellar/libpng/1.6.10: 17 files, 1.3M
==> Installing gnuplot dependency: gd
==> Downloading https://downloads.sf.net/project/machomebrew/Bottles/gd-2.1.0_1.mavericks.bottle.tar.gz
######################################################################## 100.0%
==> Pouring gd-2.1.0_1.mavericks.bottle.tar.gz
🍺  /usr/local/Cellar/gd/2.1.0_1: 32 files, 1.1M
==> Installing gnuplot
==> Downloading https://downloads.sourceforge.net/project/gnuplot/gnuplot/4.6.5/gnuplot-4.6.5.tar.gz
######################################################################## 100.0%
==> ./configure --prefix=/usr/local/Cellar/gnuplot/4.6.5 --with-readline=/usr/local/opt/readline --with-gd=/usr/local/opt/gd --disable-wxwidgets --without-cairo --with-aquaterm --without-latex --without-tutorial
==> make
  ==> make install
==> Caveats
AquaTerm support will only be built into Gnuplot if the standard AquaTerm
package from SourceForge has already been installed onto your system.
If you subsequently remove AquaTerm, you will need to uninstall and then
reinstall Gnuplot.
==> Summary
🍺  /usr/local/Cellar/gnuplot/4.6.5: 47 files, 4.3M, built in 48 seconds

```

特にエラーなし


# gem install

`gem install gnuplot`


# sample code

```
# -*- coding: utf-8 -*-
require "gnuplot"
 
Gnuplot.open do |gp|
  Gnuplot::Plot.new( gp ) do |plot|
    plot.title  'test'
    plot.ylabel 'ylabel'
    plot.xlabel 'xlabel'
 
    x = (-100..100).collect {|v| v.to_f}
    y = (-100..100).collect {|v| v.to_f ** 2}
 
    plot.data << Gnuplot::DataSet.new( [x, y] ) do |ds|
      ds.with = "lines"
      ds.notitle
    end
  end
end
```

# 参考

* <http://www.gnuplot.info/>
* <http://rakkyoo.net/?p=631>