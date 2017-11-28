---
title : Spring MVC
data: 2016-07-25
tags: spring, spring-mvc
---


# Exception Handling

<http://memorynotfound.com/spring-mvc-exception-handling/>

# Optional RequestMapping

<http://stackoverflow.com/questions/4904092/with-spring-3-0-can-i-make-an-optional-path-variable>

```java
@RequestMapping(value = {"/json/{type}", "/json" }, method = RequestMethod.GET)
public @ResponseBody TestBean typedTestBean(
    @PathVariable Optional<String> type,
    @RequestParam("track") String track) {      
    if (type.isPresent()) {
        //type.get() will return type value
        //corresponds to path "/json/{type}"
    } else {
        //corresponds to path "/json"
    }       
}
```

# `@Controller`と`@RestController`の違い

<http://qiita.com/tag1216/items/3680b92cf96eb5a170f0>



# `@Controller` and `@RestController`と controllerの戻り値など

<http://qiita.com/tag1216/items/3680b92cf96eb5a170f0>

# `@RequestParam` and  `@RequestBody`

get parameterと post bodyの違い？


# `@ModelAttribute` and `@RequestBody`の違い

<http://permanent-til.me/archives/476>

## `@ModelAttribute`

x-www-form-urlencodedで送信する場合

## `@RequestBody`

クライアント側がjsonで送信する場合


# `@Validated` and `@Valid`

+ @Validは JSR-303
+ @Validatedその後 spring3から追加されたのも。 
  + validation groupをサポートするため

特別な理由がなければ拡張性を考えて `@Validated`がいい。

# References

+ [Spring MVC Exception Handling](http://memorynotfound.com/spring-mvc-exception-handling/)