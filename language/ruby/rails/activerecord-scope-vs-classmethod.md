
# scopeとclass methodでscopeと同じようなことをするメソッドの違いについて


## scope example

rails 3

```ruby
class Post < ActiveRecord::Base
  scope :published, where(status: 'published') #  this deprecated in Rails4
  scope :draft, -> { where(status: 'draft') } 
end
```

## class method example

```ruby
class Post < ActiveRecord::Base

  # syntax
  def self.scope(name, body)
    singleton_class.send(:define_method, name, &body)
  end

  # parameterがない場合
  def self.published
    where(status: 'published')
  end

  # parameterがある場合
  def self.by_status(status)
    where(status: status) if status.present?
  end
end
```

* 上記のby_statusを''のparameterで実行してみるとエラーになる
* 原因はscopeとの違いから発生する

```ruby
Post.by_status('').recent
NoMethodError: undefined method `recent' for nil:NilClass
```

# 違いは?

The difference is that a scope will always return a relation, whereas our simple class method implementation will not. The class method should look like this instead

## なのでこの２つは同じ

scope

```ruby
scope :by_status, -> status { where(status: status) if status.present? }
```

class method
```ruby
def self.by_status(status)
  if status.present?
    where(status: status)
  else
    all # ここに注意
  end
end
```

# References

[Active Record scopes vs class methods](http://blog.plataformatec.com.br/2013/02/active-record-scopes-vs-class-methods/)