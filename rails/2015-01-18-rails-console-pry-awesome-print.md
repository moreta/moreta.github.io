---
title: ruby & rails console util
date: 2015-01-18
tags: ruby, rails, console, pry, awesome_print
---





## awesome_print

example

```
ap Account.limit(2).all
ap Account
```

### pry default setting

cat .pryrc
```
require "awesome_print"
AwesomePrint.pry!
```
