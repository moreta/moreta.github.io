# infinite scroll vs pagination

[UX: Infinite Scrolling vs. Pagination](https://uxplanet.org/ux-infinite-scrolling-vs-pagination-1030d29376f1)

これはよんで置くべき
UXの違いとpros consで整理されている

# infinite scrollでの問題

## 1. history backでロードしたすべてのコンテンツが表示されない

もし、scrollとurlを変更しているのであれば、browserの戻るボタンで戻ると特定ページのみに表示されるようになる
(browserのback forward cacheが動作する場合もあるが、しないときもあるので確実ではない )

## 2. SEO的によくない？

## 3. scroll upへの対応

infinite scrollにすると scroll upは paginationでのページ遡りと同じ。
しかし、scroll upの対応もそう簡単ではない

### scroll upでのurl changeするコードはこれを参考に

<https://github.com/wataruoguchi/clever-infinite-scroll>

## 4. google analticsの追加コードが必要

ページ遷移のeventをanalyticsに送るため、追加のjsコードが必要

# References

+ [mugen scroll](https://github.com/egoist/vue-mugen-scroll)
  + star数はすくないけどsimpleでいい egoist
+ [Vue.js2.x系でInfinite Scroll（無限スクロール）を実装する](http://kuroeveryday.blogspot.jp/2017/07/infinite-scroll-with-vuejs.html)
  + [vue.jsでInfinite Scrollを実装する](http://int128.hatenablog.com/entry/2015/02/18/230206)
+ [vuejsで無限ロードを実装](https://qiita.com/yoneapp/items/650806a35fa9f62dbeae)
  + <https://github.com/ElemeFE/vue-infinite-scroll>
  + <https://github.com/PeachScript/vue-infinite-loading>