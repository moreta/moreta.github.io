---
title: Hapi.js
date: 2015-12-01
tags: nodejs, api, hapi
---


# Getting Started

```
npm init
npm install hapi --save
```

create an index.js

## run

`node .`

# hot reload

+ [node-dev](https://github.com/fgnass/node-dev)

開発用, productionでは使えない

## install node-dev

```
npm install -g node-dev
```

## Usage

```
node-dev foo.js
```

# Plugins & Default functions

+ [node mailer](https://github.com/andris9/Nodemailer)
+ [api-pagination](https://github.com/codedoctor/api-pagination)
+ [static page view](https://github.com/hapijs/inert)
+ [validation by joi](https://github.com/hapijs/joi)

## Static pages and content

[static page view](https://github.com/hapijs/inert)

```
npm install --save inert
```

## validation

[validation by joi](https://github.com/hapijs/joi)

```
npm install --save joi
```

## log / good, good-console

```
npm install --save good
npm install --save good-console
```

## Authentication

### passport & passport-local

[passport](http://passportjs.org/)

- Passport is authentication middleware for Node.js
- A comprehensive set of strategies support authentication using a username and password, Facebook, Twitter, and more


```
npm install --save passport
```

### hapi authentication

+ passport-local
+ hapi-auth-cookie
+ [hapi-auth-jwt2](https://github.com/dwyl/hapi-auth-jwt2)
  + [hapi-auth-jwt2-example](https://github.com/dwyl/hapi-auth-jwt2-example)

#### TODO check

+ [hapi-login](https://github.com/dwyl/hapi-login)
  + [hapi-login-example](https://github.com/dwyl/hapi-login-example)

### others

- <http://emptymind.me/updating-authproject-to-hapi-8-2-x/>
  - In this demo `isSecure` is set to false, which is a bad idea when use in a live situation
  - Don't forget to enable HTTPS, otherwise isSecure does not work.
  - Passport-local-mongoose and mongoose are safe
- <https://github.com/Kevin-A/AuthProject>
- <http://emptymind.me/user-authentication-with-hapi-passport-and-mongoose/>
- <http://stackoverflow.com/questions/27315146/how-to-add-simple-passport-or-basic-auth-to-hapi>



## mongodb

### mongoose

# boilplate

+ [hapi api boilplate](https://github.com/rjmreis/hapi-api)

# plugins

<https://hapi-plugins.com/>

# References

+ [learn-hapi](https://github.com/dwyl/learn-hapi)


