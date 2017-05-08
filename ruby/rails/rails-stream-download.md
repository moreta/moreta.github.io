
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

## sample1 - streamingを利用

+ <https://gist.github.com/lexmag/3259481>
+ [Streaming Large Data Responses with Rails](https://coderwall.com/p/kad56a/streaming-large-data-responses-with-rails)
+ [Stream CSV Files In Rails Because You Can](https://medium.com/table-xi/stream-csv-files-in-rails-because-you-can-46c212159ab7)
+ [ActiveAdminでCSVダウンロード機能をカスタマイズする](https://blog.hello-world.jp.net/ruby/1335/)



```ruby
class PostsController < ApplicationController
  # rails3
  def stream

    headers['X-Accel-Buffering'] = 'no' # Stop NGINX from buffering
    headers['Cache-Control'] = 'no-cache'
    headers['Content-Type'] = 'text/csv'
    # headers['Content-Type'] = 'text/event-stream'
    headers["Transfer-Encoding"] = "chunked" # Chunked response header
    headers["Content-Disposition"] = %(attachment; filename="#{csv_filename}")
    headers["Last-Modified"] = Time.zone.now.ctime.to_s
    headers.delete("Content-Length") # See one line above

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

  # http://stackoverflow.com/questions/3507594/ruby-on-rails-3-streaming-data-through-rails-to-client/11386840
  def stream_csv
  respond_to do |format|
    format.csv {
      @filename = "responses-#{Date.today.to_s(:db)}.csv"
      self.response.headers["Content-Type"] ||= 'text/csv'
      self.response.headers["Content-Disposition"] = "attachment; filename=#{@filename}"
      self.response.headers['Last-Modified'] = Time.now.ctime.to_s

      self.response_body = Enumerator.new do |y|
        i = 0
        Model.find_each do |m|
          if i == 0
            y << Model.csv_header.to_csv
          end
          y << sr.csv_array.to_csv
          i = i+1
          GC.start if i%500==0
        end
      end
    }
  end
end

  # rails 4以降
  # The new approach
  # include ActionController::Live
  def stream
    headers['Content-Type'] = 'text/event-stream'

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

###　原理は？
+ calling next on the enumerator to get the next chunk of data


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