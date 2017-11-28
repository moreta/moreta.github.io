---
title: Rails Concern
date: 2014-01-16
tags: rails, concern
---


# rails 4

<http://api.rubyonrails.org/classes/ActiveSupport/Concern.html>

<http://stackoverflow.com/questions/14541823/how-to-use-concerns-in-rails-4>


# rails3でのconcern

<http://qiita.com/yoshioota/items/83e7138b6d29b5a9823c>

<http://namakesugi.blog42.fc2.com/blog-entry-137.html>


*active support concern*

<https://github.com/rails/rails/blob/v3.2.9/activesupport/lib/active_support/concern.rb>


directory生成

```sh
mkdir -p app/controllers/concerns
touch    app/controllers/concerns/.keep
mkdir -p app/models/concerns
touch    app/models/concerns/.keep
```

application.rb設定

```rb
config.autoload_paths                  += %W(
      #{config.root}/app/controllers/concerns
      #{config.root}/app/models/concerns
      #{config.root}/lib
    )
```


```rb
module M
  extend ActiveSupport::Concern

  module ClassMethods # ここはそのまま
    ...
  end

  # module InstanceMethods <= ここも不要
  def my_instance_method
    puts "M:instance_method"
  end
  # end <= ここは不要

  # ここに instance methodsを定義

end
```


# ActiveSupport::Concern の存在理由

<http://qiita.com/castaneai/items/6dc121ce6ff100614f42>

mix-inがあるのでconcernをついう利用はなにか？

+ mix-inの複雑な記述を省略できる

## Rubyの mix-inのルール

+ 切り出した機能を module として作成
+ 共通メソッドを module 内に記述
+ クラスメソッドや組み込み先クラスの内部処理を module に入れたい場合は特殊なメソッドを使う必要がある

ActiveSupport::Concern はこの3番目にある 特殊なメソッド の記述を簡単にしてくれます

# References

+ [ActiveSupport::Concern の存在理由](http://qiita.com/castaneai/items/6dc121ce6ff100614f42)
