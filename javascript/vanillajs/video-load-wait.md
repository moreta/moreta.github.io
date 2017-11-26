

```js
  // https://stackoverflow.com/questions/38811027/how-to-run-masonry-only-after-all-html5-videos-are-loaded-with-infinitescroll
  function waitForVideoLoad(vids, callback) {
    /* if no videos i.e. mobile mode only gifs and jpgs then call callback else masonry breaks.*/
    if (vids.length === 0) {
      callback()
    }
    var vidsLoaded = 0;
    vids.on('loadeddata', function () {
      vidsLoaded++
      if (vids.length === vidsLoaded) {
        callback()
      }
    })
  }
```