Ruby Hash
============



# hashでreduceを使うため

1. valuesで値のarrayを取得
2. reduceする

```rb
h.values.reduce(0) { |sum, x| sum + x }
```