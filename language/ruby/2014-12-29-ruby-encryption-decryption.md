---
title : ruby encryption & decryption
date: 2014-12-29
tags: ruby, encryption, decryption
---

```
pry(main)> require 'digest/sha2'
=> true
pry(main)> Digest::SHA256.hexdigest "__yes__"
=> "15e177c4ecb4340a006b651629fde7a6653528343c8d4c597d831203ac16a9e7"
```
