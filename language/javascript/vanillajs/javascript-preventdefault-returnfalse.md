preventDefaultとreturn false & stopPropagationの違い
=====================================================


# a tagでの動作のちがい

## preventDefault()

+ 親要素へのバブリング（伝達）を保ちながら、
+ aタグのリンク機能を無効化する。


```js
$('#iphone_appli_item_code').val()$(function(){
  $('a').click(function(event){
    event.preventDefault();
    $("div#Content").addClass("hoge");
  });
});
```

## return false を使う

+ そのクリックイベントを親要素へ伝えない。
+ aタグ自体のリンク機能を無効化し、


## stopPropagation()

+ バブリングをストップして、
+ aタグリンクの機能は維持する。




# References

+ [aタグの無効化 - preventDefaultとreturn falseの違いとか](http://qiita.com/mwtonbel/items/f3c6e2373c348ea74b19)