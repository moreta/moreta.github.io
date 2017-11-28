ruby meta programming
====================


## core method

[define_singleton_method](http://ruby-doc.org/core-2.2.2/Object.html#method-i-define_singleton_method)

```ruby
# defind
module MessagesDictionary
  def self.included(klass)
    klass.class_exec do # valuates some code in the context of some class
      define_singleton_method :has_messages_dictionary do |opts = {}| # define has_messages_dictionary method by define_singleton_method
      end
    end
  end
end
# usage
class MyClass
  include MessagesDictionary # include module
  has_messages_dictionary

  def greet
    pretty_output(:hi) # Prints "Hello there!" in the terminal
  end
end
```

## tutorial

+ [messages_dictionary gem](https://www.sitepoint.com/learn-ruby-metaprogramming-for-great-good/)
