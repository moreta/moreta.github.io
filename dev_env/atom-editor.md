---
title: Atom editor
date: 2014-11-02
tags: atom, editor
---


# Packages

```sh
apm install nuclide
apm install regex-railroad-diagram
apm install markdown-table-formatter
apm install markdown-writer
apm install atom-beautify
```

### markdown

preview

* `ctrl + shift + M`


### file-icons

fileにicon表示


### project manger

プロジェクトの切り替え

ctrl-cmd-p (mac) / alt-shift-P (win & linux) or Project Manager in the Command Palette.


### sublime-tabs

tree viewをclickをするとタブが開く、または選択される


### autocomplete-paths

### autocomplete-snippets

### trailing-spaces

### regex-railroad-diagram


## 検索

### ファイル検索

`cmd-t`

### 現在開いてるファイルから検索

`cmd-b`

## short cut

#### case toggle

| Keypress         | Command                |
|:-----------------|:-----------------------|
| cmd + K, cmd + U | Transform to Uppercase |
| cmd + K, cmd + L | Transform to Lowercase |

### General

#### Toggle command palette

`shift + ⌘ + p`

#### Toggle line/selection comment

`⌘ + /`

#### Show available auto-completions

`ctrl + space`


### File Navigation

#### Toggle file finder

`⌘ + p`

#### Goto line

`ctrl + g`

####Goto symbol

⌘ + r

#### Previous/next file

shift + ⌘ + { / }

#### Set bookmark

⌘ + F2

#### Goto next bookmark

F2


### View/Window Manipulation


#### Toggle tree-view sidebar

サイドのfile treeを表示

`⌘ + \`

#### Toggle fullscreen

`ctrl + ⌘ + f`

#### Split pane left/right/up/down

`⌘ + k + left/right/up/down`

#### Focus pane left/right/up/down

⌘ + k, ⌘ + left/right/up/down

### Find

Find in file

`⌘ + f`


⌘ + g
Find next
shift + ⌘ + f
Find in project
⌘ + e
Use selection for find


### Folding

ctrl + ⌘ + [ / ]
Fold/unfold current code block
option + shift + ⌘ + [ / ]
Fold/unfold all code blocks
⌘ + 1-9
*Fold code blocks at depth 1-9*

### Word Manipulation

ctrl + t
Transpose characters either side of cursor
option + backspace
Delete text to beginning of word
option + delete or fn + option + backspace
Delete text to end of word

### Line Manipulation

⌘ + ] / [
Indent/outdent current line

⌘ + enter
Insert new line after current line

⌘ + shift + enter
Insert new line before current line

ctrl + shift + k
Delete current line

ctrl + ⌘ + up/down
Move current line up/down

shift + ⌘ + d
Duplicate current line

⌘ + j
Join current and next lines

### Selection

⌘ + d
Select current word/token

⌘ + l
Select current line

option + shift + left/right
Select to beginning/end of word

shift + ⌘ + left/right
Select to first/last character of line

shift + ⌘ + up/down
Select to top/bottom of document

# Change syntax highlighting

`ctrl+shift+l`

# Packages

## atom-beautify

`Ctrl-Alt-B`

## Markdown writer

+ [Settings for Keymap](https://github.com/zhuochun/md-writer/wiki/Settings-for-Keymaps)
  + keymapは以下の keymap.csonの`".platform-darwin atom-text-editor[data-grammar~='gfm']":`を参考に
+ activation commandsは[ここ](https://github.com/zhuochun/md-writer/blob/master/package.json#L21)から確認できる

## sort line

<https://atom.io/packages/sort-lines>

`cmd+shipt+p sort line`

# Config

## white space

```js
"*":
  editor:
    invisibles:
      eol: false
      tab: false
      space: false
```

# Sample `keymap.cson`

```js
'.platform-darwin atom-workspace':
  'ctrl-0': 'unset!'
  'ctrl-\\': 'nuclide-side-bar:toggle-focus'
'body':
  'ctrl-0': 'pane:show-next-item'
  'ctrl-9': 'pane:show-previous-item'
  'ctrl-tab': 'pane:show-next-item'
  'ctrl-shift-tab': 'pane:show-previous-item'
'.platform-darwin':
  'cmd-0': 'tree-view:toggle-focus'
  'ctrl-0': 'pane:show-next-item'
".platform-darwin atom-text-editor[data-grammar~='gfm']":
  "shift-cmd-K": "markdown-writer:insert-link"
  "shift-cmd-I": "markdown-writer:insert-image"
  "cmd-i":       "markdown-writer:toggle-italic-text"
  "cmd-b":       "markdown-writer:toggle-bold-text"
  "cmd-'":       "markdown-writer:toggle-code-text"
  "cmd-k":       "markdown-writer:toggle-keystroke-text"
  "cmd-h":       "markdown-writer:toggle-strikethrough-text"
  "ctrl-alt-1":  "markdown-writer:toggle-h1"
  "ctrl-alt-2":  "markdown-writer:toggle-h2"
  "ctrl-alt-3":  "markdown-writer:toggle-h3"
  "ctrl-alt-4":  "markdown-writer:toggle-h4"
  "ctrl-alt-5":  "markdown-writer:toggle-h5"
  "shift-cmd-O": "markdown-writer:toggle-ol"
  "shift-cmd-U": "markdown-writer:toggle-ul"
  "shift-cmd->": "markdown-writer:toggle-blockquote"
  'shift-cmd-"': "markdown-writer:toggle-codeblock-text"
  "cmd-j cmd-p": "markdown-writer:jump-to-previous-heading"
  "cmd-j cmd-n": "markdown-writer:jump-to-next-heading"
  "cmd-j cmd-d": "markdown-writer:jump-between-reference-definition"
  "cmd-j cmd-t": "markdown-writer:jump-to-next-table-cell"
  "cmd-j cmd-f": "markdown-writer:format-table"
```

# 参照リンク

* <http://qiita.com/spesnova/items/d3096d062d70e7385e9d>
