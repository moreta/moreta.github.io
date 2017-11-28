SPA File donwload
==================

# 方法 1

1. request by ajax
2. response binary data to client
3. save binary data by file on client


# 方法 2

1. request by ajax
2. response with file (direct) download URL
3. (async) server create file and save file
4. file can download from 2's URL

でも、保存されているfile pathを隠したい場合には結局 1の方法になるのかな

# 方法 3 (1 + 2)

1. request by ajax
2. response with file (ajax) download URL(or key?)
3. (async) server create file and save file
4. request file by ajax by 2's URL
5. search file by URL's parameter
6. response file's binary data to client
7. save binary data by file on client


# 方法 3+ (aws s3)

1. request by ajax
2. response with file (ajax) download URL(or key for parameter)
3. (async) server create file and save file to s3
4. update batch status when file uploaded.
5. request file by ajax by 2's URL
6. search file from s3 by URL's parameter
7. If file exist create s3 download URL with expired time.
7. response s3 download URL to client
8. download file directly from s3 by response URL.


# 最終的に使ったコード

+ <https://stackoverflow.com/questions/17696516/download-binary-files-with-javascript>
+ <https://developer.mozilla.org/ja/docs/XMLHttpRequest/Sending_and_Receiving_Binary_Data>

server 部分

1. file生成
2. s3 upload
3. 期限付き s3 URLを発行
4. json responseへ返す

js 部分

```js
someApi.createFile(order.id).then(payload => {
    var oReq = new XMLHttpRequest()
    oReq.open("GET", payload.fileUrl, true)
    oReq.setRequestHeader('Content-Type', payload.contentType);
    oReq.responseType = "arraybuffer"
    oReq.onload = function (oEvent) {
        if (this.status === 200) {
            var blob = new Blob([oReq.response], { type: payload.contentType })
            var objectUrl = URL.createObjectURL(blob)
            let a = document.createElement('a')
            a.download = payload.fileName
            a.href = objectUrl
            a.click()
        }
    }
    oReq.send()
})
```

# その他libraries

+ [FileSaver.js](https://github.com/eligrey/FileSaver.js)
+ [StreamSaver.js](https://github.com/jimmywarting/StreamSaver.js)


# References

+ [JavaScriptでファイルダウンロード処理を実現する](http://qiita.com/wadahiro/items/eb50ac6bbe2e18cf8813)
+ [各ブラウザでダウンロード処理を実装する](http://kuroeveryday.blogspot.jp/2016/05/file-download-from-browser.html)


+ [superagent - Parsing response bodies](http://visionmedia.github.io/superagent/#parsing-response-bodies)

