---
title: "console color setting"
date: 2013-11-30
tags: color, console, mac
---


## mac用

`.bash_profile`


*cd test completion*

```
bind "set completion-ignore-case on"
```

*color setting*

```
export PS1='[\[\033[01;38m\]\u\[\033[00m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]]\$'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxcgcdabagacad
or
# export LSCOLORS=ExFxCxDxBxegedabagacad

```