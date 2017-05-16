




# Rails controller


```rb
class DownloadController < ApplicationController
  include ActionController::Streaming
  include Zipline

  AWS_S3_REGION = "ap-northeast-1"
  AWS_S3_BUCKET = "zipline-test"

  def zip
    zipline(s3files, "s3files.zip")
  end

  private

  # ダウンロード対象のファイルを順次zipに固めながら chunked response としてクライアントに返す
  def s3files
    s3 = Aws::S3::Client.new(region: AWS_S3_REGION)
    # ダウンロード対象のファイル
    files = %w(
      file1.json
      file2.json
      file3.json
    )
    files.lazy.map do |file|
      logger.debug "get file from s3 : #{file}"
      s3_object = s3.get_object(bucket: AWS_S3_BUCKET, key: file)
      [s3_object.body, file]
    end
  end
end
```

+ ダウンロード対象のファイルを順次zipに固めながら chunked response としてクライアントに返す。部分が肝

# References

+ [S3から複数のファイルを取得しつつ on-the-fly でZipを作ってブラウザに返す](https://doruby.jp/users/nakamatsu/entries/S3%E3%81%8B%E3%82%89%E8%A4%87%E6%95%B0%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%8F%96%E5%BE%97%E3%81%97%E3%81%A4%E3%81%A4-on-the-fly-%E3%81%A7Zip%E3%82%92%E4%BD%9C%E3%81%A3%E3%81%A6%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6%E3%81%AB%E8%BF%94%E3%81%99)