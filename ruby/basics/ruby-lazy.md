Ruby での配列の遅延処理
=======================

+ Ruby 2.0から使える
+ Enumerable#lazy
  + .lazyをつけることで利用できる


# どこに使う？

+ log fileなどfile sizeが大きなfileから特定条件のデータのみ抽出したいとか
+ 無限のsizeの配列(終わりがわからない列)からfirst 100件とか抽出するとか
+ 終わりがわからない列、例えばネットワークのstreammingされてくるデータから

# 例

## Twitterでtwitをstreammingで返すデータから

```rb
TwitterPublicTimeline.each.lazy.map{|json| ...(json を加工する)...}
.select{|tweet| ...(条件にあうツイートなら true を返す)...}
.each{|tweet| p tweet}
```

lazyをつかわなかったらこのように書く
```rb
TwitterPublicTimeline.each do |json|
  tweet = ...(json を加工する)...
  next unless ...(条件)...
  p tweet
end
```

+ lazyを利用して map, selectなどを使うのは再利用性が高い


# References

+ [無限リストを map 可能にする Enumerable#lazy](http://magazine.rubyist.net/?0041-200Special-lazy)
+ [S3から複数のファイルを取得しつつ on-the-fly でZipを作ってブラウザに返す](https://doruby.jp/users/nakamatsu/entries/S3%E3%81%8B%E3%82%89%E8%A4%87%E6%95%B0%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%8F%96%E5%BE%97%E3%81%97%E3%81%A4%E3%81%A4-on-the-fly-%E3%81%A7Zip%E3%82%92%E4%BD%9C%E3%81%A3%E3%81%A6%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6%E3%81%AB%E8%BF%94%E3%81%99)