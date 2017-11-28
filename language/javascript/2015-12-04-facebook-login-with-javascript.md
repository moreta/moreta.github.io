---
title: facebook login with javascript
date: 2015-12-04
tags: js, facebook, login
---


# Javascript SDKを利用

+ [Facebook login web][1]
+ [https://developers.facebook.com/quickstarts/?platform=web][2]

## もし、javascript SDKを使えない場合でもlogin連携はできる。

If for some reason you can't use our JavaScript SDK you can also implement login without it. We've build a separate guide to follow if you need to implement login manually.

- [Facebook manually build a login flow][3]

# Quickstart

一番最初に簡単なsample

appを作ってないならここからappを先に作って置こう

[https://developers.facebook.com/apps/][4]

1. Full Code Exampleをhtmlにcopyしbrowserで確認する
2. localhostのURLを Quickstartsの Tell us about your websiteに入れたらfacebookのlogin buttonが表示される

## Steps for Using Facebook Login With the JavaScript SDK

1. Checking the login status to see if someone's already logged into your app. During this step, you also should check to see if someone has previously logged into your app, but is not currently logged in.
2. If they are not logged in, invoke the login dialog and ask for a set of data permissions.
3. Verify their identity.
4. Store the resulting access token.
5. Make API calls.
6. Log out.


### Checking login status

+ 一番最初に

```html
<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
```

```js
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}
```

response

```json
{
    status: 'connected',
    authResponse: {
        accessToken: '...',
        expiresIn:'...',
        signedRequest:'...',
        userID:'...'
    }
}
```



#### responseのstatusには以下のような状態がある

+ connected
  + facebookとfacebook app全部loginしている状態
+ not_authorized
  + facebookにはloginしているが、appにはloginしていない状態
+ unknown

## Logging people in

一番簡単な Login dialogを表示するように。。。

## Invoking the Login Dialog with the JavaScript SDK

+ `FB.login`を呼ぶことで login dialogが表示される
+ `<fb:login-button>`は  `FB.login`が内蔵されている?

```js
FB.login(function(response){
  // Handle the response object, like in statusChangeCallback() in our demo
  // code.
});

// scope optionを利用する場合
FB.login(function(response) {
  // handle the response
}, {scope: 'public_profile,email'});
```

## Handling Login dialog response

+ login dialog responseをハンドリング
+ ユーザがなにを選択したか関係なくresponse dataをくれる。
+ javascrit SDKを利用する場合 authResponse objectがreturnされる

```js
FB.login(function(response) {
  if (response.status === 'connected') {
    console.log(response.authResponse.accessToken); // access token
    // Logged into your app and Facebook.
  } else if (response.status === 'not_authorized') {
    // The person is logged into Facebook, but not your app.
  } else {
    // The person is not logged into Facebook, so we're not sure if
    // they are logged into this app or not.
  }
});
```

## Storing Access Tokens

+ At the end of the login process, an access token is generated.
+ The Facebook SDK for JavaScriptは自動にaccesstokenを保存と追跡をハンドリングするので特にすることはないけど、サーバーへ送信するなどを処理をすることもできる

## Verifying identity

+ If you decide to send it back to the server, you should make sure you re-verify the access token once it gets to the server
+ Re-verifying the token is covered in our documentation on manually building login flows. You'll need to verify that the app_id and user_id match what you expected from the access token debug endpoint
+ serverへ送信する場合には access tokenをre-verityすること
+ re-verify関連した flowはここから
  + <https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow#checktoken>

```js
FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    console.log(response.authResponse.accessToken);
  }
});
```

## Make API calls

```js
FB.api('/me', function(response) {
    console.log(JSON.stringify(response));
});
```

## Loggin people out(logout)

```js
FB.logout(function(response) {
   // Person is now logged out
});
```

# access token

[https://developers.facebook.com/docs/facebook-login/access-tokens][5]

+ UserAccessToken
+ AppAccessToken
+ PageAccessToken

## UserAccessToken






# References

+ [facebook guide][6]
+ [react mixin][7]
+ [react facebook login][8]
+ [react google login][9]
+ [1. Facebook API 公式ドキュメント翻訳 アクセストークンについて][10]

[1]:	https://developers.facebook.com/docs/facebook-login/web
[2]:	https://developers.facebook.com/quickstarts/?platform=web
[3]:	https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow
[4]:	https://developers.facebook.com/apps/
[5]:	https://developers.facebook.com/docs/facebook-login/access-tokens
[6]:	https://developers.facebook.com/docs/facebook-login/web
[7]:	https://github.com/genxstylez/react-oauth-mixin/blob/master/FacebookOAuthMixin.js
[8]:	https://github.com/keppelen/react-facebook-login
[9]:	https://github.com/swamig/react-google-login
[10]:	http://qiita.com/AtsukiTak/items/12b74b1e6aa4e994ac22
