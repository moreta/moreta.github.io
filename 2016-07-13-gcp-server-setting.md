---
title: GCP server setting
date: 2016-07-13
tags: GCP, google, cloud
---

# google cloud computeを使った時のrails サーバー設定

+ gcloudは利用していないversion
+ 参考とういかこのまま
  + <https://www.phusionpassenger.com/library/install/nginx/install/oss/rubygems_rvm/>
  + <https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html>


summary

## centos

<https://www.phusionpassenger.com/library/install/nginx/install/oss/el7/>


```
if ! rpm -q epel-release; then sudo yum install -y yum-utils \
http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm; fi
sudo yum-config-manager --enable epel

# Install various prerequisites
sudo yum install -y pygpgme curl

# Add our el7 YUM repository
sudo curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo

# Install Passenger Nginx
# gemからinstallする方法もあるが、いいかこれで
sudo yum install -y nginx passenger
```


## debian

あんまりおすすめしない。もろもろエラーがでる centosが安定感がある

```
# prepare
sudo apt-get update
sudo apt-get install -y curl gnupg build-essential
sudo apt-get install libpcre3 libpcre3-dev
sudo apt-get -y install curl-devel
sudo apt-get -y install wget
# Optional in case PCRE fails to download or if you get "The PCRE checksum could not be verified" during following passenger installation.
# sudo apt-get -y install pcre-devel
```

次はrvm

# ruby by rvm

+ One thing you should be aware of when using RVM, is that you should use rvmsudo instead of sudo when executing Ruby-related commands. This is because RVM works by manipulating environment variables. However, sudo nukes all environment variables for security reasons, which intereferes with RVM.
+ rvmを使うときには ruby関連commandは sudoの代わりにrvmsudoを使うこと


```
# install rvm
sudo gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm `whoami`

# On systems where sudo is configured with secure_path, the shell environment needs to be modified to set rvmsudo_secure_path=1. secure_path is set on most Linux systems, but not on OS X. The following command tries to autodetect whether it is necessary to install rvmsudo_secure_path=1, and only installs the environment variable if it is the code.
if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi

# install ruby
rvmsudo rvm install 2.2.5

# install bundler
gem install bundler --no-rdoc --no-ri
```

# passenger

[passenger fundamental concepts](https://www.phusionpassenger.com/library/walkthroughs/basics/ruby/fundamental_concepts.html)

## enable the Passenger Nginx module and restart Nginx

`/etc/nginx/conf.d/passenger.conf`

```
passenger_root /usr/share/ruby/vendor_ruby/phusion_passenger/locations.ini;
#passenger_ruby /usr/bin/ruby;
passenger_ruby /usr/local/rvm/rubies/ruby-2.2.5/bin/ruby;
passenger_instance_registry_dir /var/run/passenger-instreg;
```

## restart nginx

```
sudo service nginx restart
```

## check installation

```
sudo /usr/bin/passenger-config validate-install
```

## passengerのprocess確認

```
sudo /usr/sbin/passenger-memory-stats
```

## passengerのmemory

1025mがいいみたい
```
sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap
```

## setting


```
http {
    ...
    passenger_root /home/appuser/.rvm/gems/ruby-2.2.5/gems/passenger-5.0.29;
    passenger_ruby /home/appuser/.rvm/gems/ruby-2.2.5/wrappers/ruby;
    ...
}
```

# node by nvm

```
# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install 確認
# which nvmが聞かないことに注意
command -v nvm
```

# postgresql install

# mongodb install

# rails app deploy

create user
```
sudo adduser appuser
```

ensure that user has SSH key
```
sudo mkdir -p ~appuser/.ssh
touch $HOME/.ssh/authorized_keys
sudo sh -c "cat $HOME/.ssh/authorized_keys >> ~appuser/.ssh/authorized_keys"
sudo chown -R appuser: ~appuser/.ssh
sudo chmod 700 ~appuser/.ssh
sudo sh -c "chmod 600 ~appuser/.ssh/*"
```

## appを配置する場所をきめる

/var/www/APP_NAMEがいい

```
sudo mkdir -p /var/www/myapp
sudo chown myappuser: /var/www/myapp
```

## capistrano


```
bundle exec cap install STAGES=staging,production
```
