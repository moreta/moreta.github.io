


# 大量データのあつかい

+ **redshift_cursor** gemを利用
+ ActiveRecord::Batchesとは処理がちがう

## ActiveRecord::Batches

method

+ .find_each
+ .find_in_batches

注意 & cursorと違う部分

+ ソートカラムが指定できない
+ プライマリキーが必ず数値型である必要がある
+ チャンク毎にクエリが何度も再実行される

## redshift_cursor

```rb
# Gemfile
gem 'redshift_cursor'
```

| method                | return result                        |
+-----------------------+--------------------------------------+
| .each_row             | 結果をハッシュの配列                 |
| .each_instance        | 結果をハッシュの配列                 |
| .each_row_by_sql      | レシーバークラスのインスタンスの配列 |
| .each_instance_by_sql | レシーバークラスのインスタンスの配列 |

```rb
Recipe.where(id: 3199605).each_row.fitst
=> {"id"=>"3199605", "title"=> "簡単 生地なし！キヌアキッシュ", ... }

Recipe.where(id: 3199605).each_instance.first
=> #<Recipe:0x007fe5260eeaa8 id: 3199605, title: "簡単 生地なし！キヌアキッシュ", ...>
```

Enumerableを返すので`.map`, `.each`を利用できる

```rb
# タイトルが「ほうれん草」にマッチするようなレシピ
Recipe.where('title like ?', '%ほうれん草%').each_insntace.map {|recipe| recipe.title }

# 必要なカラムがタイトルだけなら
Recipe.where('title like ?', '%トマト%').select(:title).each_row.map {|recipe| recipe['title'] ... }

# 条件や順序をSQLで書く
Recipe.each_instance_by_sql('select * from recipe where ... order ...').map {|recipe| recipe.created_at }

# ヒアドキュメントでSQLを書く
SearchLog.each_row_by_sql(<<~SQL
    select
        title
        , count(*) as pv
    from
        search_logs
    where
        keyword like '%ズッキーニ%'
        and log_time between ...
    group by
        title
SQL
).each {|log| log['pv'] ... }
```

#  10万行を超える場合には UNLOAD

<http://docs.aws.amazon.com/ja_jp/redshift/latest/dg/r_UNLOAD.html>


# References

+ [ActiveRecordを使ってRedshiftから大量のデータを効率的に読み出す](http://techlife.cookpad.com/entry/2016/07/01/145405)
  + redshift_cursor gem