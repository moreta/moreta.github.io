---
title: SCSS
date: 2016-01-26
tags: css, scss
---

# media query

[Responsive Web Design in Sass: Using media queries in Sass 3.2](http://thesassway.com/intermediate/responsive-web-design-in-sass-using-media-queries-in-sass-32)


```css
$information-phone: "only screen and (max-width : 320px)";

@media #{$information-phone} {
  background: red;
}
```

compiles to:

```
@media only screen and (max-width : 320px) {
  background: red;
}
```
