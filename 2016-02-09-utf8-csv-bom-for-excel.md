---
title: Java Crate UTF8 file with BOM
data: 2016-02-08
tags: java, utf8, csv, excel, bom
---


# What is the BOM?

+ UnicodeのUTF-16などの16bit単位の文字エンコーディングスキームでは、8bit単位でデータを配列する際のエンディアンとして、ビッグエンディアンとリトルエンディアンの両方を許している
+ そのため、どちらのエンディアンで記述されたデータかを確実に判定するための特別なマークとなる符号として、BOM（Byte Order Mark）が用意されている



# UTF8のBOM付きファイルを生成する方法

```java
public static void main(String arg[]) {
    // カレントディレクトリのパスを取得します。
    String dir = System.getProperty("user.dir");
 
    // 出力したいファイル名を指定します。
    File file = new File(dir + "/test.txt");
    PrintWriter pw = null;
 
    try {
        FileOutputStream os = new FileOutputStream(file);
        os.write(0xef);
        os.write(0xbb);
        os.write(0xbf);
 
        pw = new PrintWriter(new OutputStreamWriter(os));
 
        pw.println("ひらがな");
        pw.println("カタカナ");
        System.out.println("ファイルの書き込みに成功しました!");
    } catch (IOException e) {
        System.out.println(e);
    } finally {
        if (pw != null) {
            pw.close();
        }
    }
}
```

# References

+ [【Java】UTF8のBOM付きファイルを生成する方法](http://javatechnology.net/java/utf8-file-bom/)
+ [BOM 【 Byte Order Mark 】](http://e-words.jp/w/BOM.html)
+ [BOM (Byte Order Mark)](http://www.atmarkit.co.jp/aig/01xml/bom.html)
