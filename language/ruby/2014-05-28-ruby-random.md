---
title: ruby random
date: 2014-05-28
tags: ruby random
---


# random string

```
string_size = 10
((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(string_size).join
```



