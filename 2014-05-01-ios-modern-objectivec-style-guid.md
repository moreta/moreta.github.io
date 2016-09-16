---
title: iOS modern code style
date: 2014-05-01
tags: ios, code, style
---


* <https://developer.apple.com/library/mac/releasenotes/ObjectiveC/ModernizationObjC/AdoptingModernObjective-C/AdoptingModernObjective-C.html#//apple_ref/doc/uid/TP40014150>
* <http://qiita.com/makoto_kw/items/d86fada0e38e9245912a>
* BlocksKitの利用を検討する


## NSDictionary

before
```
NSDictionary *aDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                value, @"Key",
                                [NSNumber numberWithBOOL:YES], @"OtherKey", nil];

```

after
```
objectivec:afterNSDictionary *aDictionary = @{ @"Key" : value, @"OtherKey" : @YES };
```