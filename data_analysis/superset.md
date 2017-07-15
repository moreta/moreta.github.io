

# Install

必要によって `pip`を `pip3`で実行する

```sh
# Install superset
pip install superset
# or
pip3.6 install superset
```

```sh
# Create an admin user (you will be prompted to set username, first and last name before setting a password)
fabmanager create-admin --app superset

# Username [admin]: superset
# User first name [admin]: super
# User last name [user]: set
# Email [admin@fab.org]: xxx@eee.com
# Password:
# Repeat for confirmation:
```

```sh
# Initialize the database
superset db upgrade

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

# Start the web server on port 8088, use -p to bind to another port
superset runserver

# To start a development web server, use the -d switch
# superset runserver -d
```

## for oracle

oracleに接続するためには cx_Oracleが必要
<https://superset.incubator.apache.org/installation.html?highlight=oracle#database-dependencies>

oracle環境変数設定

```sh
# bash shell
# oracle
export ORACLE_HOME=/your_oracle_path/Oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/your_oracle_path/Oracle/instantclient_11_2
export TNS_ADMIN=/your_oracle_path/Oracle/instantclient_11_2/network/admin
export PATH=$PATH:/your_oracle_path/Oracle/instantclient_11_2
export CLASSPATH=$CLASSPATH:$ORACLE_HOME
export NLS_LANG=JAPANESE_JAPAN.AL32UTF8

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

# fish shell
# oracle
set -x ORACLE_HOME /your_oracle_path/Oracle/instantclient_11_2
set -x DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH:/your_oracle_path/Oracle/instantclient_11_2
set -x TNS_ADMIN /your_oracle_path/Oracle/instantclient_11_2/network/admin
set -x PATH $PATH /your_oracle_path/Oracle/instantclient_11_2
set -x CLASSPATH $CLASSPATH $ORACLE_HOME
set -x NLS_LANG JAPANESE_JAPAN.AL32UTF8

set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH $ORACLE_HOME
```

install cx_Oralce
```sh
pip install cx_Oracle
```

