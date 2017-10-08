# masonry sample

上と下に3pxずつ幅を置きたい場合

<https://github.com/desandro/masonry/issues/393>

```css
#masonry {
  .grid-sizer,
  .grid-item {
    // 1/3 column, minus 2 gutters of 3px
    width: calc((100% - 6px) / 3);
    margin-bottom: 3px;
  }
  .gutter-sizer {
    width: 3px;
  }
  .grid-item--width2 {
    width: calc((100% - 6px) * (2 / 3) + 3px);
  }
  .grid-item--width3 {
    width: 100%;
  }
}

```