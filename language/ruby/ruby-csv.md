Ruby CSV
=========

# gem - smarter csv

<https://github.com/tilo/smarter_csv>

## invalid byte sequence in UTF-8

rubyエンコーディングに詳しいblog
<http://tmtms.hatenablog.com/entry/20120812/ruby_encoding>

encoding bug関連コメント
<http://blog.livedoor.jp/sonots/archives/23652294.html>

## from Shift_JIS to UTF-8

<http://d.hatena.ne.jp/temita/20130530/1369921154>

# CSVの書き込みとメモリー

<https://docs.ruby-lang.org/ja/latest/class/CSV.html>

openを使うこと、generateは文字列を返すのでサイズが多き場合メモリが足りなくなる

```rb
require 'csv'

# ファイルへ書き込み
CSV.open("path/to/file.csv", "wb") do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
  # ...
end

# 文字列へ書き込み
csv_string = CSV.generate do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
  # ...
end
```



# CSVの読み込みとメモリー

<https://www.sitepoint.com/guide-ruby-csv-library-part-2/>

