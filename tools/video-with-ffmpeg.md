
# install mac

```
brew install ffmpeg
```

# example

## 動画から静止画を1枚だけ書き出す

```
$ ffmpeg -i aaa.mov -ss 1 -vframes 1 -f image2 %04d.png
```

* -i：ファイル指定
* -ss：抜き出し始点・・・1秒
* -vframes：指定したフレーム数だけ書き出し・・・1つ
* -f image2 %04d.png：書き出しファイル名・・・[0001.png]から連番

## scaling

<https://trac.ffmpeg.org/wiki/Scaling>

### Keeping the Aspect Ratio
もとの 535⨉346 pixelsのvideoを
width 320でheightを-1にする
```
ffmpeg -i input.jpg -vf scale=320:-1 output_320.png
```

## compress

<https://gist.github.com/lukehedger/277d136f68b028e22bed>

```sh
ffmpeg -i input.mp4 -vcodec h264 -acodec mp3 output.mp4 # これも？
ffmpeg -i input.mp4 -vcodec h264 -acodec aac output.mp4 # これも？
ffmpeg -i input.mp4 -vcodec h264 -acodec mp2 output.mp4
ffmpeg -i input.mp4 -vcodec h264 -b:v 1000k -acodec mp2 output.mp4
```

## crop

<https://video.stackexchange.com/questions/4563/how-can-i-crop-a-video-with-ffmpeg>

```
ffmpeg -i in.mp4 -filter:v "crop=out_w:out_h:x:y" out.mp4
```
* out_w is the width of the output rectangle
* out_h is the height of the output rectangle
* x and y specify the top left corner of the output rectangle

### Crop 20 pixels from the top, and 20 from the bottom:

```
ffmpeg -i in.mp4 -filter:v "crop=in_w:in_h-40" -c:a copy out.mp4
```

## aspect ratioを維持しながらcrop

```
ffmpeg -i input.mp4 -vf "scale=1280:720:force_original_aspect_ratio=increase,crop=1280:720" output.mp4
```

## preview

cropなどするときにencodeしなくても確認にできる
```
ffplay -i input -vf "crop=in_w:in_h-40"
```

```
brew install ffmpeg --with-ffplay
```

# References

* <https://qiita.com/kitar/items/59f80bba2ca997e0f5e6>
* [macでffmpegを導入してmovファイルをgifファイルへ変換するところまで](https://qiita.com/Ryosuke-Hujisawa/items/6a1c47d31ac299dc1c46)