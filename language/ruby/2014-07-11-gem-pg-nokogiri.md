---
title: Postgresql gemと DYLD_LIBRARY_PATH
date: 2014-07-11
tags: postgresql, gem, nokogiri
---

Enterprise PostgresでPostgresqlをインストール後、
既存のpostgresqlを削除したらエラーがでる

`gem install pg`

```
export PG_HOME=/Library/PostgreSQL/9.3
#export DYLD_LIBRARY_PATH=${PG_HOME}/lib:$DYLD_LIBRARY_PATH
export PATH=${PG_HOME}/bin:${PATH}
```

`export DYLD_LIBRARY_PATH=${PG_HOME}/lib:$DYLD_LIBRARY_PATH`これを追加すると

gem install pgは大丈夫だが、実際にrailsが起動するときにエラーになる

なので`export DYLD_LIBRARY_PATH`この設定は外して以下のsymbolic linkをつけて解決

`sudo ln -s /Library/PostgreSQL/9.3/lib/libpq.5.dylib /usr/lib/libpq.5.dylib`
