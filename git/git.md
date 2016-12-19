---
title: GIT Basic
date: 2014-01-28
tags: git
---

# Install git by brew

```
brew update
brew upgrade
brew install git
```

# config common

## repositoryことにユーザーを指定するように設定

<http://qiita.com/uasi/items/a340bb487ec07caac799>

Git 2.8以上なら
```
git config --global user.useConfigOnly true
```
をし、

+ グローバルな gitconfig で user.name と user.email を設定してあるなら削除しておく。
+ こうすることで、各リポジトリ単位で user.name と user.email を設定することを強制できる。

### 色付けする

```
git config --global color.ui auto
```

### Macユーザーに贈るUTF-8問題解決設定

git 1.7.12以降で使える。
Macユーザーの中では有名ですが、濁点つきのディレクトリ・ファイルが分けて表示されてしまうUTF8-MAC問題の解決方法。
忘れがちなので注意。

今後クローンするリポジトリに対して有効になる
`git config --global core.precomposeunicode true`
既存リポジトリの .git/config に対してすること
`git config --local core.precomposeunicode true`

### git statusとかで表示される日本語ファイル名がエスケープされてうざい

`git config --global core.quotepath false`



# tags

## tagを付ける

```
git tag v1.0.1
```

## tagを削除

```
git tag -d <tagname>
```


## tagをpush

```
git push origin --tags
```

## tagからブランチを作成

```
git checkout -b v1 refs/tags/v1.2.1
```

# push

+ [引数なしのpushは危ない](http://dqn.sakusakutto.jp/2012/10/git_push.html)

これだけすると全てのブランチがpushされるので、危ない
```
git push
```

なので、以下の中で１つ選んで利用すること。

おすすめはcurrent。効率よく、安全


### １：ブランチ名を明示的に指定する
```
git push origin br1
```

### ２：デフォルトの挙動を"upstreamモード"に

```
git config --global push.default upstream
git push
```

カレントブランチとリモートブランチの間に「追跡関係」がある場合のみ

つまり

```
# これで設定されている場合
git branch --set-upstream-to=origin/<branch> <branch>

# これで pushした場合
git push -u origin <branch>
```
とか、他 --track されていてさらにcurrentブランチだけがpushされる。

### ３：デフォルトの挙動を"currentモード"に

```
git config --global push.default current
git push
```

こうすればカレントブランチのpushのみが行われます。



### ４：デフォルトの挙動を"simpleモード"に変更する(ただしGit1.7.11以降のみ)

```
git config --global push.default simple
git push
```


# diff

## diffでspaceを無視

２つある

+ -b, --ignore-space-change
  + Ignore changes in amount of whitespace. This ignores whitespace at line end, and considers all other sequences of one or more whitespace characters to be equivalent.
  + + git diff -bはスペースの違いを無視する(ignore-space-change)
+ -w, --ignore-all-space
  + Ignore whitespace when comparing lines. This ignores differences even if one line has whitespace where the other line has none.
  + git diff -wは全てのスペースの差分を無視する(ignore-all-space)


指定してつかう

```
git diff -w
```

aliasで利用する方法
```
# space無視
git config --global alias.dfw 'diff --ignore-all-space'

# 設定後以下のように利用
git dfw
```

## Beautiful diffs git 2.9から

<https://github.com/blog/2188-git-2-9-has-been-released>

```
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
```

brewでインストールしたのは diff-highlightがlinkされてない
```
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
```

.gitconfig
```
# 色付き
git config --global pager.log 'diff-highlight | less'
git config --global pager.show 'diff-highlight | less'
git config --global pager.diff 'diff-highlight | less'
# diff
git config --global diff.compactionHeuristic true
```

## diff command sample

```
git diff --help

git diff --cached
git diff --staged

# white space ignore
git diff  -w
git diff --ignore-all-space


git diff --staged -w # これを主に使う
```


# log

GUIツールっぽくcommit/merge履歴を表示
基本的にはこれでも大丈夫だが

```
git log --graph --decorate --oneline
```

このようにaliasに登録して使う
```
[alias]
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
  lga = log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
```


# Case by setting

## repository ごとに user.name や user.email の設定を強制する

<http://qiita.com/uasi/items/a340bb487ec07caac799>

Git2.8以上

```
git config --global user.useConfigOnly true
git config --global --unset user.name
git config --global --unset user.email

cd /path/to/my_repo
git config user.name "My Name"
git config user.email "me@example.com"
```




## Revert to previous Git commit

<http://stackoverflow.com/questions/4114095/revert-to-previous-git-commit>

If you want to temporarily go back to it, fool around, then come back to where you are, all you have to do is check out the desired commit:

This will detach your HEAD, i.e. leave you with no branch checked out:

`git checkout 0d1d7fc32`

or if you want to make commits while you're there, go ahead and make a new branch while you're at it:

git checkout -b old-state 0d1d7fc32
If, on the other hand, you want to really get rid of everything you've done since then, there are two possibilities. One, if you haven't published any of these commits, simply reset:

This will destroy any local modifications.

Don't do it if you have uncommitted work you want to keep.

`git reset --hard 0d1d7fc32`

Alternatively, if there's work to keep:

```
git stash
git reset --hard 0d1d7fc32
git stash pop
```
This saves the modifications, then reapplies that patch after resetting.

You could get merge conflicts, if you've modified things which were
changed since the commit you reset to

On the other hand, if you've published the work, you probably don't want to reset the branch, since that's effectively rewriting history. In that case, you could indeed revert the commits. With git, revert has a very specific meaning: create a commit with the reverse patch to cancel it out. This way you don't rewrite any history.

This will create three separate revert commits:

`git revert 0766c053 25eee4ca a867b4af`

It also takes ranges. This will revert the last two commits:

`git revert HEAD~2..HEAD`

To get just one, you could use `rebase -i` to squash them afterwards
Or, you could do it manually (be sure to do this at top level of the repo)
get your index and work tree into the desired state, without changing HEAD:

`git checkout 0d1d7fc32 .`

and then commit

`git commit    # be sure and write a good message describing what you just did`

# commit message multiple line()

```
git commit -m "this is
> a line
> with new lines
> maybe"
```

ほか、editorで開いて入力したほうが簡単かも

```
git commit -e
```

# remote branch delete

`git push origin :remote_branch_name`

削除されたブランチ整理

`git fetch --prune`


# config sample

```
[user]
  useConfigOnly = true
[core]
  editor = emacs
  excludesfile = /Users/xxxx/.gitignore_global
  quotepath = false
  precomposeunicode = true
[color]
  ui = true
[apply]
  whitespace = nowarn
[alias]
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
  lga = log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
[difftool "sourcetree"]
  cmd = opendiff \"$LOCAL\" \"$REMOTE\"
  path =
[mergetool "sourcetree"]
  cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
  trustExitCode = true
[filter "media"]
  required = true
  clean = git media clean %f
  smudge = git media smudge %f
[filter "lfs"]
  clean = git lfs clean %f
  smudge = git lfs smudge %f
  required = true
[push]
  default = upstream
[pager]
  log = diff-highlight | less
  show = diff-highlight | less
  diff = diff-highlight | less
[diff]
  compactionHeuristic = true
```
