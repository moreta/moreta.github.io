git stash
==============

## 一時退避

```
git stash
```

## 退避内容を一覧表示としてし戻す

```sh
git stash list
stash@{0}: hoge0
stash@{1}: hoge1
stash@{2}: hoge2

git stash pop stash@{0}
```

## 一番最新の退避内容を戻す

```
git stash pop
```

## 退避内容を全削除する

```
git stash clear
```

指定の退避内容を削除する

```
git stash drop stash@{0}
```