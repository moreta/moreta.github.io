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



* [A Guide to the Ruby CSV Library, Part II](https://www.sitepoint.com/guide-ruby-csv-library-part-2/)
* [RubyのCSV処理で気をつけるポイント](https://qiita.com/swdyh/items/884a0cade2e5fcebfd8b)


## 全データをメモリに載せないこと

* CSV.parse/CSV.read/CSV.tableあたりは全データがメモリにのるのでNG

CSV.foreachを利用
```ruby
guests_who_visited_more_than_ten_times = Array.new
CSV.foreach('guests.csv', headers:true) do |guest|
  guests_who_visited_more_than_ten_times << guest if guest['Times arrived'] > 10
end
```

CSV.open & eachを利用
```ruby
CSV.open('guests.csv', headers:true) do |guest|
  guests = guest.each
  guests.select do |row| 
    row['Times arrived'].to_i > 10
  end
end
```