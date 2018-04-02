Sequel database and dataset
============================


* [database](https://sequel.jeremyevans.net/rdoc/classes/Sequel/Database.html)
* [dataset](https://sequel.jeremyevans.net/rdoc/classes/Sequel/Dataset.html)


# fetchで生のsqlを利用する場合には databaseから

```rb
# DB.fetch('SELECT * FROM items') => return dataset
DB.fetch('SELECT * FROM items').all
```

これは datasetをreturnするので、datasetの[.all](https://sequel.jeremyevans.net/rdoc/classes/Sequel/Dataset.html#method-i-all)を使える