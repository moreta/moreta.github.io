---
title: GIT Commit Message
date: 2016-09-05
tags: git, commit, message, semantic-commit
---

# Conventional Change log

<https://github.com/conventional-changelog/conventional-changelog>

commitメッセージで release noteを自動生成できる


# Semantic Commit Message

+ <https://seesparkbox.com/foundry/semantic_commit_messages>
+ <https://github.com/fteem/git-semantic-commits>


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
