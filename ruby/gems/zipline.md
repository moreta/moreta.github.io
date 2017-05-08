

# メリット

+ Removes need for large disk space or memory allocation to generate zips, even huge zips. So it works on Heroku.
+ The user begins downloading immediately, which decreaceses latency, download time, and timeouts on Heroku.


# References

+ [zipline - A gem that lets you stream a zip file from rails](https://github.com/fringd/zipline)
+ [S3から複数のファイルを取得しつつ on-the-fly でZipを作ってブラウザに返す](https://doruby.jp/users/nakamatsu/entries/S3%E3%81%8B%E3%82%89%E8%A4%87%E6%95%B0%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E5%8F%96%E5%BE%97%E3%81%97%E3%81%A4%E3%81%A4-on-the-fly-%E3%81%A7Zip%E3%82%92%E4%BD%9C%E3%81%A3%E3%81%A6%E3%83%96%E3%83%A9%E3%82%A6%E3%82%B6%E3%81%AB%E8%BF%94%E3%81%99)