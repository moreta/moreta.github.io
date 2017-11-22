
# absoluteを使うときの注意点

### 親要素はrelativeに

なぜ？

要はabsoluteの場合の基準になる親も relativeかabsoluteである必要があるから

<https://stackoverflow.com/questions/10487292/position-absolute-but-relative-to-parent/10487329>

+ position: absolute means something like "use top, right, bottom, left to position yourself in relation to the nearest ancestor who has position: absolute or position: relative."
+ absoluteを使って位置調整するときは、親要素にposition:relative（もしくはfixed）を指定する必要がある
  + しないとずれる



# References

+ [CSSのpositionを総まとめ！absoluteやfixedの使い方は？](https://saruwakakun.com/html-css/basic/relative-absolute-fixed)
  + いいblog - absolute, relative, fixedについて良い説明