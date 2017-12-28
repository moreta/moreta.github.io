


* get '*path', to: ... や match '*something', to: ... はよく見かけますが、あまり良いプラクティスではないので、他の方法で実現した方がいいです。
* match は既に非推奨
* get なので、他の HTTP Method のリクエストに対応不能
* ActionController::RoutingError は **ApplicationController に到達する前に投げられる例外**
  * なのでrescue_from ActionController::RoutingError, ... は期待した通りに動かない（get '*path', to: ... によって、動いているように見えているだけ）
* ApplicationController で rescue_from Exception, ... すると Airbrake や Bugsnag なんかが動かなくなる。


+ [Railsの ActionController::RoutingError は ApplicationController での rescue_from で捕まえられない](https://qiita.com/gaaamii/items/183a9a3091a1751d833a)
+ [https://qiita.com/upinetree/items/273ae574f1c021d24c37](https://qiita.com/upinetree/items/273ae574f1c021d24c37)
 + これが一番整理されているかな