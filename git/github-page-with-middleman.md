---
title: "github page with Middleman blog"
date: 2013-10-01
tags: github, middleman
---


~~~ ruby
gem 'middleman-deploy'

gem 'middleman-syntax' # markdown
gem 'middleman-rouge' # syntax-highlight

# comment
gem 'middleman-disqus'
~~~


~~~ sh
git remote add origin git@github.com:yourname/repository.git
bundle exec middleman server
middleman server # localhost:4567
middleman build [--clean]
middleman deloy [--build-before]
~~~

## automatic run build during `middleman deploy`

~~~ ruby
activate :deploy do |deploy|
  #...
  deploy.build_before = true # default :false
end
~~~

## Github page

~~~ ruby
activate :deploy do |deploy|
  #...
  deploy.method = :git
end
~~~


## syntax
<http://alexpeattie.com/blog/github-style-syntax-highlighting-with-pygments/>

~~~ ruby
# Gemfile
gem 'middleman-syntax'

# config.rb
activate :syntax
~~~

### use redcarpet

~~~ ruby
gem 'redcarpet'
~~~

~~~ ruby
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true
~~~

## use kramdown

~~~ ruby
require 'kramdown'
set :markdown_engine, :kramdown
~~~

### download css and add

<https://github.com/richleland/pygments-css/blob/master/github.css>


## Helper

<http://rubydoc.info/github/middleman/middleman-blog/master/Middleman/Blog/Helpers>

* [current_article](http://rubydoc.info/github/middleman/middleman-blog/master/Middleman/Blog/Helpers#current_article-instance_method)

### paging helper

<http://forum.middlemanapp.com/t/link-to-first-and-last-page-with-pagination/940/3>

## google 検索

1. カスタム検索を作成
https://www.google.com/cse/create/new

