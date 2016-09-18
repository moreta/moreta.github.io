---
title: Draft.js
date: 2016-08-17
tags: draftjs
---


# immutableな`EditorState`を利用

+ complete snapshot of the state of the editor
  + contents, cursor, undo/redo history
+ editor内でのすべての変更は新しいEditorState objectを生成する

## Topics

+ RichUtils
+ Entities
+ Modifier


# Modifiier

## Modifier API

<https://facebook.github.io/draft-js/docs/api-reference-modifier.html>

# Entities

+ textの一定範囲をmetadataでannotationする。
+ 範囲を選択し、linkをつけたり、色をつけたり
+ properties
  + type
    + どんな種類のentityなの？
    + 'LINK', 'MEMTION', 'PHOTO'
  + mutability
  + data


## Entity API

<https://facebook.github.io/draft-js/docs/api-reference-entity.html>

# Decorators

<https://facebook.github.io/draft-js/docs/advanced-topics-decorators.html>

tweetの `@username`みたいに
その部分のstyleを特定ルールで変更させること

# Custom Block Components

<https://facebook.github.io/draft-js/docs/advanced-topics-block-components.html>
