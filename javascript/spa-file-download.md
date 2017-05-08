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


# References

+ [JavaScriptでファイルダウンロード処理を実現する](http://qiita.com/wadahiro/items/eb50ac6bbe2e18cf8813)
+ [各ブラウザでダウンロード処理を実装する](http://kuroeveryday.blogspot.jp/2016/05/file-download-from-browser.html)


+ [superagent - Parsing response bodies](http://visionmedia.github.io/superagent/#parsing-response-bodies)