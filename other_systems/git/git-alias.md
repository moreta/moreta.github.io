# alias

### 直接入金して登録
`~/.gitconfig`に以下のように登録すれば使える

`git status`を`git st`で使える
```
[alias]
    st = status
```

### commandで登録

*`$(prefix)/etc/gitconfig`に登録する場合*

`git config --system alias.st status`

*`~/.gitconfig`に登録する場合*

`git config --global alias.st status`

*`.git/config`に登録する場合*

`git config alias.st status`


## git alias集

```
[alias]
  st = status
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
  lga = log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
```
