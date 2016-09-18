---
title: Ruby block
date: 2014-02-28
tags: ruby, proc, lambda, block
---





## Procとlambdaの違い
* Procの場合追加のパラメータはnilに設定する
* lambdaはエラーを返す

두번째 다른 점은 lambda는 diminutive return을 할 수 있다는 점이다. 예컨데, Proc는 값을 반환하면 메서드를 중단한다. 따라서 메서드의 최종 반환 값은 Proc의 반환값이 된다. 하지만 lambda는 반환 후에도 메서드가 계속 된다. 다음 예를 보자.



## 参考

<http://www.joinc.co.kr/modules/moniwiki/wiki.php/Site/Ruby/ProcsLambdaBlocks>