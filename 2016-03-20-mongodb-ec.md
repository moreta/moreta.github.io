---
title: Mongodb in EC
date: 2016-03-20
tags: mongodb
---

# トランザクション問題を回避する

MongoDBを使ってAtomicな処理をするには? 

## mongodbのatomic保証

+ 1つのドキュメント (RDBMSで言うところの1レコード) へのupdateに関してのみ
  + 特定の1ドキュメントへのupdate（findAndModify）
+ だめな場合
  + 別コレクションにまたがるドキュメントのupdate
  + 同じコレクション内の複数のドキュメントへのupdate

# スキーマをしっかりと設計する

details部分だけが違う

book
```json
{
  _id: ObjectId('53d7beec4e32fd3514fbd027'),
  type: 'book'
  name: 'New Book'
  description: '............',
  price: 48.99
  details: {
    isbn: '.................',
    author: '..............',
    size: 'Paperback'
  }
}
```

dvd
```json
{
  _id: ObjectId('53d7beec4e32fd3514fbd028'),
  type: 'dvd'
  name: 'New DVD'
  description: '............',
  price: 60.99
  details: {
    director: '.................',
    actor: '..............',
    media: 'dvd'
  }
}
```

## pros

+ details部分を別々のテーブルとして定義する必要がない

## cons

+ スキーマレスにもかかわらず、検索をする際には事前にどんなプロパティがあるかを知っている必要があります
+ detailsを展開して画面に表示しようとした時、どういったプロパティが入っているかわからないと最適なUIで表示することもできなくなる


# ベターな設計は基本reference、データが小さく検索性を考えればembed

スキーマ設計において

+ reference :別の意味を持ったデータを一つにする
+ embed :別のコレクションとして分け、IDだけを埋め込む
+ MongoDBはドキュメントあたり最大16MBという制限があるので、どこまでもドキュメントが大きくなるような設計はNG
+ 16MB以内に抑え、padding分以上増えないように設計しようとすると、基本的にはreferenceを選択
+ 基本はreference、データが小さく検索性を考えればembedです
+ あらかじめ、reference先のデータを検索にすることがわかっている場合は、検索要素をembedすることで対応 
 
## example

embed

productコレクション（embed）

```json
{
  _id: ObjectId("53d84d8dbef6458e5cf693ed"),
  name: 'New T-shirts'
  skus:[
    {
      size: 'S',
      color: 'black'
    },
    {
      size: 'M',
      color: 'white'
    }
  ]
}
```

reference

product, skuコレクション（reference）


```json
// product
{
  _id: ObjectId("53d84d8dbef6458e5cf693ed"),
  name: 'New T-shirts',
  skus: [
    ObjectId("53d84e156a96245237d03d35"),
    ObjectId("53d84e156a96245237d03d36")
  ]
}
//productに参照されるsku
[
  {
    _id: ObjectId("53d84e156a96245237d03d35"),
    size: 'S',
    color: 'black'        
  },
  {
    _id: ObjectId("53d84e156a96245237d03d36"),
    size: 'M',
    color: 'white'
  }
]
```

## reference方式でののデータ検索の難点

+ reference方式だとreference先のコレクションに保存されているデータを簡単に検索することができない

color: whiteのskuを持っているproductを検索

```js
var ids = [];
db.skus.find({ color: 'white' }, { _id: 1 }).forEach(function(o){
  ids.push(o._id); //ここの件数が多いとパフォーマンス低下になる
});
db.products.find({ $in: ids });
```

あらかじめ、reference先のデータを検索にすることがわかっている場合は、検索要素をembedすることで対応します。

```json
// product
{
  _id: ObjectId("53d84d8dbef6458e5cf693ed"),
  name: 'New T-shirts',
  skus: [
      ObjectId("53d84e156a96245237d03d35"),
      ObjectId("53d84e156a96245237d03d36")
    ],
  colors: ['black', 'white']
}
```


```js
db.products.find({ colors: "white" });
```

# 強力な集計エンジンAggregationを活用する

+ [Mongodb aggregation doc](https://docs.mongodb.org/manual/aggregation/)




# References

+ [MongoDBでECサイトを実運用する3つのテクニック](http://blog.otakumode.com/2014/08/01/ec-mongodb/)
+ [MongoDB, E-commerce and Transactions](http://www.slideshare.net/spf13/mongodb-ecommerce-and-transactions-10524960)
