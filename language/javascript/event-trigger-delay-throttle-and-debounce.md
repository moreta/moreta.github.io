
# 自動完成や、suggest項目などをAjaxで実装するときにすべてのユーザーinputでajaxをtriggerするとリクエストが多すぎる

1. 方法として`setTimeout`を使う

* The timeout has elapsed, or
* The user switched fields (blur event)

2. lodashの `_.throttle`か `.debounce`を使う

<https://medium.com/vuejs-tips/lodash-throttle-b9baf3213f70>

`_.throttle`を `.debounce`はどても重要な機能である。
ちゃんとしておいたほうがいい機能を作る鍵になる

# throttling & debouncing example

めっちゃーいいsample
<https://css-tricks.com/debouncing-throttling-explained-examples/>

## debounce

The Debounce technique allow us to "group" multiple sequential calls in a single one.

## throttling

By using _.throttle, we don't allow to our function to execute more than once every X milliseconds.


# debounceをcancelする方法

debounceにわたしがfunctionが実行されるまえに別のfunctionが実装されることによって
以前のfunction予約をcancelしたい場合

## vue.jsで

<https://github.com/vuejs/vue/issues/2870>

```js
var $vm = new Vue({
    computed: {
      debounceSetFalse: function () {
        return _.debounce(this.setFalse, 1000)
      }
    },
    methods: {
      setTrue: function () {
        if ($vm.debounceSetFalse) {
          $vm.debounceSetFalse.cancel() // setFalse canceled
        }
        this.some_data = true
      },
      setFalse: function () {
        this.some_data = false
      }
    })
```

# References

+ [How to trigger an event in input text after I stop typing/writing?](https://stackoverflow.com/questions/14042193/how-to-trigger-an-event-in-input-text-after-i-stop-typing-writing)
+ [lodashの_.throttleと_.debounceの使用例](https://qiita.com/akifo/items/4d715929934a458fb189)