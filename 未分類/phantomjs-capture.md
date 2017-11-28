Phantomjsを利用したScreen Capture
==============================

# instal phantomjs

directでダウンロードして、pathを指定する

or

mac

```
brew install phantomjs
```


# screen capture

<http://phantomjs.org/screen-capture.html>


## URLのcaptureをimageで保存

phantomjsはpathに設定を入れて置く。

```sh
phantomjs /path_to_phantomejs_download/phantomjs-2.1.1-macosx/examples/rasterize.js http://capture_url sample.png "A4"
```

## image to pdf

<http://acro-engineer.hatenablog.com/entry/2014/02/04/111818>

sam2pを利用

[sam2p](https://pts.50.hu/sam2p/)


```sh
# 上で作ったsample.pngをPDFにする
sam2p sample.png <PDFファイル名を指定>
```