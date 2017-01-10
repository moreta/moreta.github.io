
# 素のRubyの場合、デフォルトのタイムゾーンは

以下の2つによって決まります。

+ システムのタイムゾーン
+ 環境変数 ENV['TZ'] の値

### 有効なTimezone一覧

<http://en.wikipedia.org/wiki/List_of_tz_database_time_zones>


# RailsのTime zone設定

ここでは、TokyoもAsia/TokyoもどっちもOK

```rb
config.time_zone = 'Tokyo'
```

[1] pry(main)> Time.zone
=> (GMT+09:00) Tokyo


```rb
config.time_zone = 'Asia/Tokyo'
```

[1] pry(main)> Time.zone
=> (GMT+09:00) Asia/Tokyo

### 有効なTimezone一覧

<http://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html>のMAPPINGを参照

# TimeWithZoneを使おう!

+ created_at,  1.day.agoなどもTimeWithZoneである。
+ instance生成がTimeWithZoneからではない(以下の例を参照)

```rb
# http://api.rubyonrails.org/classes/ActiveSupport/TimeWithZone.html
Time.zone = 'Eastern Time (US & Canada)'        # => 'Eastern Time (US & Canada)'
Time.zone.local(2007, 2, 10, 15, 30, 45)        # => Sat, 10 Feb 2007 15:30:45 EST -05:00
Time.zone.parse('2007-02-10 15:30:45')          # => Sat, 10 Feb 2007 15:30:45 EST -05:00
Time.zone.at(1170361845)                        # => Sat, 10 Feb 2007 15:30:45 EST -05:00
Time.zone.now                                   # => Sun, 18 May 2008 13:07:55 EDT -04:00
Time.utc(2007, 2, 10, 20, 30, 45).in_time_zone  # => Sat, 10 Feb 2007 15:30:45 EST -05:00
```


# References


+ [RubyとRailsにおけるTime, Date, DateTime, TimeWithZoneの違い](http://qiita.com/jnchito/items/cae89ee43c30f5d6fa2c)
  + これはrubyとrailsですごく重要なことなので絶対によむ
