
# ln

## examples


```
# Set up launchctl to auto start mongod
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
```


- -s : シンボリックリンクを作成します。このオプションを省略した場合は、ハードリンクを作成します
- -f : 作成するリンクファイルと同一名のファイルが存在しても、問い合わせなしに上書きします。(force)
- -v : 処理内容を出力します。(verbose)
