
# Rails streaming

+ rails4以前 - `ActionController::Streaming`
+ rails4以後 - `ActionController::Live`


# ストリーミングダウンロード

データがサーバ上の実ファイルではない場合、Railsで順次送信するしかありません。
データの生成に時間がかかる場合（巨大なPDFを作る、別サーバからダウンロードしたデータを順次流すなど）、すべてのデータが準備できる前に送信開始したいものです。

その場合は、response.streamを使用します。
<http://api.rubyonrails.org/classes/ActionController/Streaming.html>

## 注意点

+ なるべくContent-Lengthを指定する
  + 事前にContent-Lengthを指定しておけば、ブラウザ側で「何%ダウンロード中…」とプログレス
+ streaming 対応サーバーを利用する
  + webrickはだめ ->> localのテストでのだめな気がする

## sample

+ <https://gist.github.com/lexmag/3259481>


```ruby
class PostsController < ApplicationController
  # ...

  def stream
    response.headers.delete('Content-Length')
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Content-Type'] = 'text/event-stream'

    self.response_body = Enumerator.new do |y|
      loop do
        if (Time.current.sec % 5).zero?
          y << "event: counter\n"
          y << "data: 5 seconds passed\n\n"
        end
        sleep 1
      end
    end
  end

  # The new approach
  # include ActionController::Live
  def stream
    response.headers['Content-Type'] = 'text/event-stream'

    begin
      loop do
        if (Time.current.sec % 5).zero?
          response.stream.write("event: counter\n")
          response.stream.write("data: 5 seconds passed\n\n")
        end
        sleep 1
      end
    rescue IOError
      # Catch when the client disconnects
    ensure
      response.stream.close
    end
  end

  # ...
end
```

## sample 2 - s3 fileをdownload

<http://stackoverflow.com/questions/12277971/using-send-file-to-download-a-file-from-amazon-s3>

```ruby
def download
  data = open("https://s3.amazonaws.com/PATTH TO YOUR FILE") 
  send_data data.read, filename: "NAME YOU WANT.pdf", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096' 
end 
```

+ s3 -> server, server -> clientへの２回のdownloadが発生するのは非効率でき

## sample 3 - usgin expiring S3 URL

<http://stackoverflow.com/questions/12277971/using-send-file-to-download-a-file-from-amazon-s3>



# References

+ [Railsで大きなファイルを扱う際のポイント](https://techracho.bpsinc.jp/baba/2014_10_08/19139)
+ [ActionController::Live](http://www.techscore.com/tech/Ruby/rails-4.0/actioncontroller-live/)