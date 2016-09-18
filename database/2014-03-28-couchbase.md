---
title: Couchbase
date: 2014-03-28
tags: couchbase, rails, ruby
---


# Couchbase

<http://www.slideshare.net/kazutoshiu/couchbase-lite-29162491>


## with ruby

`gem install couchbase`

## with rails

### tutorial

<http://docs.couchbase.com/couchbase-sdk-ruby-1.3/#couchbase-and-rails-tutorial>

```
brew install https://github.com/couchbase/homebrew/raw/stable/Library/Formula/libcouchbase.rb

rails new couchbase-beer.rb -O --old-style-hash
```

Gemfile
```
gem 'yajl-ruby'
gem 'couchbase'
gem 'couchbase-model'
gem 'rdiscount'
gem 'omniauth'
gem 'omniauth-twitter'
```

`rails generate couchbase:config create  config/couchbase.yml`

## error

### gem install couchbaseが失敗

*libcouchbaseがないから*

```
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

    /Users/seo/.rvm/rubies/ruby-2.1.1/bin/ruby extconf.rb

**********************************************************************
* You must install libcouchbase >= 2.1.3
* See http://www.couchbase.com/communities/c/ for more details
**********************************************************************

*** extconf.rb failed ***
Could not create Makefile due to some reason, probably lack of necessary
libraries and/or headers.  Check the mkmf.log file for more details.  You may
need configuration options.

Provided configuration options:
	--with-opt-dir
	--with-opt-include
	--without-opt-include=${opt-dir}/include
	--with-opt-lib
	--without-opt-lib=${opt-dir}/lib
	--with-make-prog
	--without-make-prog
	--srcdir=.
	--curdir
	--ruby=/Users/seo/.rvm/rubies/ruby-2.1.1/bin/ruby
	--with-libcouchbase-dir
	--without-libcouchbase-dir
	--with-libcouchbase-include
	--without-libcouchbase-include=${libcouchbase-dir}/include
	--with-libcouchbase-lib
	--without-libcouchbase-lib=${libcouchbase-dir}/lib

extconf failed, exit code 1

Gem files will remain installed in /Users/seo/.rvm/gems/ruby-2.1.1@global/gems/couchbase-1.3.3 for inspection.
Results logged to /Users/seo/.rvm/gems/ruby-2.1.1@global/extensions/x86_64-darwin-13/2.1.0/couchbase-1.3.3/gem_make.out

An error occurred while installing couchbase (1.3.3), and Bundler cannot continue.
Make sure that `gem install couchbase -v '1.3.3'` succeeds before bundling.
```



#### CentOS(AWS)                          e

<http://www.couchbase.com/communities/jp/node/1395>

yum install -y wget
wget -O/etc/yum.repos.d/couchbase.repo http://packages.couchbase.com/rpm/couchbase-centos62-x86_64.repo
yum check-update
yum install -y libcouchbase-devel
yum groupinstall -y "Development Tools"
yum install -y zlib-devel
wget http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz
tar zxvf ruby-1.9.3-p448.tar.gz
cd ruby-1.9.3-p448
./configure --disable-install-doc --disable-install-rdoc --disable-install-capi && make install
gem install couchbase

#### mac(brew)

<http://couchbaseonrails.com/libcouchbase>

1. Xcode update

2. Command Line Tools update
 XCode > Preferences

3. install Homebrew & update


```
brew uninstall libcouchbase
brew install https://github.com/couchbase/homebrew/raw/stable/Library/Formula/libcouchbase.rb
```


##

http://cocoadocs.org/docsets/couchbase-lite-ios/1.0-beta2/