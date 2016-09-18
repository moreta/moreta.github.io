---
title: Javascript WHATWG Fetch API
date: 2015-12-25
tags: es6, javascript, fetch, WHATWG
---


# spec実装

+ [WHATWG fetch](https://github.com/github/fetch/)
+ [Isomorphic WHATWG Fetch API]()


# spec内容

+ [MDN - Using_Fetch#Checking_that_the_fetch_was_successful](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch#Checking_that_the_fetch_was_successful)
+ [fetch-and-errors](https://www.tjvantoll.com/2015/09/13/fetch-and-errors/)


+ fetch() API only rejects a promise when a “network error is encountered, although this usually means permissions issues or similar.
  + ネットワークエラーなどの場合にpromiseをrejectする
  + つまり、そうでないときにはokってこと
    + これは**重要**。なぜなら400などにもエラーにならずcatchされないから
  + なのでapi設計するときに


## methods

### `response.ok`

+ HTTP response’s status code is in the successful range or not. For instance the following code logs “Error: Internal Server Error(…)”:
+ okのstatusコードは
  + <https://developer.mozilla.org/en-US/docs/Web/API/Response/ok>
  + status in the range 200-299
    + `if (response.status >= 200 && response.status < 300) {`


### errorの時の注意点

+ errorの時には*body*を取得できない！！！
  + <https://www.tjvantoll.com/2015/09/13/fetch-and-errors/#comment-2254452454>
+ fetch apiではresponseが帰ってくるならそれはerrorではない。
  + api設計のときに
+ [サブスタックがFetchの仕様についてガチギレしてるのでまとめた]<https://gist.github.com/yosuke-furukawa/aa39aa09edeeefa7fda4>


# no-corsについて

+ <https://developer.mozilla.org/ja/docs/Web/API/Request/mode>
+ <https://jakearchibald.com/2015/thats-so-fetch/>

`//google.com`へrequestすると失敗するが、それは request, responseにcors headerがないから
corsが必要ないなら`no-cors`で解決できる

# 代わり

+ [got](https://github.com/sindresorhus/got)
+ [superagent](https://github.com/visionmedia/superagent)
