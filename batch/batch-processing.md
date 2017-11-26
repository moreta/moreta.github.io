
# 確認言語別batch libarary

## Javascript Batch 

* <https://github.com/facebook/dataloader>

### dataloader 

* dataloaderは GraphQLとともに人気をが増えるようになっている
+ <https://www.youtube.com/watch?v=OQTnXNCDywA>

## Java Batch 

spring batchかな

## Ruby Batch

* <https://github.com/exAspArk/batch-loader>
* <https://github.com/shopify/graphql-batch>

## batch loader

* コードsampleは githubを参照
* graphsql-rubyにmergeされている
* graphqlだけでなく、REST Apiにも対応している
* js dataloaderのruby版
* <https://engineering.universe.com/batching-a-powerful-way-to-solve-n-1-queries-every-rubyist-should-know-24e20c6e7b94>
* EventMachineやPromise的なものは使ってなく、"lazy object"を使っている
* <https://speakerdeck.com/exaspark/batching-a-powerful-way-to-solve-n-plus-1-queries>

### lazy object?

lazy arrayなどで馴染みがある

```rb
range = 1..Float::INFINITY
values_lazy = range.lazy.map { |i| i * i }.take(10)
values_lazy.force
# => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```


# References

+ [Batching – A powerful way to solve N+1 queries every Rubyist should know](https://engineering.universe.com/batching-a-powerful-way-to-solve-n-1-queries-every-rubyist-should-know-24e20c6e7b94)