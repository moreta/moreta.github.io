
# イベントフェーズとは？
イベントが発生すると下記の流れでイベント伝播が発生します。

+ capture phase : (キャプチャフェーズ) DOMツリーをたどってルート要素から発生要素を探しに行く
+ target phase : (ターゲットフェーズ) 発生要素を検出する
+ bublbling phase : (バブリングフェーズ) 今度はルート要素まで遡る


# References

+ [DOMイベントのキャプチャ/バブリングを整理する](http://qiita.com/hosomichi/items/49500fea5fdf43f59c58)
+ [W3C UI Events](https://www.w3.org/TR/DOM-Level-3-Events/)