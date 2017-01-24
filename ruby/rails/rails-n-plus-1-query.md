ActiveRecord N+1 (joins, preload, include, eager_load)
=====================================================


# ActiveRecordのjoinsとpreloadとincludesとeager_loadの違い

+ <http://qiita.com/k0kubun/items/80c5a5494f53bb88dc58>の記事のそのまま
+ <http://blog.arkency.com/2013/12/rails4-preloading/>

+ N+1 queryを発生しないためには eager loadingをする


メソッド   | キャッシュ | クエリ     | 用途
-----------|------------|------------|-----------------------------
joins      | しない     | 単数       | 絞り込み
eager_load | する       | 単数       | キャッシュと絞り込み
preload    | する       | 複数       | キャッシュ
includes   | する       | 場合による | キャッシュ、必要なら絞り込み

## 1. joins

```rb
User.joins(:posts).where(posts: { id: 1 })
# SELECT `users`.* FROM `users` INNER JOIN `posts` ON `posts`.`user_id` = `users`.`id` WHERE `posts`.`id` = 1
```

+ 基本inner joinをされる
+ left joinしたい場合 let_joinsを使う(Rails5)
+ **associationをキャッシュしない**
  + つまりクエリは遅い
  + しかし、メモリの節約になる（結果セットが遅いから）

使うケース

* JOINして条件を絞り込みたいが、*JOINするテーブルのデータを使わない場合* はjoinsを使うのが良い

### left joins


```rb
# rails 4.x
authors = Author.join('LEFT OUTER JOIN "posts" ON "posts"."author_id" = "authors"."id"')
                .uniq
                .select("authors.*, COUNT(posts.*) as posts_count")
                .group("authors.id")
```

```rb
# rails 5
authors = Author.left_outer_joins(:posts)
                .uniq
                .select("authors.*, COUNT(posts.*) as posts_count")
                .group("authors.id")

# 複数のleft join
Author.left_joins :posts, :comments
```

## 2. eager_load

```rb
User.eager_load(:posts)
# SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`created_at` AS t0_r2, `users`.`updated_at` AS t0_r3, `posts`.`id` AS t1_r0, `posts`.`user_id` AS t1_r1, `posts`.`created_at` AS t1_r2, `posts`.`updated_at` AS t1_r3 FROM `users` LEFT OUTER JOIN `posts` ON `posts`.`user_id` = `users`.`id`

User.eager_load(:posts).where(posts: { id: 1 })
# SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`created_at` AS t0_r2, `users`.`updated_at` AS t0_r3, `posts`.`id` AS t1_r0, `posts`.`user_id` AS t1_r1, `posts`.`created_at` AS t1_r2, `posts`.`updated_at` AS t1_r3 FROM `users` LEFT OUTER JOIN `posts` ON `posts`.`user_id` = `users`.`id` WHERE `posts`.`id` = 1
```

+ 指定したassociationをLEFT OUTER JOINで引いて **キャッシュする**。
+ クエリの数が1個で済むので場合によってはpreloadより速い。
+ JOINしているので、preloadと違って、joinsと同じようにJOINしたテーブルで絞込ができる


## 3. preload


```rb
User.preload(:posts)
# SELECT `users`.* FROM `users`
# SELECT `posts`.* FROM `posts` WHERE `posts`.`user_id` IN (1, 2, 3, ...)

User.preload(:posts).where(posts: { id: 1 })
# SELECT `users`.* FROM `users`  WHERE `posts`.`id` = 1
# => Mysql2::Error: Unknown column 'posts.id' in 'where clause': SELECT `users`.* FROM `users`  WHERE `posts`.`id` = 1
```

+ 指定したassociationを複数のクエリに分けて引いて **キャッシュする**。
+ 複数のassociationをeager loadingするときとか、あまりJOINしたくないでかいテーブルを扱うときはpreloadを使うのがよさそう。
+ preloadしたテーブルによって絞り込もうとすると、例外を投げる。

## 4. includes

```rb
User.includes(:posts)
# SELECT `users`.* FROM `users`
# SELECT `posts`.* FROM `posts` WHERE `posts`.`user_id` IN (1, 2, 3, ...)

User.includes(:posts).where(posts: { id: 1 })
# SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`created_at` AS t0_r2, `users`.`updated_at` AS t0_r3, `posts`.`id` AS t1_r0, `posts`.`user_id` AS t1_r1, `posts`.`created_at` AS t1_r2, `posts`.`updated_at` AS t1_r3 FROM `users` LEFT OUTER JOIN `posts` ON `posts`.`user_id` = `users`.`id` WHERE `posts`.`id` = 1
```

* includesしたテーブルでwhereによる絞り込みを行っている
* includesしたassociationに対してjoinsかreferencesも呼んでいる
* 任意のassociationに対してeager_loadも呼んでいる

のうちいずれかを満たす場合、eager_loadと同じ挙動(LEFT JOIN)を行い、
そうでなければpreloadと同じ挙動(クエリを分けて実行)をする。
絞り込みが必要な時に例外を投げずeager_loadにfallbackするpreload。

# References

+ [ActiveRecordのjoinsとpreloadとincludesとeager_loadの違い](http://qiita.com/k0kubun/items/80c5a5494f53bb88dc58)
+ [3 ways to do eager loading (preloading) in Rails 3 & 4](http://blog.arkency.com/2013/12/rails4-preloading/)
