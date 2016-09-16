---
title: Ember Data
date: 2014-02-09
tags: emberjs, ember-data, model
---











# Failed assertion on multiple many-to-many relationships to the same model
<https://github.com/emberjs/data/issues/1551>

いい方法なのかまだ、疑問はあるが、警告はでなくなった
```
App.User = DS.Model.extend({
...
    // relation
    // この場合だと assertion failする
    foods: DS.hasMany('food',{async: true}), // 登録foods
    likes: DS.hasMany('food',{async: true}), // 好きなfoods

    foods: DS.hasMany('food',{async: true, inverse: null}), // 登録foods
    likes: DS.hasMany('food',{async: true, inverse: null}), // 好きなfoods
...
});
```

## 他の方法としては

1. ikesで別もmodelを作ること。
>> これもよくない、

2. `inverse: null`でなくちゃんと定義してあげる方法
>> これも場合による。