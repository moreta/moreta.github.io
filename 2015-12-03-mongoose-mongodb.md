---
title: Mongoose - mongodb for node.js 
date: 2015-12-03
tags: node.js, javascript, mongodb
---

# References

- <http://mongoosejs.com/>


# api

## Promiseを利用するためには

+ [switching-out-callbacks-with-promises-in-mongoose](http://eddywashere.com/blog/switching-out-callbacks-with-promises-in-mongoose/)

## Model

<http://mongoosejs.com/docs/api.html#model-js>


### find

examples

```js
Kitten.find({ name: /^Fluff/ }, callback);

// findしてコンソールに出力
Memo.find({}, function(err, docs) {
  if(!err) {
    console.log("num of item => " + docs.length)
    for (var i = 0; i < docs.length; i++ ) {
      console.log(docs[i]);
    }
    mongoose.disconnect()  // mongodbへの接続を切断
    process.exit()         // node.js終了
  } else {
    console.log("find error")
  }
});

```


#### sort

<http://stackoverflow.com/questions/4299991/how-to-sort-in-mongoose>


```js
Post.find({}).sort('test').exec(function(err, docs) { ... });
Post.find({}).sort({test: 1}).exec(function(err, docs) { ... });
Post.find({}, null, {sort: {date: 1}}, function(err, docs) { ... });
Post.find({}, null, {sort: [['date', 1]]}, function(err, docs) { ... });
```

### findById

```js
Product.findById(product._id, function (err, product) {
  console.log(product) // null
})
```

### save


### remove

<http://mongoosejs.com/docs/api.html#model_Model-remove>

callback 

```js
product.remove(function (err, product) {
  if (err) return handleError(err);
  Product.findById(product._id, function (err, product) {
    console.log(product) // null
  })
})
```

promise

```js
product.remove().then(function (product) {
   ...
}).onRejected(function (err) {
   assert.ok(err)
})
```
