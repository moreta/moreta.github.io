


# HTML5のドラッグ＆ドロップで定義されている7つのイベント
ユーザーによるドラッグ操作やドロップ操作は、以下の7つのイベントで取得します。 それぞれのイベント発生時におけるドラッグデータ、および、 ドロップ先の要素の挙動をJavaScriptで制御してやることで、ドラッグ＆ドロップ機能を実現します。

| イベント名     | イベントが発生するタイミング        | デフォルト動作          |
|-----------|-----------------------|------------------|
| dragstart | ドラッグ開始時               | ドラッグを開始する        |
| drag      | ドラッグが継続している間          | ドラッグを継続する        |
| dragenter | ドラッグ要素がドロップ要素に入った時    | ユーザーによるドロップ操作を拒否 |
| dragleave | ドラッグ要素がドロップ要素から出た時    | 何もしない            |
| dragover  | ドラッグ要素がドロップ要素に重なっている間 | 現在のドラッグ操作をリセットする |
| drop      | ドロップ時                 | （場合による）          |
| dragend   | ドラッグ終了時               | （場合による）          |



# References

+ [意外と知らないHTML5 API - 第1回 Drag & Drop APIとは](https://app.codegrid.net/entry/dnd-api-1)
+ [ドラッグ＆ドロップ](http://www.htmq.com/dnd/)
+ [Event reference - dragenter](https://developer.mozilla.org/ja/docs/Web/Events/dragenter)
+ [Drag and Drop File Uploading](https://css-tricks.com/drag-and-drop-file-uploading/)