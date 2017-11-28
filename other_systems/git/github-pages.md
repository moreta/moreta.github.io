---
title: Github Page
data: 2016-05-30
tags: github, page
---

# Type Of Github page

+ <https://help.github.com/articles/user-organization-and-project-pages/>
+ account単位で作るのなら User or Organization Page
+ repository単位で作るなら

# gh-pagesの管理

gh-pagesを直接管理するともろもろ面倒だし、masterで作業したsourceを反映するのも不便なので
masterで全部作業後、dist folderを subtreeで gh-pagesに直接 pushするのをおすすめ。

<http://www.damian.oquanta.info/posts/one-line-deployment-of-your-site-to-gh-pages.html>

## gh-pages branchを生成しpush

```
git checkout -b gh-pages # gh-pagesを作成
git rm -rf . # 空にして
git commit -am "First commit to gh-pages branch"
git push origin gh-pages # remoteへpush
```

## subtreeを利用し、特定directoryを gh-pagesをcontentsにする

+  examples/dist folderは .gitignoreから除外する必要がある

```
git checkout master
git subtree add --prefix examples/dist origin gh-pages
git push origin `git subtree split --prefix examples/dist gh-pages`:gh-pages --force # これをすると gh-pagesが削除される
git subtree push --prefix examples/dist origin gh-pages
```

## 今後、修正があるときには以下でcontentsを更新する

```
git subtree push --prefix examples/dist origin gh-pages
```

## 必要なくなったlocalのgh-pagesを削除

```
git branch -D gh-pages
```

# 他の方法として docs directoryを利用

この方法もためしてはいないが便利そう

# References

+ [Deploying a subfolder to GitHub Pages](https://gist.github.com/cobyism/4730490)
+ [Github pages に 特定のディレクトリだけデプロイする](http://qiita.com/mizchi/items/17e2eb04c34b18aff921)
+ [gh-pagesをサブディレクトリ内で管理](http://qiita.com/tyfkda/items/1ee5e50a39729a301520)
+ [How to force a subtree push to remote](http://stackoverflow.com/questions/33172857/how-do-i-force-a-subtree-push-to-overwrite-remote-changes)
