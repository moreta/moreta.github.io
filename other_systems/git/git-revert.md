# revertのときの -m(mainline) optionについて

sourcetreeでは merge commitは reserveできない
cliでするしかない

```
git revert -m 1 c35d56f # c35d56fは merge commitの番号
```

