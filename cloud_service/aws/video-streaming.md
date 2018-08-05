
# 動画配信技術

## ストリーミング
* on-demand, live可
* コンテンツがクライアントに残らず、セキュアな再生が可能
* 専用プレーヤーが必要
  * MMS/RTSP(Microsoft), RTMP(Adobe Flash)
* NW/サーバ共に多くの資源を必要とする

## HTTPダウンロード
* on-demand only
* クライアントに依存しない
* Webサーバだけで配信可能
* コンテンツがクライアントに残るため保護が難しい
* 再生制御に制約が多い
* ライブ配信未対応


## HTTPストリーミング
* on-demand, live可
* 標準プレーヤー、プラグイン等で再生可能
* NW/サーバに多くの資源を要しない
* デバイス毎に配信フォーマットが異なる


# HLS?

* file extension : m3u8
* HLSとはHTTP Live Streamingの略
* apple specだが、全プラットフォームで使える(video.js, jwplayerなどと一緒に)
* 特別な設備（ストリーミングサーバなど）が不要でApacheなどのWebサーバでも配信できるのが特徴。

## HTTP Live Streaming tool

ここからdmgをdonwloadできる

<https://developer.apple.com/streaming/>

installすると

```
/usr/local/bin/mediastreamsegmenter
/usr/local/bin/mediafilesegmenter
/usr/local/bin/mediasubtitlesegmenter
/usr/local/bin/variantplaylistcreator
/usr/local/bin/mediastreamvalidator
/usr/local/bin/hlsreport.py
/usr/local/bin/id3taggenerator
```
### mediafilesegmenter

変換しようとするfileの有効性をチェック

```
⋊> mediafilesegmenter  -V source.mp4
"source.mp4" can be segmented
```

### hlsに変換してみよう

まず、folderを作る hls変換のfileが複数になるので
```
mkdir hls
```

```
⋊> mediafilesegmenter -f hls -i index.m3u8 -B media- source.mp4
May  2 2018 12:17:33.919: Processing file /Users/jj/Downloads/source.mp4
May  2 2018 12:17:33.941: Finalized /Users/jj/Downloads/hls/media-0.ts
May  2 2018 12:17:33.941: segment bitrate  4.21 Mbits/sec is new max
May  2 2018 12:17:33.947: Finalized /Users/jj/Downloads/hls/media-1.ts
May  2 2018 12:17:33.947: average bit rate is  4.09 Mbits/sec - max file bit rate is  4.21 Mbits/sec
```

```
drwxr-xr-x   7 xx  staff      224  5  2 12:17 .
drwx------+ 11 xx  staff      352  5  2 12:17 ..
-rw-r--r--@  1 xx  staff     6148  5  2 12:17 .DS_Store
-rw-rw-r--   1 xx  staff     1145  5  2 12:17 iframe_index.m3u8
-rw-r--r--   1 xx  staff      172  5  2 12:17 index.m3u8
-rw-r--r--   1 xx  staff  5250652  5  2 12:17 media-0.ts
-rw-r--r--   1 xx  staff  3002924  5  2 12:17 media-1.ts
```
ここでは `.ts`が２つだが
場合によっては、`.ts`がもっといっぱい生成される

# まとめ

aws blank beltの 「オンデマンド配信アーキテクチャ」を参考

1. s3へmp4を配置
2. s3のアップロードでlambdaをtriggerし、AWS Element Media ConvertでHLS変換
3. HLS変換したfileを再びs3へ保存
  * 
4. cloudfront経由で配信
5. ユーザーはjwplayer or video.jsでHLSをstreaming


# References

* [動画配信 on AWS](https://connect.awswebcasts.com/p12a9uv3u2e/)
  + [aws black belt](https://aws.amazon.com/jp/aws-jp-introduction/)
  + [pdf](https://d1.awsstatic.com/webinars/jp/pdf/services/20180213_awsblackbeltonlineseminar_streamingonaws.pdf)
* [HTTP Live Streamingで動画を配信してみる](https://dev.classmethod.jp/tool/http-live-streaming/)