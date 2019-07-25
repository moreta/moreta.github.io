# current directory to webserver

## npm/node

```sh
npm install serve -g
serve -p 9001
serve -p 9001 -s dist # SPAでclient side routingの場合 -s optionが必要 & dist folderを指定
open http://localhost:9001
```

### -s option
 -s, --single                        Rewrite all not-found requests to \`index.html\`

## pushstate-server

+ <https://github.com/scottcorgan/pushstate-server>

```sh
npm install -g pushstate-server
pushstate-server build # buildはstatic fileはあるdirectory
open http://localhost:9000
```

## ruby

```
ruby -run -e httpd . -p 9002
```

* <http://docs.ruby-lang.org/ja/2.1.0/library/un.html>
* <http://docs.ruby-lang.org/ja/2.1.0/method/Kernel/i/httpd.html>

## python

`python -m SimpleHTTPServer`

python3

`python -m http.server`  

## php

`php -Slocalhost:8000`

## jetbrain editor

just open file

## References

+ [Ways to start a Webserver in your current Directory](http://paul.wellnerbou.de/2015/05/03/ways-to-start-a-webserver-in-your-current-directory/)
