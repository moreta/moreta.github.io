---
title: GIT Commit Message
date: 2016-09-05
tags: git, commit, message, semantic-commit
---

# Conventional Change log

<https://github.com/conventional-changelog/conventional-changelog>

commitメッセージで release noteを自動生成できる


## convention

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```


## Semantic Commit Message

+ <https://seesparkbox.com/foundry/semantic_commit_messages>
+ <https://github.com/fteem/git-semantic-commits>


# いいコミットメッセージのための設定

## Separate subject from body with a blank line / タイトルと本部に改行を入れる

+ `git log --oneline`が見やすくなる
+ `git shortlog`でユーザー別ログが見やすくなる
+ `git commit -m`では難しいのでeditorなどを利用
+ titleは 50文字
+ 本部は72文字

### editor setting

```sh
git config --global core.editor emacs # editor setting
git config --global commit.template ~/.gitmessage.txt # git commit message template setting
git config commit.template ~/.gitmessage.txt # specific repository
git commit
```


# commit prefixをつける方法

git hookを利用

## git hook

<http://git-scm.com/book/en/Customizing-Git-Git-Hooks>

`.git/hooks`に

### commit msg hook sample code by ruby

<https://gist.github.com/EmmanuelOga/2926764>

### install

```
cd your_project
curl https://gist.githubusercontent.com/moreta/9802039/raw/5c065eab4595f1a5d696da464ca8a60b41ed7110/commit-msg > .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

```



# References

+ [Git 커밋 메시지 작성법](https://item4.github.io/2016-11-01/How-to-Write-a-Git-Commit-Message/)
  + [原文 - How to Write a Git Commit Message](http://chris.beams.io/posts/git-commit/)
  + [8.1 Customizing Git - Git Configurationのgitmessage.txt部分](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
