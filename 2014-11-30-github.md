---
title: Github
data: 2014-11-30
tags: github
---

# 有用なaccounts

+ <https://github.com/docdis>
  + for Learn - learn by teaching - curated collection of code tutorials


# Merging an upstream repository into your fork

<https://help.github.com/articles/merging-an-upstream-repository-into-your-fork/>

```
git checkout master
git pull https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git BRANCH_NAME
git push origin master
```

forkで作業しているときには masterにはコミットしないのがいい。
branchを作成して、branchでコミットしたほうがあとからmergeもしやすくソースの管理もいい。

# diffのときにwhite spaceは比較対象から除外

```
?w=
```
