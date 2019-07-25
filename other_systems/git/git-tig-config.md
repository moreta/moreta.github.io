# .tigrc

```sh
# references
# - https://qiita.com/sfus/items/063797a1dd8fdc7d032f

# main view の左端にコミットIDを表示する
set main-view = id date author:email-user commit-title:graph=yes,refs=yes

# blame view の行数表示をON、intervalを1に
set blame-view  = date:default author:email-user id:yes,color line-number:yes,interval=1 text

# Pager系の行数表示をON、intervalを1に (default: line-number:no,interval=5)
set pager-view  = line-number:yes,interval=1 text
set stage-view  = line-number:yes,interval=1 text
set log-view    = line-number:yes,interval=1 text
set blob-view   = line-number:yes,interval=1 text
set diff-view   = line-number:yes,interval=1 text:yes,commit-title-overflow=no

# マウスを有効にする
set mouse = true

# page-down & page-up like emacs
bind generic <Ctrl-v> move-page-down
bind generic <Esc>v move-page-up
```

# References

+ [Tig で Git を自由自在に操作するための .tigrc 設定例](https://qiita.com/sfus/items/063797a1dd8fdc7d032f)