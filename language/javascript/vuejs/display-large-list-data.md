Vue.jsで大量リストを表示する
===========================


```html
<div id="app">
 <div style="overflow:auto;height:170px;"
      @scroll="getScrollParam">
  <ul :style="listStyle">
    <li style="height:17px" 
        v-for="num in displayList">{{num}}</li>
  </ul>
 </div>
</div>
```

```js
new Vue({
    el: '#app',
    data: function(){
      return {
        list:list,
        scroll:0,//スクロール量
        scrollMax: (list.length - displayRowNum) * listItemHeight //最大のスクロール量
      }
    },
    computed:{
      displayList:function(){
        //ユーザーの目に映るところだけリストを描画する
        var startIndex = parseInt(this.scroll/listItemHeight,10);
        return this.list.slice(startIndex,startIndex+displayRowNum);
      },
      listStyle:function(){
        //domを並べる代わりにpaddingでダミーの高さを出す
        return {
         'padding-top':this.scroll + 'px',
         'padding-bottom':(this.scrollMax - this.scroll) + 'px',
         'margin':0
        }
      }
    },
    methods:{
        getScrollParam:function(e){
          this.scroll = e.target.scrollTop;
        }
    }
})
```


# References

+ [Vue.jsで10万件のリストを表示する](http://qiita.com/huigo/items/2cf756a8c3b1bca74a46)
  + [demo](https://jsfiddle.net/tf0aLybk/)