---
title: "Ruby Class"
date: 2013-11-05
tags: ruby, class
---


``` ruby
"hello".class # => String
String.class # => Class
```

``` ruby
inherited = false
Class.instance_methods(inherited) # => [:superclass, :allocate, :new]

String.superclass       # => Object
Object.superclass       # => BasicObject
BasicObject.superclass  # => nil

Class.superclass        # => Module
Module.superclass       # => Object
```

*ClassとModuleはちょっと特別だ。*


## ObjectがKernelをincludeしている。


``` ruby
Object.class # => Class
BasicObject.class # => Class
Class.class # => Class
Module.class => Class
```

```
2.0.0p247 :013 > String.ancestors
 => [String, Comparable, Object, Kernel, BasicObject]
```
ComparableとKernelは*Module*

他の例

```
2.0.0p247 :028 >   module M
2.0.0p247 :029?>   def my_method
2.0.0p247 :030?>     'M#mymethod'
2.0.0p247 :031?>     end
2.0.0p247 :032?>   end
 => nil
2.0.0p247 :033 > class C
2.0.0p247 :034?>   include M
2.0.0p247 :035?> end
 => C
2.0.0p247 :036 > class D < C; end
 => nil
2.0.0p247 :037 > D.new.my_method()
 => "M#mymethod"
2.0.0p247 :038 > D.ancestors
 => [D, C, M, Object, Kernel, BasicObject]
```

MとKernelは*Module*

```
BasicObject
↑
(Module)Kernel # included by Object
↑
Object
↑
(Module)M # included by C
↑
C
↑
D
```

## load & require

* loadはコードを実行するため
* requireはlibraryをimportするため