---
title: loopback
date: 2015-11-24
tags: nodejs, api, loopback
---

# License

oracleなどを使うときには有償になる。
会社では簡単には使えないので、koaかexpressを検討する(2015/12/01)

# install

```
npm install -g strongloop
cd affiliate-api
```

# Basic tutorial

## create model

```
slc loopback:model
```

## Compose your API, run, deploy, profile, and monitor it with Arc

```
slc arc
```
## Run the app

```
node .
> Web server listening at: http://0.0.0.0:3000
> Browse your REST API at http://0.0.0.0:3000/explorer
```

### browserで確認するとswegerで作られたapiリストが確認できる

- Userは作ってなくてもdefaultである。

# Loopback core concepts

- <https://docs.strongloop.com/display/public/LB/LoopBack+core+concepts>


## Models

- loopbackの心臓
- backendデータソースを表現する

![Model Inheritance](https://dl.dropboxusercontent.com/u/21522805/blog/js/Model%20inheritance.png)


### モデルの種類

- Base model class
- Custom models
  - You can define your own custom models
    - <https://docs.strongloop.com/display/public/LB/Creating+models>
- Connected model class
- Built-in models (Loopbackにbuilt-inされている)
 - Application
 - User
 - Role
 - RoleMapping
 - ACL

### Custom model

モデルを生成する方法

- model generatorを利用
  - `slc loopback:model`

### Base  model object

- <https://docs.strongloop.com/display/public/LB/Basic+model+object>

four feature

- Modal object
- Hookable
- Validateable
- Inclusion

## Routing

LoopBack middleware chainではexpressのroutingを含んでいる

### Express　routingのサマリ

以下はexpressのroutingのkey point

- Routing refers to the rules for capturing requests to the server, and the subsequent passing through and handling of requests through a chain of middleware functions.
  - Routingはserverへのrequestを捕らえ、middleware functionsへの続いての通過と、requestのhandlingをする。  
- A middleware function accepts three objects, the request object (req), the response object (res), and the next middleware in the chain (next); in that order.
  - middleare functionは3つのobjectを受け取る、request, responseそして、次のmiddlewareのchain
- You load middleware either using app.use() or by assigning it as the callback function of a route definition.
- Multiple middleware can be matched to handle the requests to a route, these matched middleware make up the middleware chain for the request. The request will pass through each middleware in the order they were loaded, unless one of the middleware in the chain terminates the propagation.
- Any middleware in the chain may terminate the request propagation by sending a response back to the client.
- A middleware can send the response to the request using one of the response methods in the response object or pass on the request to the next middleware by calling next().
- If a middleware sends the server response, conventionally the request does not propagate further in the middleware chain. Any call to next() will likely result in an error.
- A middleware function can also take four arguments. In this case, it is an error handling middleware. The parameters to the function in their order are: the error object (err), the request object (req), the response object (res), and the next middleware in the chain (next).

expressのrouting documentも参考に
- <http://expressjs.com/guide/routing.html>

```js
// expressでnextを使う例
app.get('/example/b', function (req, res, next) {
  console.log('response will be sent by the next function ...');
  next();
}, function (req, res) {
  res.send('Hello from B!');
});
```


### middleware


# authenticate loopback - google facebook github

- <https://strongloop.com/strongblog/authenticate-loopback-google-facebook-github/>

基本的にサポートしている

- Sign up a new user
- Log in using username/email and password
- Log out
- Verify a user registration by email
- Sign up a new client application
- Authenticate a client application by ID and keys

## loopback-passport

|         model         |                                                desc                                                |
|-----------------------|----------------------------------------------------------------------------------------------------|
| UserIdentity          | keeps track of third-party login profiles                                                          |
| UserCredential        | stores credentials from a third-party provider to represent users’ permissions and authorizations. |
| ApplicationCredential | stores credentials associated with a client application                                            |
| PassportConfigurator  | bridge between LoopBack and Passport.                                                              |



# references

- [getting started](http://loopback.io/getting-started/)
