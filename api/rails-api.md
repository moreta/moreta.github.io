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

# api fallbackにどう対応するか？ (fallbacks to previous version)

[API Versioning with Ruby on Rails: What Gems Are the Best](https://yalantis.com/blog/api-versioning-with-ruby-on-rails/)

ここの内容がいい


# References

* [Building the Perfect Rails 5 API Only App](http://sourcey.com/building-the-prefect-rails-5-api-only-app/)
* [grape-swaggerでgrapeでつくったAPIのドキュメントを自動生成する](http://qiita.com/kazuph/items/7a63d1cf22f2c6ab509d)
+ [RailsでAPIの簡単なトークン認証を実装する](http://qiita.com/Yarimizu14/items/c81a8cf1859f954b953e)
  + authenticate_with_http_token
  + authenticate_or_request_with_http_token