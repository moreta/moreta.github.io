#### pluckを利用するとき

includesで取得した結果をpluckするとincludeしたテーブルjoinされなく、whereのsqlだけ適用され
エラーになる場合がある、

*pluckを使うならjoinsで取得すること*

*しかし!*

joinsを使った時にhas_many関係の場合には
pluckを使うとjoinsの元が複数取得されてします。(pluckは 新しい独自のsqlが生成される)
この場合を避けるため、

`collect(&:your_column)`を使うこと

```rb
@groups =  Group.joins(:user).where('user.age < 19')
@groups.pluck(:id) # result [1,1,1,2,2]
@groups.collect(&:id) # result [1,2]
```

