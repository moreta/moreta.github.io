---
title: Spring HATEOAS
date: 2016-06-29
tags: spring, restful, hateos
---


# REST, HATEOAS

+ REST : Representational State Transfer
+ HATEOAS : Hypermedia as the Engine of Application State

ことば難しい

# HATEOAS

Hypermedia is an important aspect of REST. It allows you to build services that decouple client and server to a large extent and allow them to evolve independently. The representations returned for REST resources contain **not only data, but links to related resources**. Thus the design of the representations is crucial to the design of the overall service


+ まず、基本はRest
+ その上に、上の意味でのアプリの「状態」を表現するXMLないしJSON表現をアプリケーション固有のものとして定義
+ 個々の状態を表現するXML/JSONに、固有のMimeTypeを与える
+ その表現の中に、リンクが含まれている
+ リンクを辿ることが、アプリケーションの状態遷移である。
+ この場合、クライアントの役割は、HATEOASなAPIのブラウザになる。
+ 結果として状態遷移とフロー構造を外在化・明示化することになる
+ 結果として、Restful APIを介して、クライアントとサーバのより明確な構造的分離が達成できる

# References

+ [REST: From GET to HATEOAS](http://www.slideshare.net/josdirksen/rest-from-get-to-hateoas)
+ [HATEOS](https://en.wikipedia.org/wiki/HATEOAS)
+ [Building a Hypermedia-Driven RESTful Web Service](http://spring.io/guides/gs/rest-hateoas/)
+ <http://uehaj.hatenablog.com/entry/hateoas>
