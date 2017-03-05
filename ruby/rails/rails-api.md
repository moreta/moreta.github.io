Rails API開発
==============

# APIを実装するのに必要な要素

+ API keys.
+ API Versioning.
+ API Request Authentication.
+ Request throttling (optional).


# Rails5なら以下３つの記事は読んで置こう

+ [Building the Perfect Rails 5 API Only App](http://sourcey.com/building-the-prefect-rails-5-api-only-app/)
+ [Securing an API in Rails 5 using Token Based Authentication](https://rubyplus.com/articles/4311-Securing-an-API-in-Rails-5-using-Token-Based-Authentication)
  + Rail5で authenticate_with_http_tokenを利用する方法
+ [RailsでAPIの簡単なトークン認証を実装する](http://qiita.com/Yarimizu14/items/c81a8cf1859f954b953e)
  + authenticate_with_http_token
  + authenticate_or_request_with_http_token

# api keyの実装について

[Api keys](/api/api-key.md)

# References

* [Building the Perfect Rails 5 API Only App](http://sourcey.com/building-the-prefect-rails-5-api-only-app/)
* <http://qiita.com/hurutoriya/items/9249d9f7a7d56382d693>
* <http://qiita.com/milkcocoa/items/5a4656ee1fd51e86e57e?utm_content=bufferdc66b&utm_medium=social&utm_source=facebook.com&utm_campaign=buffer>
* [grape-swaggerでgrapeでつくったAPIのドキュメントを自動生成する](http://qiita.com/kazuph/items/7a63d1cf22f2c6ab509d)
+ [RailsでAPIの簡単なトークン認証を実装する](http://qiita.com/Yarimizu14/items/c81a8cf1859f954b953e)
  + authenticate_with_http_token
  + authenticate_or_request_with_http_token