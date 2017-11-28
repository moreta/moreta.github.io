Ruby Moudle
===============

# モジュールの使用例

+ 関数のようにモジュール内に定義されたメソッドを実行
+ クラスの中にインクルードする

制限

+ モジュールはクラスのようにオブジェクトを作成することはできない。

# モジュールないのコードを利用する方法

* module_functionを利用
* railsなら　ActiveSupport::Concernを利用

# module_function - モジュールを関数のように実行するには

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

## moudle_functionから private methodへアクセス

<https://stackoverflow.com/questions/18518575/accessing-private-methods-from-module-functions-in-ruby>

```rb
module Party

  def enjoy
    puts 'hello'
  end

  def pooper
    enjoy
  end

  private_class_method :enjoy
  module_function :pooper
end

Party.pooper # => 'hello'
Party.enjoy # => private method `enjoy' called for Party:Module (NoMethodError)
```

# ActiveSupport::Concern - rails

Rubyには元から mix-in という処理を切り出す機能があるが、ActiveSupport::Concernを利用するといくつか利点がある

* mix-inの複雑な記述を省略できる
* 複雑な依存関係を考えずにすむ
* include 元のクラスメソッドの記述が簡単にできる
  * 通常のメソッドは特別ない記述無しで利用できる


利用classコード
```rb
class C
  include M
end
 
# foo はクラスメソッド
C.foo
 
# bar はインスタンスメソッド.
C.new.bar
```

before module
```rb
module M
  def self.included(base)
    base.extend(ClassMethods)
  end
 
  module ClassMethods
    def foo
      puts 'foo'
    end
  end
 
  def bar
    puts 'bar'
  end
end
```

after moudle - use ActiveSupport::Concern
```rb
module M
  extend ActiveSupport::Concern
 
  module ClassMethods
    def foo
      puts 'foo'
    end
  end
 
  def bar
    puts 'bar'
  end
end
```



# References

+ [モジュールを関数のように使う](http://www.rubylife.jp/ini/module/index2.html)
+ [RubyのModule#module_functionの使い道が良く分かりません](http://qa.atmarkit.co.jp/q/37)

## ActiveSupport::Concern

+ [ActiveSupport::Concern の存在理由](http://qiita.com/castaneai/items/6dc121ce6ff100614f42)
+ [ActiveSupport::Concern でハッピーなモジュールライフを送る](http://www.techscore.com/blog/2013/03/22/activesupportconcern-%E3%81%A7%E3%83%8F%E3%83%83%E3%83%94%E3%83%BC%E3%81%AA%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%83%A9%E3%82%A4%E3%83%95%E3%82%92%E9%80%81%E3%82%8B/)

## module_function

+ [module_function (Module)](http://ref.xaio.jp/ruby/classes/module/module_function)
+ [instance method Module#module_function](https://docs.ruby-lang.org/ja/latest/method/Module/i/module_function.html)