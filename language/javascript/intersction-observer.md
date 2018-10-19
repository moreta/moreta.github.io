IntersectionObserver
====================================

* [Medium - Lazy Loading Images with IntersectionObserver](https://medium.com/@parkjoon94/lazy-loading-images-intersectionobserver-8c5bff730920)
* [MDN - Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API)

The Intersection Observer API provides a way to asynchronously observe changes in the intersection of a target element with an ancestor element or with a top-level document’s viewport.


# rootMargin

```
rootMargin: "0px 0px 200px 0px"
```

* Grow or shrink the detection boundaries of the root element.
* `rootMargin` option takes in a string that confirms to the regular CSS margin rule.

# imageがloadされるとscrollがjumpするissue

* imageのheightを固定する
  * responsibleの場合は？, aspect ratioの場合は？
