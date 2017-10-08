---
title: Running a Node.js Server Forever
date: 2015-12-04
tags: nodejs, server
---


# server script

```js
var http = require('http');
var server = http.createServer(function(request, response){
  if ()
});
```

# run

```sh
nohup node server.js &
```

- & is background running

# kill server

crashを想定

```
killall node
```

# use forever

```
npm install -g forever
forever start server.js
forever list # forever管理するprocess list
```
## kill
```
kill 1111X
# but you know server not killed
```

# forever stop

```sh
forever stop server.js
# or
forever stopall
```

# bootの時に自動にする

```
emacs /etc/rc.local
```

以下を記録

```
forever start /path/to/server.js
```

# References

<https://codek.tv/5072>