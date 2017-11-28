Object initializer
=========================


オブジェクト初期化子を使えば、関数オブジェクトの name プロパティを自由な文字列にできることが分かりました。
これを使って、実行時に任意の「関数名」を付けてみましょう。
ES6 からは、オブジェクト初期化子のプロパティ名部分に式を使うことができます。
括弧 [] で囲み任意の式を置きます。


# New notations in ECMAScript 2015 (ECMAScript 2015 での新しい表記法)

+ これが、よくfluxアーキテクチャーで使われる表記法

```js
// Shorthand property names (ES2015)
var a = 'foo', b = 42, c = {};
var o = {a, b, c};

// Shorthand method names (ES2015)
var o = {
  property([parameters]) {}
};

// Computed property names (ES2015)
var prop = 'foo';
var o = {
  [prop]: 'hey',
  ['b' + 'ar']: 'there'
};
```

vuexでこれを利用して、mutationを定義する

```js
// mutation-types.js
export const SOME_MUTATION = 'SOME_MUTATION'
// store.js
import Vuex from 'vuex'
import { SOME_MUTATION } from './mutation-types'

const store = new Vuex.Store({
  state: { ... },
  mutations: {
    // we can use the ES2015 computed property name feature
    // to use a constant as the function name
    [SOME_MUTATION] (state) {
      // mutate state
    }
  }
})
```


# References

+ [Object initializer](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
  + [オブジェクト初期化子](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Object_initializer)

Computed property names
+ [Computed property names](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#Computed_property_names)
  + [計算されたプロパティ名](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Object_initializer#計算されたプロパティ名)
+ [オブジェクト初期化子 —— 計算によるプロパティ名](https://qiita.com/8x9/items/34272b59b5aa68e33256#%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E5%88%9D%E6%9C%9F%E5%8C%96%E5%AD%90--%E8%A8%88%E7%AE%97%E3%81%AB%E3%82%88%E3%82%8B%E3%83%97%E3%83%AD%E3%83%91%E3%83%86%E3%82%A3%E5%90%8D)