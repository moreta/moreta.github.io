
以下の内容は qiitaの内容を抜粋しただけです。原文はリンクを参照してください

# Servlet標準の非同期処理

<http://qiita.com/kazuki43zoo/items/8be79f98621f90865b78>

# Spring MVCがサポートしている非同期処理の方式

<http://qiita.com/kazuki43zoo/items/ce88dea403c596249e8a>

+ 非同期実行が終了してからHTTPレスポンスを開始する方式
+ 非同期実行の処理中にHTTPレスポンスを開始する方式

# 非同期実行が「終了してから」HTTPレスポンスを開始する方式

この方式は、時間の掛かる重たい処理をアプリケーションサーバーが管理するスレッドから分離して実行することで、
アプリケーションサーバーのスレッドを有効利用したい場合に使用します。
勘違いしやすいのですが、HTTPレスポンスは非同期実行している処理が終了した後に行うため、
クライアント側から見ると同期処理と同じ動作なります。

# 非同期実行の「処理中に」　　HTTPレスポンスを開始する方式

この方式は、サーバーから任意のタイミングでデータを送信(Push)したい場合に使用します。
サーバー側は非同期処理を起動したタイミングでいったんHTTPレスポンスを行い、
その後、非同期処理中の任意のタイミングでレスポンスデータを送信(Push)します。
このパターンを利用する場合は、
クライアントが分割レスポンス("Transfer-Encoding: chunked")に対応している必要があります。

+ ひとつのHTTPレスポンスを複数のイベントに分割して返却(Push)します
  + **HTTP Streaming** として知られているレスポンス方式


test code


```java
package com.example.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitter;

import java.io.IOException;

@Controller
@RequestMapping("/streaming")
public class StreamingController {

    @Autowired
    AsyncHelper asyncHelper;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseBodyEmitter streaming(@RequestParam(defaultValue = "1") long eventNumber, @RequestParam(defaultValue = "0") long intervalSec) throws IOException {
        Console.println("Start get.");

        ResponseBodyEmitter emitter = new ResponseBodyEmitter();
        asyncHelper.streaming(emitter, eventNumber, intervalSec);

        Console.println("End get.");
        return emitter;
    }

}
```

```java
@Component
public class AsyncHelper {
    // ...
    @Async
    public void streaming(ResponseBodyEmitter emitter, long eventNumber, long intervalSec) throws IOException {
        Console.println("Start Async processing.");

        for (long i = 1; i <= eventNumber; i++) {
            sleep(intervalSec);
            emitter.send("msg" + i + "\r\n");
        }

        emitter.complete();

        Console.println("End Async processing.");
    }
    // ...
}
```


結果確認

```
curl -D - http://localhost:8080/streaming?eventNumber=2\&intervalSec=1
HTTP/1.1 200
Transfer-Encoding: chunked
Date: Wed, 05 Oct 2016 16:00:22 GMT

msg1
msg2
```

## 非同期実行が終了してからHTTPレスポンスを開始する方式との比較

+ 非同期処理中にクライアントにレスポンスを開始する点が異なります。
+ Controllerの処理が終了した後にレスポンスをいったんフラッシュすることで、分割レスポンス(Transfer-Encoding: chunked)になることをクライアントに通知している点

# References

+ [Spring MVC(+Spring Boot)上での非同期リクエストを理解する -前編-](http://qiita.com/kazuki43zoo/items/ce88dea403c596249e8a)
+ [Spring MVC(+Spring Boot)上での非同期リクエストを理解する -後編(HTTP Streaming)-](http://qiita.com/kazuki43zoo/items/53b79fe91c41cc5c2e59)
