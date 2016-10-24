Vuex
=======

# State

+ Vuex uses a single state tree
+ 一つのobjectでアプリケーション全体のstateを管理するのは面倒
  + 使う場所でいちいちimportして使う必要もでてくる。
  + vuexではinjectを利用して、すべての子componentへ`store`変数として使えるようにしてくれる。


以下のようにroot instanceへinjectされる

```js
const app = new Vue({
  el: '#app',
  // provide the store using the "store" option.
  // this will inject the store instance to all child components.
  store,
  components: { Counter },
  template: `
    <div class="app">
      <counter></counter>
    </div>
  `
})
```

child componentでは`this.$store`で参照する

```js
const Counter = {
  template: `<div>{{ count }}</div>`,
  computed: {
    count () {
      return this.$store.state.count
    }
  }
}
```
### The `mapState` Helper

+ storeをいちいち定義するの面倒さを解決してくれる。
+ returnはobjctはので、`mapState`によるglobal state(store)とlocal computedを一緒に使う場合にはspread operatorを使う

spread operatorを使う例

```js
computed: {
  localComputed () { /* ... */ },
  // mix this into the outer object with the object spread operator
  ...mapState({
    // ...
  })
}
```