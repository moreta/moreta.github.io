API Key
=========

一番簡単な方法だと
以下のように apiKeyIdとapiKeySecretをbase64 encodingした物

```js
var encodedData = new Buffer('apiKeyId:apiKeySecret').toString('base64');
var authorizationHeader = 'Basic: ' + encodedData;
```

# References

+ [The Problem with API Authentication in Express](https://stormpath.com/blog/the-problem-with-api-authentication-in-express)
+ [Securing an API in Rails 5 using Token Based Authentication](https://rubyplus.com/articles/4311-Securing-an-API-in-Rails-5-using-Token-Based-Authentication)
  + Rail5で authenticate_with_http_tokenを利用する方法
+ [RailsでAPIの簡単なトークン認証を実装する](http://qiita.com/Yarimizu14/items/c81a8cf1859f954b953e)
  + authenticate_with_http_token
  + authenticate_or_request_with_http_token