---
title: Spring RestTemplate
data: 2016-09-16
tags: spring, rest, spring-boot
---




# HttpMessageConverter

+ <https://www.ibm.com/developerworks/jp/web/library/wa-restful/>
+ objectと送信ときにtext間のserialize, deserializeを行う


| 実装の種類                         | 機能                                                                                                                                                                               |
|:-----------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| StringHttpMessageConverter         | リクエストとレスポンスのストリングを読み書きします。デフォルトで、メディア・タイプ text/* をサポートし、text/plain という Content-Type で書き込みます。                            |
| FormHttpMessageConverter           | リクエストとレスポンスのデータを読み書きします。デフォルトで、メディア・タイプ application/x-www-form-urlencoded を読み取り、MultiValueMap<String,String> にデータを書き込みます。 |
| MarshallingHttpMessageConverter    | Spring のマーシャラーとアンマーシャラーを使って XML データを読み書きします。メディア・タイプ application/xml のデータを変換します。                                                |
| MappingJacksonHttpMessageConverter | Jackson の ObjectMapper を使って JSON データを読み書きします。メディア・タイプ application/json のデータを変換します。                                                             |
| AtomFeedHttpMessageConverter       | ROME の Feed API を使って Atom フィードを読み書きします。メディア・タイプ application/atom+xml のデータを変換します。                                                              |
| RssChannelHttpMessageConverter     | ROME の Feed API を使って RSS フィードを読み書きします。メディア・タイプ application/rss+xml のデータを変換します。                                                                |


# Unit test

## MockRestServiceServerを使う



# References
+ <http://www.baeldung.com/rest-template>
+ [SpringのRestTemplateを使うコンポーネントのJUnitテストはこう書く！！](http://qiita.com/kazuki43zoo/items/fa9fea1c813f76080fe7)
