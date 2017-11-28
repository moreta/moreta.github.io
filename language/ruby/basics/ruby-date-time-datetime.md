
## Time & DateTimeの違う

### new

+ `DateTime.new(y, m, d, ...)` のようにインスタンスを作るとタイムゾーンがUTCになっている。（システムまたは環境変数のタイムゾーンを考慮しない）
+ `Time.new(y, m, d, ...)` のようにインスタンスを作るとタイムゾーンがシステムまたは環境変数のものになっている。


# References

+ [RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い](http://qiita.com/jnchito/items/cae89ee43c30f5d6fa2c)