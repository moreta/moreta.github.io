socket.io
===========

# socket.ioが登場するまで

## Comet

### 種類

+ HTTP Streaming
+ HTTP Long polling

### cometとは

+  `clientから送信されたHTTP requestをserverが維持し、serverがらpushすべきeventが発生したらHTTP responseを返す。`というWebアプリケーション・モデルの総称
+ HTTPコネクションを維持しているため、イベント発生時に即座にサーバからブラウザへデータをPUSHすることができます
+ Ajax multipart streamingはbrowser制約があるが、Ajax long pollingはない

## WebSocket

+ RFC6455として規格化されている「双方向通信用」のプロトコル
+ Cometのような再接続を必要とする「重い仕組み」を打破する目的で策定されました
+ WebSocketプロトコルを暗号化しない場合、ネットワーク経路上に通信のキャッシュやバッファリングを行うプロキシなどがあると、ポート80で疎通できたとしてもWebSocket接続を確立することができません。

### WebSocketを使えるか確認

以下のURLに接続

+ <http://www.websocket.org/echo.html>
+ <http://websocketstest.com/>

# References

+ [socket.io](http://socket.io/)
+ [チャットなどリアルタイム更新が必要なスマフォアプリの構成について考えてみた](http://qiita.com/mono0926/items/bb7fdd912bc338096f57)
