---
title: Jetbrain Editor Custom Setting & tips
date: 2016-02-08
tags: java, editor, setting 
---



# Live template

## Java

+[Intellij IDEAにJUnitのLive templateを追加する](http://qiita.com/grimrose@github/items/3bd318eec63d98c80563)


test

```
@org.junit.Test
public void test$EXPR$() {
    $END$
}
```


# tomcat setting

## maven profile with tomcat

+ <http://stackoverflow.com/questions/25979738/running-tomcat-server-with-an-artifact-created-by-maven-into-intellij-13>

1. maven configuration create with specific profile
2. Set Tomcat's 「before launch」 : maven configuration


## Tomcat change file automatically recognize

+ <http://stackoverflow.com/questions/19596779/intellij-and-tomcat-changed-files-are-not-automatically-recognized-by-tomcat>

1. Set Tomcat's 「On 'Update' action」: Update classes and resources
2. Set Tomcat's 「On frame deactivation」: Update classes and resources


## consoleが文字化け

```
-Dfile.encoding=UTF-8
```

## settings (tab別)

### Server

### Deployment

# Metaキーが使えない＆optionキーで特殊文字が入力される。

<http://qiita.com/yousan/items/30c7804261db6364de8e>	

dropboxにある以下のファイルを

`Emacs_beats_vi.keylayout`

ここに保存

```sh
mv ~/...Path/Emacs_beats_vi.keylayout ~/Library/Keyboard\ Layouts/
```


# settings

Editor


# Watcher setting

+ <http://blog.jetbrains.com/webstorm/2015/05/ecmascript-6-in-webstorm-transpiling/>

## Babel

まあ、あんまり使えないnpm scriptやgulpなどで変換するほうがいい

- Scopeから対象のdirectoryと指定する(include recursively/ exclude recursively)
  - node_modulesなどは exclude recursively
- Arguments: (生成されるファイルのpathはここで指定する)
  - `$FilePath$ --out-file $ProjectFileDir$/out/$FileDirName$/$FileNameWithoutExtension$-compiled.js --source-maps inline`
- Working directory:
  - `$ProjectFileDir$`
- Output paths to refresh: (ここはfileが生成される場所ではない)
  - `$ProjectFileDir$/out/$FileNameWithoutExtension$.js`


# Others

## Doc comment

`/**`を入力後、enter


