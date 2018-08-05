nvm - node version manager
==========================

nvmを利用するとrvmとほぼ同じ感じでインストールできる


# install nvm

<https://github.com/creationix/nvm>

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
```


# node js with nvm

## commands

*基本的な command*

```sh
nvm ls-remote
nvm install v6.3.0       # Install a specific version number
nvm use v6.3.0           # Use the latest available 0.10.x release
nvm run v6.3.0 myApp.js  # Run myApp.js using node v0.10.24
nvm alias default v6.3.0 # Set default node version on a shell
nvm ls
```

## Available list node versions

```sh
nvm ls-remote
```

## install specific node version

```sh
nvm install 5.0
```

# using node version

## use version

```sh
nvm use v0.12.7
```

## get the path to the executable to where it was installed

```sh
nvm which v0.12.7
```

## set default

```sh
nvm use v0.12.7                # Use the latest available 0.10.x release
nvm alias default v0.12.7      # Set default node version on a shell
```

## alias


```sh
nvm ls
        v0.12.6
->      v0.12.7
         v4.2.1
default -> v0.12.7
node -> stable (-> v4.2.1) (default)
stable -> 4.2 (-> v4.2.1) (default)
iojs -> N/A (default)
```

```sh
nvm alias your_alias_name [node_version|other_alias_name] # nodeを指定
nvm alias default node # nodeを指定
nvm alias default stable # stableを指定
```

## unalias

```sh
nvm alias delete_alias_name
```

## run with specific version

```sh
nvm run 0.10.24 myApp.js    # Run myApp.js using node v0.10.24
```


# uninstall



# nvm自体のアップデート


```sh
cd ~/.nvm
git pull origin master
source ~/.nvm/nvm.sh
```

# nvm でinstallしたnodeのversion

`node -v`

# update node version

```
nvm install v8.11.3 --reinstall-packages-from=v8.10.0
```


# Fish shell

+ Note: nvm does not support Fish either (see #303). Alternatives exist, which are neither supported nor developed by us:
  + fish shellはsupportしないので別のものをinstall

## plugin-nvmがかんたん

<https://github.com/derekstavis/plugin-nvm>

```sh
omf install nvm
refresh
```
これでOK

## Automatic Version Switching for Node.js - avn

+ avnもnvmで supportはしていない。別でinstall
+ rubyで.ruby-gemset, .ruby-versionがあれば自動で切り替わる感じ？
+ <https://github.com/wbyoung/avn>

```sh
npm install -g avn avn-nvm
avn setup
```

setupすると環境設定fileに以下が追加される

```
# .bash_profile
# .zshrc - 必要ないけどな..
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
```

## .node-version file

簡単

```
v8.6.0
```