nvm - node version manager
==========================

nvmを利用するとrvmとほぼ同じ感じでインストールできる


# install nvm

<https://github.com/creationix/nvm>

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
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




# nvm でinstallしたnodeのversion

`node -v`


# with Fish shell

- nvm plugin for Oh My Fish, which makes nvm and its completions available in fish shell
- bass allows to use utilities written for Bash in fish shell


## nvm cliを使うためには

in `.config/fish/functions/nvm.fish`

```
function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end
```


## Automatic Version Switching for Node.js(.nvmrc)

- <https://github.com/wbyoung/avn>を利用

```
npm install -g avn-nvm
avn setup
```
