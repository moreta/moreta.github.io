Vueでのmixinとplugin
===========================

共通化のためmixinとpluginを用途を分けて使う

## mixinを使う

* 追加して。。

## pluginを使う

* importを書くのが面倒くさい
  * lodashをplugin化するとimportを減らせる
* vuexの`$store`のような instance methodを追加したい場合
* elementのMessageのように method呼び出しで利用するcomponent

# plugin

<https://alligator.io/vuejs/creatingv-custom-plugins/>

# References

+ [Mixins and Plugins in VueJS](https://medium.com/@denny.headrick/mixins-and-plugins-in-vuejs-ecee9b37d1bd)

## plugins sample

+ [This is a small wrapper for integrating lodash into VueJs](https://github.com/Ewocker/vue-lodash)