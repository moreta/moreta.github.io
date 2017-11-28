---
title: Rails authentication by Devise
date: 2015-07-12
tags: ruby, rails, api, authentication
---

# install

```
gem 'devise'
```

# after install

## run the generator

```
rails generate devise:install
rails g devise:install
```

The generator will install an initializer which describes ALL of Devise's configuration options. 
It is imperative that you take a look at it. When you are done, you are ready to add Devise to any of your models using the generator:


実行結果
```
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================
```


## Create model

```
rails g devise MODEL
rails g devise user # tutorial
```


# 関連GEM

## token auth

- <https://github.com/lynndylanhurley/devise_token_auth>

reactのsampleなどもある。

# devise with mongodb

+ <http://suvankar.svbtle.com/devise-and-mongoid-in-rails-4>


