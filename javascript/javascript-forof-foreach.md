

# forEachよりfor..ofを

+ forEachはes5から
+ for..ofはes6から

## example

```js
// bad
const arr = [2, 3, 5, 7, 11, 13];
arr.forEach(x => {
  console.log(x);
});

// good
const arr = [2, 3, 5, 7, 11, 13];
for (const x of arr) {
  console.log(x);
}
```

# forEacheでできない部分

+ break


# References

+ [Don't use Array.forEach, use for() instead](https://coderwall.com/p/kvzbpa/don-t-use-array-foreach-use-for-instead)
  + performanceのためならfor使おうってはなし、でも for...ofではない
+ [MDN for...of](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Statements/for...of)
+ [Learning ES6: for-of loop](https://www.eventbrite.com/engineering/learning-es6-for-of-loop/)
