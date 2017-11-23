極めようarel
===================

* activerecordで限界を感じたら、arelを使うか、Sequelなどを使うしかない。
* わたしはSequelを使うのがおすすめだが、レガシシステムや、外部gemとの連動でSequelを使えない場合は結構ある

なので、arelも必須で知っておくべき。
しかし、コードはやはり読みづらくなるので、おすすめはできない。

# NOT NULL & IS NOT NULL

```
Hoge.where(arel_table[:fuga].not_eq(nil))
Hoge.where(arel_table[:fuga].eq(nil))
```

# subqueryのjoin

[ActiveRecordでサブクエリのJOIN](https://qiita.com/takeyuweb/items/f303fbfa9580cece1823)


# References

+ [RailsのArelのTips](http://qiita.com/yamagen0915/items/b1721a9d1ea076f8cdc5)
+ [既存のscopeからor条件のSQLを組み立てる](http://qiita.com/ichi_s/items/22f3535c3e8adb901902)
+ [ActiveRecord4でこんなSQLクエリどう書くの? Arel編](http://labs.timedia.co.jp/2013/10/activerecord4sql-arel.html)
+ [Arelでクエリを書くのはやめた方が良い5つの理由（Rails 5.0以前の場合）](http://qiita.com/jnchito/items/630b9f038c87298b5756)
  + まあ、でもsubquery作るにはarelしかないでしょう。