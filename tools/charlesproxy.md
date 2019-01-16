# localhostがrecordingされない時に

`localhost`の代わり似
`localhost.charlesproxy.com`を使う

# headerを追加する

Tool > Rewrite から追加する

* [Add header to requests with Charles](https://stackoverflow.com/questions/44168074/add-header-to-requests-with-charles)

# 特定domainだけproxyする

* 見つからなかった
* 表示するrecodingだけなら、Proxy > Record Settingsを利用

# 特定URLを別のURLへmappingする

* [Charlesを使って本番ドメインを向いたアプリのリクエストをlocalhost:3000に飛ばす](https://qiita.com/kazuph/items/67f793e11db3329a6003)

Map Localまたは　Map Remoteを修正
