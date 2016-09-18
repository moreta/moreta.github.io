---
title: ruby mailer server
date: 2014-08-17
tags: ruby, smtp, mail
---

必要だから作っていたけど、他のものをfolkしたほうがいい気がする.

* [mailcatcher](http://mailcatcher.me/)
* [mini-smtp-server](https://github.com/aarongough/mini-smtp-server)

mailcatcherはeventmachineベースになっている。
ちょっとやってみたけど、目的とはちょっと違ったのでmini-smtp-serverを参考しすることにした。


## mini-smtp-server

<https://github.com/aarongough/mini-smtp-server>

mini-smtp-serverをrailsと一緒に起動する方法

<http://stackoverflow.com/questions/14526229/how-do-i-create-a-daemon-to-run-an-smtp-server-within-a-rails-stack>

## usage

simple

```
# Create a new server instance listening at 127.0.0.1:2525
# and accepting a maximum of 4 simultaneous connections
server = MiniSmtpServer.new(2525, "127.0.0.1", 4)

# Start the server
server.start

# ...
# serving requests & doing other work here
# ...

# Shutdown the server without interrupting any connections:
server.shutdown
while(server.connections > 0)
  sleep 0.01
end
server.stop
server.join
```

## customizing

subclassでカスタマイズする。

```
# This is an SMTP server that logs all
# the messages it receives to STDOUT
class StdoutSmtpServer < MiniSmtpServer

  def new_message_event(message_hash)
    puts "# New email received:"
    puts "-- From: #{message_hash[:from]}"
    puts "-- To:   #{message_hash[:to]}"
    puts "--"
    puts "-- " + message_hash[:data].gsub(/\r\n/, "\r\n-- ")
    puts
  end

end

# customizingしたクラスでnew
server = StdoutSmtpServer.new
server.start
server.join
```

DBへ保存するときにはこのように命名すれば。
実装はかってに

```
class DatabaseSmtpServer < MiniSmtpServer
  def new_message_event(message_hash)
    # Imagine we have an ActiveRecord model named 'Email'
    Email.create(message_hash)
  end
end

```