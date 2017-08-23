HTML5 drag and drop
=======================


## html attrに`draggable=true` を追加する方法


```html
<div id="columns">
  <div class="column" draggable="true"><header>A</header></div>
  <div class="column" draggable="true"><header>B</header></div>
  <div class="column" draggable="true"><header>C</header></div>
</div>
```

## cssで`cursor: move`指定

## drag eventの listen

以下のeventがattachできる

+ dragstart
+ drag
+ dragenter
+ dragleave
+ dragover
+ drop
+ dragend


# References

+ [dnd](https://www.html5rocks.com/ja/tutorials/dnd/basics/)