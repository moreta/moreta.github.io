---
title: current directory to webserver
date: 2014-04-28
tags: webserver
---


# npm/node

```
npm install serve -g  
serve -p 8000
```

## pushstate-server

+ <https://github.com/scottcorgan/pushstate-server>

```
npm install -g pushstate-server
pushstate-server build # buildはstatic fileはあるdirectory
open http://localhost:9000
```


# ruby

`ruby -run -e httpd . -p 8000`

* <http://docs.ruby-lang.org/ja/2.1.0/library/un.html>
* <http://docs.ruby-lang.org/ja/2.1.0/method/Kernel/i/httpd.html>

# python

`python -m SimpleHTTPServer`

python3

`python -m http.server`  

# php

`php -Slocalhost:8000`

# jetbrain editor

just open file

# References

+ [Ways to start a Webserver in your current Directory](http://paul.wellnerbou.de/2015/05/03/ways-to-start-a-webserver-in-your-current-directory/)
