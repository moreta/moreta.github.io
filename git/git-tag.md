---
title: GIT tag
date: 2016-08-13
tags: git, tag
---

# タグ付ける

```
git tag v_1.0.0
```

# リモートに反映

```
git push origin v_1.0.0
```

## ローカルでつけたタグを全てリモートに反映させる

```
git push origin --tags
```

## 過去のコミットにタグを付ける

```
git tag pre_v1.0.0 githash
```

## リモートのタグを消す

```
git tag -d [タグの名前]
git push origin :[タグの名前]
```

# References

+ [gitでタグを付ける](http://qiita.com/ritukiii/items/79a46103bdf24229a1ef)
