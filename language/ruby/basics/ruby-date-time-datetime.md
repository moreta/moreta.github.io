
## Time & DateTimeの違う

### new

+ `DateTime.new(y, m, d, ...)` のようにインスタンスを作るとタイムゾーンがUTCになっている。（システムまたは環境変数のタイムゾーンを考慮しない）
+ `Time.new(y, m, d, ...)` のようにインスタンスを作るとタイムゾーンがシステムまたは環境変数のものになっている。

# TimeのRange

[Rangeは、Timeでも使えた！](https://qiita.com/16bitidol/items/2c76c31add576e05cba3)


```rb
time = (Time.now - 10.days)..(Time.now)
#=> Fri Aug 02 13:54:51 +0900 2013..Mon Aug 12 13:54:51 +0900 2013
```


```rb
time.end
#=> Mon Aug 12 13:54:51 +0900 2013
time.begin
#=> Fri Aug 02 13:54:51 +0900 2013
```


```rb
time.include?(Time.now)
#=> false 
time.include?(Time.now - 3.days)
#=> true 
```

時間単位

```rb
hours = (1.hour)..(3.hour)
#=> 3600 seconds..10800 seconds 
hours.include?(1.hour)
#=> true 
hours.include?(4.hour)
#=> false 
```




# References

+ [RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い](http://qiita.com/jnchito/items/cae89ee43c30f5d6fa2c)