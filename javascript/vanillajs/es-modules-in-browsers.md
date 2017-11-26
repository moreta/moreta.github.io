
# Stactic import & Dynamic import

+ [Dynamic import()](https://developers.google.com/web/updates/2017/11/dynamic-import)

Dynamic import 
```js
<script type="module">
  const moduleSpecifier = './utils.mjs';
  import(moduleSpecifier)
    .then((module) => {
      module.default();
      // → logs 'Hi from the default export!'
      module.doStuff();
      // → logs 'Doing stuff…'
    });
</script>
```

* call like function 
* return promsie
* The lazy-loading capabilities enabled by dynamic import() can be quite powerful when applied correctly

## どっちを使う?

static import

+ for initial paint dependencies
  + above-the-fold content

dynamic import()

+ consider loading dependencies on-demand with dynamic import()


# References

+ [ECMAScript modules in browsers](https://jakearchibald.com/2017/es-modules-in-browsers/)
+ [Dynamic import()](https://developers.google.com/web/updates/2017/11/dynamic-import)