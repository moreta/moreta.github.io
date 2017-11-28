---
title: React Multi Step Form
data: 2016-08-29
tags: react, form, multistep
---

ReactでMulti stepを軽油してform登録をするためのなやみ

# このblogをみた

+ <https://www.viget.com/articles/building-a-multi-step-registration-form-with-react>
  + [sample demo](http://codepen.io/tommymarshall/pen/yyMOzj)
  + [sample github](https://github.com/tommymarshall/react-multi-step-form/)

## この記事でprogress barの処理部分も確認したらいい

参考になれる

# 簡単に言えば 各stepごとにrenderするcomponentを変更する

+ stepはstateで管理
+ render()で switch分でstateをみて

## Step Componentで行う処理

+ defaultValue will set the starting value of our input
  + React does this instead of using the value attribute in order to account for some funkiness in how HTML handles default field input values. Click here to read more on this topic.
  + <https://facebook.github.io/react/docs/forms.html#advanced-topics>
  + defaultValueはvalueと違う？
  + defaultValueをpropsの値でセットすることによってstepを戻った時に親compoenentからのデータを初期値で表示することができる。
+ next stepに行く時にrefの値を取得して、親からのmethodをcallbackする
  + [refの利用](https://facebook.github.io/react/docs/more-about-refs.html#the-ref-attribute)

## fluxやreduxを利用する方法は？どう？

+ 個人的にはfluxで管理するstoreが無意味に増えるのはさけたい。
+ app全体的に利用する部分、または、いろんなcomponentをまたいで使われるのはstoreが管理するのがいいけど、特定部分だけの利用で大丈夫データはfluxのstoreを利用しないのか管理面でいいと思う。
