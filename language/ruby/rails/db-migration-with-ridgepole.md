

# 現状のSchemaを吐き出す

```sh
# development
ridgepole -c config/database.yml -E development --split --export -o db/schemas/Schemafile

# >..Export Schema

# production
ridgepole -c config/database.yml -E production --split --export -o db/schemas/Schemafile
```

# 試しにさっき吐き出されたスキーマファイルでapplyしてみる。

```sh
bundle exec ridgepole -c config/database.yml -E development --apply -f db/schemas/Schemafile
# > Apply `db/schemas/Schemafile`
```

# migration反映後、rails applicationの再起動が必要？

な、内容を見たので、いまはつかないことにする。

[squasher](https://github.com/jalkoby/squasher)が良さそう。(Ruby2.0+ ActiveRecord 3.1+から)


# References

+ [Ridgepole is a tool to manage DB schema](https://github.com/winebarrel/ridgepole)
+ [db:migrateの管理からridgepoleに移行する](https://qiita.com/paranishian/items/ff9d4736593c7d5f0295)