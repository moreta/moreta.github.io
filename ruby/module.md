

モジュールはクラスのようにオブジェクトを作成することはできない。

## モジュールの使用方法

+ 関数のようにモジュール内に定義されたメソッドを実行
+ クラスの中にインクルードする

## モジュールを関数のように実行するには - module_function

+ モジュール内のメソッドをモジュール関数として実行できるように設定する必要があります。
+ モジュール関数とは、プライベートメソッドであると同時に モジュールの特異メソッドでもあるようなメソッドです。
+ 例えば Math モジュールのメソッドはすべてモジュール関数です。

```rb
module ModuleName
  def hoge_method
    ...
  end
  module_function :hoge_method
end

# call
# モジュールはクラスのようにオブジェクトを作成出来ませんので、このようにモジュール名を指定してメソッドを実行します
ModuleName.hoge_method
```


# References

+ [モジュールを関数のように使う](http://www.rubylife.jp/ini/module/index2.html)
+ [RubyのModule#module_functionの使い道が良く分かりません](http://qa.atmarkit.co.jp/q/37)
