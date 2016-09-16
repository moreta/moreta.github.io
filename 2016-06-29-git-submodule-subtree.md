---
title: GIT submodule & subtree
date: 2016-06-29
tags: git, submodule, subtree
---

# submodule

+ git submodule は、外部の git リポジトリを、自分の git リポジトリのサブディレクトリとして登録し、特定の commit を参照する仕組みです。

# subtree

```
git subtree add   --prefix=<prefix> <commit>
git subtree add   --prefix=<prefix> <repository> <ref>
git subtree merge --prefix=<prefix> <commit>
git subtree pull  --prefix=<prefix> <repository> <ref>
git subtree push  --prefix=<prefix> <repository> <ref>
git subtree split --prefix=<prefix> <commit...>
```

## options

+ --squash : example/dist directoryのcommitを一つのまとめてくれる
