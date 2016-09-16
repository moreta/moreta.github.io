---
title: Rails Activerecord
date: 2014-08-25
tags: ruby, relative-path
---

## __FILE__

rubyで実行されているファイルが位置する場所を返す。

ファイルが

`/code/examples/path_example.rb`にあるとしたら

これは

`puts __FILE__`

output

`examples/path_example.rb`になる

設定ファイルを読み込むときに以下のようによく利用される。

`config_path = File.expand_path(File.join(File.dirname(__FILE__), "config.yml"))`

でも、`File.expand_path`を利用するならもっと簡単にできる。

`File.expand_path`の２つ目のparameterはdirectoryを指定する。なので以下のように書き換えられる。

`config_path = File.expand_path("../config.yml", __FILE__)`


## 参考

* <https://tomafro.net/2010/01/tip-relative-paths-with-file-expand-path>
