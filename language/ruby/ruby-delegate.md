Ruby Delegate
=====================

ruby委譲(deleation)をするためにも以下の２つの方法をついう

+ forwardableを利用
  + forwardable は明示的に指定したメソッドだけを委譲する
+ delegateを利用
  + delegate はほぼすべてのメソッドを委譲します

forwardableを使うのはいい。delegateを古い

# forwardable

forwardable.rb は、

+ Forwardable
  + クラスに対してメソッドの委譲機能を定義するモジュール
+ SingleForwardable
  + オブジェクトに対してメソッドの委譲機能を定義するモジュール

```rb
require 'forwardable' # 1. Forwardableをrequire

class Delegation
  extend Forwardable # 2. Forwardableをextendする

  def_delegators :@base, :method2, :method3 # 3. delegateするmethodを定義、method1は委譲しない

  def initialize(base)
    @base = base
  end

  # 4. method1は委譲しないので、直接定義してcustomizeして利用
  def method1
    print 'Hello '
    @base.method1
  end
end
```

# delegate

```ruby
require 'delegate'

class Assistant

  def initialize(name)
    @name = name
  end

  def read_email
    "(#{@name}) It's mostly spam."
  end

  def check_schedule
    "(#{@name}) You have a metting today"
  end
end

class Manager < DelegateClass(Assistant)
  def initialize(assistant)
    super(assistant)
  end

  def attend_meeting
    "Please hold my calls."
  end
end
```

DelegateClass() is a Mimic Method that creates and returns a new Class.
This class defines a method_missing() that forwards calls to a wrapped object, such as an Assistant.
Manager inherits this method_missing( ), so it becomes a proxy of the wrapped object.
As a result, the Manager forwards to her Assistant all the messages she doesn’t understand:

```rb
frank = Assistant.new("Frank")
anne = Manager.new(frank)
anne.attend_meeting
anne.read_email
anne.check_schedule
# => "Please hold my calls."
# => "(Frank) It's mostly spam."
# => "(Frank) You have a meeting today."
```


# References

+ [標準添付ライブラリ紹介 【第 6 回】 委譲](http://magazine.rubyist.net/?0012-BundledLibraries)
+ [Rubyでdelegation(委譲)を簡単にする2つの方法](http://qiita.com/w650/items/671cc9c49b2ebf60620d)
