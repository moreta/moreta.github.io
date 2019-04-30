# brewでインストール

`brew update && brew upgrade`

`brew install tig`

## vimと同じキー設定

```sh
# ~/.tigrc

bind generic ^f scroll-page-down
bind generic ^b scroll-page-up
```

# 閉じる

`q`

# diffを見る

入って enter

# ブランチの一覧

`r`

# add , unadd

1. main viewで `S` (`shift+ s`) - git status
2. fileかgroupで `u`

## 部分add

上の、fileのdiff viewで
変更groupで `u`する
変更行で`1`すると、その行だけ


# checkout

`r`で入って移動後、`C`でcheckout

# 2つのブランチ間の差を表示

```
tig task_brach..master
```

# diffでignore space

```
W # でtoggle
```

# branch list (refs)

```
r
```

# tigで開くときにすべてのbranchの履歴が見えるように

```
tig -all
```

# commit

まず、status viewになる
`s` -> `C`

# 参考

* [tigでgitをもっと便利に！ addやcommitも](http://qiita.com/suino/items/b0dae7e00bd7165f79ea)
* [tig : Text-mode interface for git](https://github.com/jonas/tig)
* [cheatsheet](https://devhints.io/tig)