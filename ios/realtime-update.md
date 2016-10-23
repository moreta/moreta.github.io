chat and realtime update
=========================

+ PUSH通知に全て依存する構成でもそれなりに動く
+ PUSH通知 + 双方向通信処理(WebSocketなど)の併用がベスト
  + 双方向通信処理はPusher・Firebaseなどのサービスに頼る or ws・Socket.IO・SignalR + 対応クライアントライブラリなどで自前実装
  + Pusherなど有名サービスのクローンOSS導入も良さそうです
  + stevegraham/slanger
  + edgurgel/poxa
  + websocket - Open source alternatives to Pusher - Stack Overflow


# References

+ [](http://qiita.com/mono0926/items/bb7fdd912bc338096f57)
