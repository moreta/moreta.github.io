Data classes
=================

We frequently create a class to do nothing but hold data. In such a class some standard functionality is often mechanically derivable from the data. In Kotlin, this is called a data class and is marked as data:

```kotlin
data class User(val name: String, val age: Int)
```

The compiler automatically derives the following members from all properties declared in the primary constructor:

+ `equals()/hashCode()` pair,
+ `toString()` of the form `"User(name=John, age=42)",`
+ `componentN()` functions corresponding to the properties in their order of declaration,
+ `copy()` function (see below).