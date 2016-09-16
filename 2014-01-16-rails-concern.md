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

```
mkdir -p app/controllers/concerns
touch    app/controllers/concerns/.keep
mkdir -p app/models/concerns
touch    app/models/concerns/.keep
```

application.rb設定

```
config.autoload_paths                  += %W(
      #{config.root}/app/controllers/concerns
      #{config.root}/app/models/concerns
      #{config.root}/lib
    )
```


```
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