---
title: "rails passenger & nginx & capistrano"
date: 2013-11-22
tags: rails, deploy, capistrano, passenger, nginx, rvm
---

# before install

```
yum install emacs
yum install -y git gcc-c++ autoconf automake make patch
yum install -y bzip2 readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel iconv-devel
yum install -y curl-devel

# for postgresql
yum install -y postgresql-devel sqlite-devel
```

# rvm install

``` sh
rvm get stable
rvm list known
rvm install ruby-2.0.0-p353
# or
rvm upgrade ruby-2.0.0-p247 ruby-2.0.0-p353  #upgradの場合
```

# user add

``` sh
groupadd -g 10000 app
adduser  -u 10000 app -g app -G app
id -a app
su app
cd
mkdir .ssh
chmod 700 .ssh
cp copy_key_from copy_key_to
chown app:app copy_key
chmod 600 copy_key
```


# passenger & nginx

## passenger & nginx install

``` sh
gem install passenger
passenger-install-nginx-module
emacs /opt/nginx/conf/nginx.conf
```


```
The Nginx configuration file (/opt/nginx/conf/nginx.conf)
must contain the correct configuration options in order for Phusion Passenger
to function correctly.

This installer has already modified the configuration file for you! The
following configuration snippet was inserted:

  http {
      ...
      passenger_root /usr/local/rvm/gems/ruby-2.0.0-p353/gems/passenger-4.0.25;
      passenger_ruby /usr/local/rvm/wrappers/ruby-2.0.0-p353/ruby;
      ...
  }

After you start Nginx, you are ready to deploy any number of Ruby on Rails
applications on Nginx.

Press ENTER to continue.

--------------------------------------------

Deploying a Ruby on Rails application: an example

Suppose you have a Ruby on Rails application in /somewhere. Add a server block
to your Nginx configuration file, set its root to /somewhere/public, and set
'passenger_enabled on', like this:

   server {
      listen 80;
      server_name www.yourhost.com;
      root /somewhere/public;   # <--- be sure to point to 'public'!
      passenger_enabled on;
   }

And that's it! You may also want to check the Users Guide for security and
optimization tips and other useful information:

  /usr/local/rvm/gems/ruby-2.0.0-p353/gems/passenger-4.0.25/doc/Users guide Nginx.html
  http://www.modrails.com/documentation/Users%20guide%20Nginx.html

Enjoy Phusion Passenger, a product of Phusion (www.phusion.nl) :-)
https://www.phusionpassenger.com

Phusion Passenger is a trademark of Hongli Lai & Ninh Bui.
```

## nginx 設定

###  起動とservice登録

    /opt/nginx/sbin/nginx
    netstat -lt
    /opt/nginx/sbin/nginx -s stop

### service登録後には

    /etc/init.d/nginx start

### service登録(option)

ここからinit-nginx.shをダウンロードする。

```
cd /opt
wget https://gist.githubusercontent.com/moreta/5104215b76c71cfaae2a/raw/cc26215fe9143fc544a6f0afc337b863ec634c51/init-nginx.sh
mv /opt/init-nginx.sh /etc/rc.d/init.d/nginx
chmod +x /etc/rc.d/init.d/nginx
chkconfig --add nginx
chkconfig nginx on
```

```
/etc/init.d/nginx start
/etc/init.d/nginx restart
```


# capistrano

``` ruby
group :deploy do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'
end
```


``` sh
bundle install
bundle exec capify .
```

## deploy

### setup(install rvm & ruby locally)

rvm-capistranoを使って
<https://github.com/wayneeseguin/rvm-capistrano>

``` ruby
before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'
set :rvm_type, :user # rvmの環境変数を~/.rvm(ユーザーことに)
set :rvm_ruby_string, local
set :rvm_ruby_version, 'ruby-2.0.0-p353@yourgemset'
```


``` sh
cap deploy:setup
```

##### もし`Permission denied (publickey).`がでるなら

サーバの **.ssh folderの権限**とその以下のファイルの権限をチェックすること。
* .sshディレクトリのPermissionを700に変更
* 公開鍵ファイルのPermissionも644から600に変更

##### 依頼制チェック

`cap deploy:check`


### cap deploy DB

## その他

### permission error

<http://lab.unicast.ne.jp/2011/05/31/%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%83%AC%E3%83%99%E3%83%AB%EF%BC%88%E3%83%9E%E3%83%AB%E3%83%81%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E5%AF%BE%E5%BF%9C%EF%BC%89%E3%81%A7%E3%81%AErvm%E3%82%A4/>

### sudo: sudo を実行するには tty がなければいけません。すみません

<http://linux.just4fun.biz/Linux%E7%92%B0%E5%A2%83%E8%A8%AD%E5%AE%9A/%E3%83%90%E3%83%83%E3%82%AF%E3%82%B0%E3%83%A9%E3%82%A6%E3%83%B3%E3%83%89%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%81%8B%E3%82%89%E5%88%A5%E3%83%A6%E3%83%BC%E3%82%B6%EF%BC%86%E3%83%91%E3%82%B9%E3%83%AF%E3%83%BC%E3%83%89%E3%81%AA%E3%81%97%E3%81%A7%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E5%AE%9F%E8%A1%8C.html>
<http://www.slideshare.net/tohakushi/sudo-23615164>

### su & su -
su 만 했을때는 기존에 사용하는 유저의 환경 설정 상태에서 사용자만 root 나 지정 사용자로 변환 하는것입니다.
그리너 path 나 환경 변수들이 기존 사용자 것을 따라가죠..
su - 는 사용자만 바꾸는것이 아니고 새로 로그인 하는 효과를 나타냅니다..
그래서 root 나 지정 사용자로 새로 로그인 하니까 전환전 사용자의 환경 변수나 path 등을 가져오지 않습니다..

### gem install error

*gem pg or sqlite3関連 *

`yum install -y postgresql-devel sqlite-devel`

*Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes.*

```
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'execjs'
gem 'therubyracer', platforms: :ruby
```

## rake task

* <https://coderwall.com/p/-qmwew>
* <http://gistflow.com/posts/372-execute-rake-task-on-remote-server-with-capistrano>

**deploy.rb**

```
namespace :rake do
  desc 'Run a task on a remote server.'
  # run like: cap staging rake:invoke task=yoour:rake:take:name
  task :invoke do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end
```


## 参考

<http://tk0miya.hatenablog.com/entry/2013/02/14/172254>

* apache + passenger

<http://itmemo.net-luck.com/linux-centos-apache-passenger/>

