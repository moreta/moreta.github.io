---
title: Rails ActionMailer
date: 2014-05-09
tags: rails, actionmailer
---

# template from database


# なぜaction mailerは instance methodを class methodの用にコールできる？

action_mailer/base.rbのline 437部分にこれがあるから

```
class << self
...
  def method_missing(method, *args) #:nodoc:
    return super unless respond_to?(method)
    new(method, *args).message
  end
...
end
```

だとえば
このようなメーラーを

```
class YourMailer < ActionMailer::Base
  def welcome(recipient, some_txt)    
    attachments['free_book.pdf'] = File.read('path/to/file.pdf')
    mail(to: recipient, subject: "New account information")
  end
end
```
このようにコール
```
class MailTemplatesController < ApplicationController
...
  def your_method_do_send_mail
    YourMailer.welcome(recipient).deliver
  end
..    
end
```


でもそのような class methodはないので `method_missing`を通るようになる、そこで ActionMailer::Baseがnewされる

# mailcatcher

```ruby
# /config/environments/development.rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
```

# gmail軽油のメール送信

<http://qiita.com/dalaito0514/items/0907ee3312ed9d79c9e8>

```ruby
# /config/environments/development.rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.raise_delivery_errors = true
config.action_mailer.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => '587',
  :domain => 'smtp.gmail.com',
  :authentication => 'plain',
  :user_name => 'ユーザー名@gmail.com',
  :password => 'gmailパスワード'
}
```
