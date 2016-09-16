---
title: Secret key & Password
date: 2015-12-14
tags: key, secret, password
---

Secret key & Password
=====================


+ <https://www.grc.com/passwords.htm>



# generate API keys

## node

### node-uuid

+ <http://stackoverflow.com/questions/13093308/what-would-be-the-best-possible-way-to-generate-api-keys-and-hash-passwords-in-n>


```
require('node-uuid')()
require('crypto').createHash('sha256').update(_).update('salt').digest('hex');
# with salt
require('crypto').createHash('sha256').update(uuid.v4()).update(crypto.randomBytes(256)).d‌​igest('hex')
```

### aguid

+ <https://www.npmjs.com/package/aguid>


Generate a Deterministic GUID given an input

```
var aguid = require('aguid');
var guid  = aguid("hello@world.io"); // d828ed52-32ed-4908-86df-df934d3c315d (ALWAYS) 
// use the guid as the key for our record in Redis, ElasticSearch, Postgres, etc. 
```


Generate a Random GUID when invoked without argument

```
var aguid = require('aguid');
var guid  = aguid(); // 525be54a-1101-46bf-97d7-2e9c89dd1b16 (*Random*) 
// use for what ever you need a *random* guid  
```


## ruby


```
require 'securerandom'

p SecureRandom.urlsafe_base64
p SecureRandom.urlsafe_base64
p SecureRandom.uuid # v4 uuid
```
