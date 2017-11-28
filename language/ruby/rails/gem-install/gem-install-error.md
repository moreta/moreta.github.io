

# References
+ <http://3.1415.jp/d3wpyqjr/#sthash.kCD9jw8J.dpuf>
+ <https://qiita.com/windhorn/items/394c10dea23d1e829cd1>

libv8、therubyracer、OS のバージョンによってinstallすべきversionが異なる

まずは自分の環境を確認

```
ruby -rubygems -e 'puts Gem::Platform.new(RUBY_PLATFORM)'
```

| platform         | os name       |
|------------------|---------------|
| x86_64-darwin-16 | mac os Sierra |
