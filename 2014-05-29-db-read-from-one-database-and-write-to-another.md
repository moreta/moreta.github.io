---
title: Read from on database and Write to another
date: 2014-05-29
tags: database, replication, load-balance
---

# DBへのリクエストを分散させる方法の一つ

## replication(master-slave)

以下のようにDBをreplication構成をした場合

```
master - slave
       - slave
       - slave
```

readは masterとslave　または slaveのみ
writeは masterにし

readのリクエストを分散させDBの負荷を減らす戦略をよくとる。

## データの種類で複数のDBを使う(multi master)


`master(会員系) - master(注文系) - master(分析系)`

または

`master(会員系) - master(注文系) - nosql-master(分析系)`

のようにしてmodelから分けてリクエストを投げる

## in railsでgemを利用
 
以下のようなgemがある。github star順

* [octopus](https://github.com/tchandy/octopus)
* [DB Charmer](https://github.com/kovyrin/db-charmer)
* multi_dbもあるが、上記の２つが人気がある。

### 2014-06-08
octopusとDB Charmerでoctopusを利用することにする。

* `database.yml`を汚さないし、人気がある
* rails4を正式にサーポートするのはoctopus

### Octopus

* <https://github.com/tchandy/octopus>
* [herokuのoctopus gem tutorial](https://devcenter.heroku.com/articles/distributing-reads-to-followers-with-octopus)

#### support

db charmerと大きくは変わらない

* Sharding (with multiple shards, and grouped shards).
* Replication (Master/slave support, with multiple slaves).
* Moving data between shards with migrations.
* Tools to manage database configurations. (soon)

#### setting

**Gemfile**

`gem 'ar-octopus', require: 'octopus'`

**config/shards.yml**



#### replication環境での利用

[document](https://github.com/tchandy/octopus/wiki/replication)
[rails db replicationとlagの対応の説明がちゃんとできている](http://dandemeyere.com/blog/rails-replication-with-octopus)

**全てのreadクエリはmasterにwriteクエリはslaveに送られる**ことに注意
なのでslave dbもスペックがよくないとだめ。


`fully_replicated: true` にすると、masterに対してもreadにいってしまうようになっている。<< これは確認が必要


defaultで全てのDBがreplicationされている前提で動く、もし部分的にreplicationしているのであれば、
`fully_replicated: false`にして
replicationされているモデルに`replicated_model`を入れてreplication対象を指定する

```
octopus:
  replicated: true
  fully_replicated: false # << これを追加
  environments:
    - staging
    - production

  staging:
    slave1:
      database: octopus_shard2
      <<: *mysql
    slave2:
      database: octopus_shard3
      <<: *mysql

  production:
    slave3:
      database: octopus_shard4
      <<: *mysql
    slave4:
      database: octopus_shard5
      <<: *mysql
```

```
#This class is replicated, writes to master and reads to slave.
class Cat < ActiveRecord::Base
  replicated_model() # << モデルにここ追加
end
```

##### Multiples Slaves

サーポートするround robin algorithmで、
これもDB-charmerと同じ

##### 特定shardへのクエリ

これもDB-charmerと同じ

```
 #sends the query to master
 User.using(:master).count
 
 #Sends the query to specific slave
 User.using(:slave_1).count

 Octopus.using(:slave_1) do 
   User.count
 end
```


### DB Charmer

[DB Charmer document]<http://dbcharmer.net/>

[DB Charmer github](https://github.com/kovyrin/db-charmer)


これを使うと簡単に実装

database.yml

```
production:
  blah:
    adapter: mysql
    username: blah
    host: blah.local
    database: blah

  foo:
    adapter: mysql
    username: foo
    host: foo.local
    database: foo
```

#### Auto-Switching all Reads to the Slave(s)

master-(multi)slave構成で指定したslaveDBに round robinで分散する

```
class Foo < ActiveRecord::Base
  db_magic :slave => :slave01
end

class Bar < ActiveRecord::Base
  db_magic :slaves => [ :slave01, :slave02 ]
end
```

#### Default Connection Switching

master-slave構成が複数ある場合どっちかをdefaultに使うかを指定

```
class Foo < ActiveRecord::Base
  db_magic :connection => :foo
end
```

masterとslaveを別connectionでする場合
```
class Bar < ActiveRecord::Base
  db_magic :connection => :bar, :slave => :bar_slave
end
```

#### Per-Query Connection Management(クエリ単位で分ける)


##### `on_master`

blockを利用して中は全部masterでクエリ
```
User.on_master do
  user = User.find_by_login('foo')
  user.update_attributes!(:activated => true)
end
```

proxy形式で１クエリ単位で
```
Comment.on_master.last(:limit => 5)
User.on_master.find_by_activation_code(code)
User.on_master.exists?(:login => login, :password => password)
```

##### `on_slave`

`on_slave`は`on_master`は同じだけslaveが複数あるとrandomで選択される。

##### `on_db(connection)`

選択して接続

```
Comment.on_db(:olap).count
Post.on_db(:foo).first
```

*指定したconnectionがないと*エラー*だがtestとdevelopment環境ではエラーならないが、productionではエラーが発生する*

#### Forced Slave Reads(強制的slave read)

##### Model 単位

```
class User < ActiveRecord::Base
  db_magic :slave => slave01, :force_slave_reads => false
end
```

##### Controller method 単位 : `ActionController.force_slave_reads`

```
class ProfilesController < Application
  force_slave_reads :except => [ :login, :logout ]
  # ...
end
```


##### Controller filter : `ActionController#force_slave_reads!`

loginしてないユーザーはslaveから読み込むようにする例

```
class ProfilesController < Application
  before_filter do
    force_slave_reads! unless current_user
  end
  # ...
end
```

#### Code単位 : `DbCharmer.force_slave_reads`

```
DbCharmer.force_slave_reads do
  # ...
  total_users = User.count
  # ...
end
```

#### Associations Connection Management(関係を保つ場合)

`User.posts.count`のようにchained callがある場合はconnectionの管理がややこしい

いい
`Post.on_db(:olap) { User.posts.count }`

悪い
```
@user.posts.on_db(:olap).count
@user.posts.on_slave.find_by_title('Hello, world!')
@post.user.on_slave   # would return post's author
@photo.owner.on_slave # would return photo's owner
```

できる
```
@user.on_db(:foo).posts
@user.on_slave.posts
``

#### Named Scopes Support

```
Post.on_db(:foo).published.with_comments.spam_marked.count
Post.published.on_db(:foo).with_comments.spam_marked.count
Post.published.with_comments.on_db(:foo).spam_marked.count
Post.published.with_comments.spam_marked.on_db(:foo).count
@user.on_db(:archive).posts.published.all
@user.posts.on_db(:olap).published.count
@user.posts.published.on_db(:foo).first
```

#### Sharding Support
 
shardingとサーポートする。しかし、ちゃんと理解してない状態で使うのはおすすめしない。




## codeで実装する方法

read only modelを作る方法

<http://d.hatena.ne.jp/akishin999/20130718/1374100143>


 
# 参考

* <http://stackoverflow.com/questions/8900570/read-from-one-database-and-write-to-another-in-rails-2-3>
* [iqonのrails4移行](http://tech.vasily.jp/2013/07/iqon_rails4_mysql_gem/)
* [herokuのoctopus gem tutorial](https://devcenter.heroku.com/articles/distributing-reads-to-followers-with-octopus)
