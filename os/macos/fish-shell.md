---
title: Fish shell
date: 2016-06-28
tags: fish, mac, shell
---

# alias

<http://fishshell.com/docs/current/commands.html#alias>

`~/.config/fish/functions`でも`.config/fish/config.fish`でも大丈夫

aliasを利用する方法
```
alias rmi "rm -i"
```

functionで定義する方法
```
function rmi
    rm -i $argv
end

# Then, to save it across terminal sessions:

funcsave rmi
```

# nvm setting

plugin-nvmを利用

<https://github.com/derekstavis/plugin-nvm>

```
omf install nvm
```

#### 以下は使わない

bassで
```
# nvm setting
set -gx NVM_DIR ~/.nvm
bass source ~/.nvm/nvm.sh ';' nvm use default
function nvm
  bass source ~/.nvm/nvm.sh ';' nvm $argv
end
```

# rvm setting

<https://github.com/oh-my-fish/plugin-rvm>

```
omf install rvm
```

# Trouble shooting

## shell_session_update: command not found

rvm 関連エラー

<http://superuser.com/questions/1044130/why-am-i-having-how-can-i-fix-this-error-shell-session-update-command-not-f>
TL;DR: Make sure RVM is up-to-date to at least 1.26.11 by re-installing or issuing the command rvm get head, and is only being initialized once per terminal environment.

```
rvm get head
```
