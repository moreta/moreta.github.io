---

title: "rails scss @import error"
date: 2013-10-05 16:24
comments: true
tags: rails
---

### BEFORE

~~~ ruby
group :assets do

  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.2.7'
end
gem 'sass-rails',   '~> 3.2.5' # scss @importエラーになるた
~~~

### AFTER

config/environment/production.rb or config/environment/staging.rb config change
`config.assets.compile = true`

GemFile update

~~~ ruby
group :assets do

  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.2.7'
end
gem 'sass-rails',   '~> 3.2.5' # scss @importエラーになるため
~~~