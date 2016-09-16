---
title: Ruby Delegate
date: 2014-01-27
tags: ruby, delegate
---


``` ruby
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

```
frank = Assistant.new("Frank") anne = Manager.new(frank)
anne.attend_meeting
anne.read_email
anne.check_schedule
# => "Please hold my calls."
# => "(Frank) It's mostly spam."
# => "(Frank) You have a meeting today."
```