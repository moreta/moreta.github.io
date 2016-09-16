---
title: ruby alias, alias_method
date: 2014-03-04
tags: ruby, alias
---









<http://blog.bigbinary.com/2012/01/08/alias-vs-alias-method.html>


This is because alias is a keyword and it is `lexically scoped`.
It means it treats self as the value of self at the time the source `code was read` .
In contrast alias_method treats self as the value determined `at the run time`.

Overall my recommendation would be to use alias_method.
Since alias_method is a method defined in class Module it can be overridden later and it offers more flexibility