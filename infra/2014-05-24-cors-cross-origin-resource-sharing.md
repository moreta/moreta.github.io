---
title: CORS (cross origin resource sharing)
date: 2014-05-24
tags: cross-domain
---



CORS (Cross-Origin Resource Sharing)
===================================

<http://dev.classmethod.jp/cloud/cors-cross-origin-resource-sharing-cross-domain/>


CORS(Cross-Origin Resource Sharing)は、その名の通り、ブラウザがオリジン(HTMLを読み込んだサーバのこと)以外のサーバからデータを取得する仕組みです

JSONPという仕組みを使ってできちゃう。抜け道的なやり方で使われていました

## S3でCORSの設定ができるようになった
S3でCORSの設定ができるようになって嬉しいことは何でしょうか。例えば、オリジンWebサイトがEC2で動いていたとします。読み込んだHTML内のJavaScriptでは、動的にパラメータを読み込んでいます。CORS設定が無い場合には、EC2を経由してブラウザに返していたりJSONPを使っていましたが、CORS設定があれば、JavaScript内のAjax通信でクロスドメインのS3から情報をダイレクトに取得できます。
逆に、S3をオリジンWebサイトとして運用している場合は、EC2側でCORS設定を行う事で、S3とEC2のドメインが異なっていたとしてもAjax内で呼び出しができるようになります。今まで、S3を起点としたWebページの場合、EC2の動的プログラムを呼び出すにはJSONPを使った方法しか無かったのですが、普通のJSON呼び出しをはじめ、JSP/PHP/Ruby/Python/ASP等を呼び出せるようになりました。さらに、S3はキャッシュサーバとしてCloudFrontのオリジンとしても動きますので、トップページをCloudFrontにして静的コンテンツは全てここから配信し、動的コンテンツをCORSを使って呼び出す事が出来て、各サーバの役割分担がより明確になります。

## S3は基本ストレージサービスだが、最近は静的WEBページを運用するにも使われる

## S3でCORSの設定

Bucket > Add CORS Configuration


```
<CORSConfiguration>
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <MaxAgeSeconds>3000</MaxAgeSeconds>
    <AllowedHeader>Authorization</AllowedHeader>
 </CORSRule>
</CORSConfiguration>
```

# 他

* [JSONP などクロス ドメイン (Cross-Domain) 問題の回避と諸注意](http://blogs.msdn.com/b/tsmatsuz/archive/2011/06/24/cross-site-cross-domain-browser-https-ssl-javascript-silverlight-access.aspx)
* [w3c](http://www.w3.org/TR/cors/)


############

OPTIONS methodについて
<http://stackoverflow.com/questions/12320467/jquery-cors-content-type-options>

* This OPTIONS request is the CORS preflight request.
* It is a request that is sent to the server before the actual request in order to ask permissions to make the request

The custom Content-Type is in fact triggering the preflight. According to the CORS spec (http://www.w3.org/TR/cors/), any Content-Type other than application/x-www-form-urlencoded, multipart/form-data, or text/plain triggers the preflight.

If you have no control over the remote server, then you'll need to either ask them to support CORS preflight, or try some other option such as JSON-P.

If you do have control over the remote server, you can change it to handle preflights. In order to handle a preflight request, you should send the following headers in the response to the OPTIONS request:

Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: POST
Access-Control-Allow-Headers: Content-Type
The response should be an HTTP 200. The Access-Control-Allow-Methods response header can either echo the value of the Access-Control-Request-Method, or it can just be GET, POST, PUT, DELETE to support all methods. The Access-Control-Allow-Headers response header should echo the values in the Access-Control-Request-Headers request header.

Once the browser receives those headers, it will make the actual request. You can learn more about CORS preflight requests here:

<http://www.html5rocks.com/en/tutorials/cors/>

<http://stackoverflow.com/questions/20087584/jquery-and-rails-ajax-request-and-response>


## CORSを解決してもjson parameterをparseする部分でエラーがでる場合

**JSON.stringifyを利用**

<https://developer.mozilla.org/ja/docs/JavaScript/Reference/Global_Objects/JSON/stringify>

`data : JSON.stringify({name:"ravi",age:"31"}),`


jqueryを利用したajax post sample
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script>  
      function doCors(){
        $.ajax({
          type: "post",
          dataType: "json",
          contentType: "application/json",
          data: JSON.stringify({ "items": [{ "code": "test1" , "name": "aaa"},{ "code": "test2" , "name": "bbb" }]}),
          url : "https://your_api/xxx.json",
          success : function( json ){
            $("#msg").append("success : "+json.success+" : "+json.xxxx + "<br>");
          },
          error : function (xhr,text,thrown){
            $("#msg").text("error : "+text);
          }
        });
      }
    </script>
    </head>
    <body>
        <input type="button" value="CORS Test" onclick="doCors()"><br>
        <p id="msg"></p>
    </body>
</html>
```

# rails CORS header
 
<http://www.tsheffler.com/blog/?p=428>

## CORSのリクエスト順番とOPTION method

たとえ以下のようなjson requestがあったとしよう

`GET http://othersite.com/method.json`

このリクエストが送られる前にブラウザは以下のようなリクエストを先に送る

```
OPTIONS http://othersite.com/method.json
Origin: http://mysite.com
Access-Control-Request-Method: GET
```

その後、サーバは以下のようにresponse
```
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET, POST, OPTIONS
Access-Control-Max-Age: 1728000
Content-Length: 0
Content-Type: text/plain
```

次にもともとをrequestを送る

`GET http://othersite.com/method.json`

### このOPTION methodを対応するには？

OPTIONS requestに対するresponseを返す必要がある

#### rails

```
before_filter :cors_preflight_check
after_filter :cors_set_access_control_headers

# For all responses in this controller, return the CORS access control headers.

# ここは元のrequestのため
def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Max-Age'] = "1728000"
end

# If this is a preflight OPTIONS request, then short-circuit the
# request, return only the necessary headers and return an empty
# text/plain.

# ここはOPTIONS method requestのresponseのため
def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end
```
#### rails gem

railsのgemを利用する場合

`gem 'rack-cors', :require => 'rack/cors'`

rackレベルでヘッダを処理してくれる

application.rb
```    
module YourApp
  class Application < Rails::Application
  ...
    config.middleware.use Rack::Cors do
       allow do
         origins '*'
         resource '*', :headers => :any, :methods => [:get, :post, :options]
       end
     end
  ...
  end
end
```

# nginx

```

 # CORS対応
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Allow-Credentials' 'true';
add_header 'Access-Control-Allow-Headers' 'Content-Type,Accept';
add_header 'Access-Control-Allow-Method' 'GET, POST, OPTIONS, PUT';

 # 条件付き
if ($http_origin ~ "^(http://developers.example.com|http://example.com)$") {
    add_header "Access-Control-Allow-Origin" $http_origin;
}

```
