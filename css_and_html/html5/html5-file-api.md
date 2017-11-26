---
title: JavaScript で File API を使用してファイルを読み取る
date: 2016-01-13
tags: js, file, upload
---


+ HTML5 では、File API 仕様を介してローカル ファイルとやり取りする標準的な方法が用意されています


# ファイルシステムからファイルにアクセスするための複数のインターフェース

1. File - 単一のファイルです。名前、ファイル サイズ、mimetype、ファイル ハンドルへの参照など、読み取り専用の情報を提供します。
2. FileList - File オブジェクトが配列のように並んだシーケンスです（<input type="file" multiple>、または複数のファイルを含むディレクトリをデスクトップからドラッグ）。
3. Blob - ファイルをバイト範囲でスライスできます。

上記のデータ構造を組み合わせて使用すると、FileReader インターフェースから標準的な JavaScript イベント処理を通じてファイルが非同期に読み取られます


# ファイル選択にフォーム入力を使用する

+ 最も簡単なファイル読み込み方法は、標準の <input type="file"> 要素を使用することです
+ JavaScript は、選択された File オブジェクトのリストを FileList として返します


```html
<input type="file" id="files" name="files[]" multiple />
<output id="list"></output>

<script>
  function handleFileSelect(evt) {
    var files = evt.target.files; // FileList object

    // files is a FileList of File objects. List some properties.
    var output = [];
    for (var i = 0, f; f = files[i]; i++) {
      output.push('<li><strong>', escape(f.name), '</strong> (', f.type || 'n/a', ') - ',
                  f.size, ' bytes, last modified: ',
                  f.lastModifiedDate.toLocaleDateString(), '</li>');
    }
    document.getElementById('list').innerHTML = '<ul>' + output.join('') + '</ul>';
  }

  document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>

```


# References


+ [JavaScript で File API を使用してファイルを読み取る](http://www.html5rocks.com/ja/tutorials/file/dndfiles/)
