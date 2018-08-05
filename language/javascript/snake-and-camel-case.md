

# camelCaseとsnake_case変換

rubyのconventionはsnake_caseそのほかは特にjsははcamelCaseなのでどこかで、変換する必要がある

基本はサーバー側で変換する方針

+ camelCaseを使うclientが多いの
+ client側での変換は変換コストがある?
  + まあ、serverで変換しても変換コストをサーバーが持つことになるのは同じ

サーバー側で変換が難しい場合は、clientで変換する

+ サーバーのシステム改修が難しい場合がある
  + 改修する人がいないとか、versionが低くて利用できるgemがなく自前で書かないといけないとか


# railsで変換 - olive_branch & jbuidler
rails4から
## request

* olive_branch
* clientでrequestにX-Key-Inflectionを入れる必要がある

## response
json responseでは jbuilderの `key_format`を利用する


```
# 全部
Jbuilder.key_format camelize: :lower

# 適用したい部分だけ
json.key_format! camelize: :lower
```


# jsでの変換 - humps

## Axiosと Humpsを利用して api 送信のときに camelCase to snake_case変換
* [Making Axios play nicely with a Rails API](https://medium.com/@mikerelated/making-axios-play-nicely-with-a-rails-api-949782fccd2e)
* [humps : Underscore-to-camelCase converter (and vice versa) for strings and object keys in JavaScript](https://github.com/domchristie/humps)


axiosの

# swiftでの変換 - codable