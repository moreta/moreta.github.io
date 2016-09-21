---
title : Spring MVC
data: 2016-07-25
tags: spring, spring-mvc
---



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

# @Controllerと@RestControllerの違い

<http://qiita.com/tag1216/items/3680b92cf96eb5a170f0>



# `@Controller` and `@RestController`と controllerの戻り値など

<http://qiita.com/tag1216/items/3680b92cf96eb5a170f0>

# `@RequestParam` and  `@RequestBody`


# File download

<http://qiita.com/tag1216/items/3680b92cf96eb5a170f0#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89>

`org.springframework.core.io.Resource`を使おう
