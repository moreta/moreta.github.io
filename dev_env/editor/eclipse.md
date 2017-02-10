---
title: Eclipse editor
date: 2014-05-13
tags: java, editor, error
---


# mac editor error
久しぶりにstsとdart editorを実行したら以下のようなエラー

```
The JVM shared library "/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home/bin/../jre/lib/client/libjvm.dylib"
does not contain the JNI_CreateJavaVM symbol.
```

まあ、java updateしたら治った。

## sts(eclipse)


### short cut

quick search

`ctrl + shift + L`

## svn

### maven project from SCMからsvn connectionがないとき

*Check out as Maven project from SCM* dialogで*find more SCM connection in the m2e marketplace*からも行ける

または以下、

1. Start Eclipse and open preferences.
2. Find the Maven group and expand it.
3. Select the "Discovery" item and click "Open Catalog".
4. A dialog will pop up with all the goodies. The connectors are at the bottom.

### svn icon labelが表示されない

ウィンドウ→設定→一般→外観→ラベル装飾の欄でSVNに

Preference -> General -> Appearance -> Label Decorations

または、Preferenceでlabelで検索すると出てくる

### tomcat

Preference -> serverから tomcatがインストール設定できる。
 
