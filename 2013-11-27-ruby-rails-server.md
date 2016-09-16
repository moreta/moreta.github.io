---
title: "ruby(rails) server"
date: 2013-11-27
tags: rails, ruby, server
---


### Rubyのhttpサーバまとめ 2012年4月版(thin, Unicorn, Passenger, etc)
<http://blog.uu59.org/2012-04-18-ruby-httpd.html>


## why not WEBrick

<https://devcenter.heroku.com/articles/ruby-default-web-server#production-web-server>

*single threaded, single process*


## unicorn setting

* [herokuのarticle](https://devcenter.heroku.com/articles/rails-unicorn)
* <http://tachesimazzoca.github.io/wiki/rails3/unicorn.html>
* [unicorn configurator docsn](http://unicorn.bogomips.org/Unicorn/Configurator.html)
* [centos unicorn install tutorial](https://www.digitalocean.com/community/tutorials/how-to-deploy-rails-apps-using-unicorn-and-nginx-on-centos-6-5)


## Passenger

[Rapter](http://www.rubyraptor.org/)は Passenger5である。

```
gem install passenger
passenger-install-nginx-module
emacs /opt/nginx/conf/nginx.conf
```



# 参考

* (Ansibleを使ってNginx+Raptor(Phusion Passenger 5)をインストール)[http://qiita.com/momin/items/954307e20c5ddd08aa38]

