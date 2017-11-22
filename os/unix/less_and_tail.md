less & tail
=======

# tail -f の代わりのlessを使う

```sh
less -F file.log
```

## tail modeへの切り替え

```
less file.log
# shift - f するとtailモードになる

# tail mode -> normal mode
`Ctrl+C`
を入力して、通常のlessに戻れます。
```

# 他のless command

- `q`：less終了（quit）
- `f`：次のページを見る（forward）
- `b`：前のページを見る（backward）
- `j`：1行下へ
- `k`：1行上へ
- `g`：ファイルの先頭へ移動
- `G`：ファイルの末尾へ移動
- `/キーワード`：前方検索。`n`で次の検索一致へ移動。`N`で前の検索一致へ移動。
- `?キーワード`：後方検索。`n`で次の検索一致へ移動。`N`で前の検索一致へ移動。
- `F`：監視状態。`tail -f`と同じ機能。`Ctrl + c`でless状態に戻る。


# tailがいいどころ

+ 複数fileをtailする場合には tailがいい
+ lessはpipeができない `less +F /var/log/exim_mainlog | grep "something"` << できない



# References

+ [Stop using tail -f (mostly)](http://www.brianstorti.com/stop-using-tail/)