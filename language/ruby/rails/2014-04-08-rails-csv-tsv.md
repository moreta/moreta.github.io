---
title: Rails csv|tsv download
date: 2014-04-08
tags: rails, csv, tsv
---


# tsv(for excel)


* excelで開くためにはtsvにする必要がある。
*


<http://blog.plataformatec.com.br/2009/09/exporting-data-to-csv-and-excel-in-your-rails-app/># ほかLTSV

* <http://melborne.github.io/2013/01/24/csv-table-method-is-awesome/>
* <http://d.hatena.ne.jp/naoya/20130207/1360240992>
* <http://ltsv.org/>
* <http://docs.ruby-lang.org/ja/1.8.7/class/CSV.html>
* <http://ayaketan.hatenablog.com/entry/2014/01/26/180141>

```

require 'csv'   #csv操作を可能にするライブラリ
require 'kconv' #文字コード操作をよろしくやるライブラリ

    csv_file = params[:file]
    csv_text = csv_file.read
    #文字列をUTF-8に変換
    CSV.parse(Kconv.toutf8(csv_text)) do |row|
      csv_row_hash = row.to_hash
    end

```

## modelにアップロードを一任

<http://lab.heathrow.co.jp/2013/09/17/3111>

