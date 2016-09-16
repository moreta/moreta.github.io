---
title: Oracle SQLcl
date: 2016-06-02
tags: oracle, sql, sqldeveloper
---


# SQLcl調査

  + SQLDeveloperの cli版
  + 新しいSQLDeveloperにはSQLclが入っている
  + SQLclだけinstallもできる
  + <http://yskwkzhr.blogspot.jp/2015/12/trying-out-a-cool-java-implementation-of-sqlplus.html#ddl>

# sqlcl path

```
cd /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper/bin
sudo chmod +x sql
```

# 環境変数設定

fish shell

```
# sqlcl
set -x SQLCL_HOME /Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper
set -x PATH $SQLCL_HOME/bin $PATH
```

bash

```
# oracle sqlcl(sqldeveloper)
export SQLCL_HOME="/Applications/SQLDeveloper.app/Contents/Resources/sqldeveloper/sqldeveloper"
export PATH="$SQLCL_HOME/bin:$PATH"
```
