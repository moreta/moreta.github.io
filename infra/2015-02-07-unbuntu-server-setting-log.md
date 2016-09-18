---
title: unbuntu server setting
date: 2015-02-07
tags: server, ubuntu
---



## server

ubuntu

## install

```
apt-get install emacs
apt-get install libcurl4-openssl-dev # for nginx install

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable --ruby

rvm gemset create app
rvm gemset create server
rvm use ruby-2.2.0@app --default


rvm use ruby-2.2.0@server
gem install passenger -v 5.0.0.beta2 # Raptorを使うため

passenger-install-nginx-module

# もう一度
export ORIG_PATH="$PATH"
rvmsudo -E /bin/bash
export PATH="$ORIG_PATH"
/home/xxxx/.rvm/gems/ruby-2.2.0@server/wrappers/ruby /home/xxxx/.rvm/gems/ruby-2.2.0@server/gems/passenger-5.0.0.beta2/bin/passenger-install-nginx-module

emacs /opt/nginx/conf/nginx.conf

```

## GIT

```
sudo apt-get install git
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -C "YOUR@EMAIL.com"
```

## postgres

参考 : <https://gorails.com/setup/ubuntu/14.10>

```
sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql # At the time 2015-02-11 9.4 installed
sudo apt-get install libpq-dev # for ruby gem (gem install pg)
```
The postgres installation doesn't setup a user for you, so you'll need to follow these steps to create a user with permission to create databases. Feel free to replace chris with your username.

```
sudo -u postgres createuser username -s

# If you would like to set a password for the user, you can do the following
sudo -u postgres psql
postgres=# \password username
```


### psql: FATAL:  Peer authentication failed for user "leinbow"

`cd /etc/postgresql/9.4/main`

```
emacs pg_hba.conf

# Database administrative login by Unix domain socket
#local   all             postgres                                peer
local   all             postgres                                md5
```

`sudo /etc/init.d/postgresql restart`