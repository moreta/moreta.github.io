Python Install
=====================

# install by pyenv

## install

```sh
brew install pyenv

⋊> ~ pyenv --version                                                                                                                                   
pyenv 1.2.6
```

## version list

```
pyenv install --list
```

## version install

```
pyenv install 3.6.6 # aws-cli用
```

すると

`~/.pyenv/versions/`配下にインストールしてきた Python が配置される

ンストールしてきた後は shim のリフレッシュをしておく

```
pyenv rehash
```

## python version のための path setting

.bash_profile

```sh
# export PATH="$HOME/.pyenv/bin:$PATH" # これ必要ないね
eval "$(pyenv init -)"
# 以下の２つaws sam cliのため
export USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin
```
.config/fish/fish.config

```sh
# set -x PATH $HOME/.pyenv/bin $PATH # これ必要ないね
. (pyenv init - | psub)
# 以下の２つaws sam cliのため
set -x USER_BASE_PATH (python -m site --user-base)
set -x PATH $USER_BASE_PATH/bin	$PATH
```

### 使う Python を指定する

```sh
pyenv global 3.6.6 # global 指定
pyenv local 3.6.6 # local 指定
```

localの場合
`.python-version` というファイルが生成され、そこで指定したバージョンの Python を参照するようになる

## pip install

```
easy_install pip
```

```
⋊> pip list
Package    Version
---------- -------
pip        10.0.1
setuptools 39.0.1
wheel      0.31.1
```


# install by brew - よくない？

## install

```sh
# Python3 のインストール
brew install python3

# 確認 
python3 -V
```

## virtualenv による環境構築

virtualenvとは独立したPythonの実行環境を, グローバルのものとは別にいくつも構築することのできるツール

```sh
# virtualenv のインストール
pip3 install virtualenv

# Python3 の環境を切り出す
# 開発ディレクトリに移動してから
virtualenv --python=/usr/local/bin/python3 --no-site-packages env

# 開発環境をアクティベイト
# 開発ディレクトリで or bash_profile
source env/bin/activate
```

## virtualenv command

```
virtualenv --python=/usr/local/bin/python3 --no-site-packages env
```
これを実行したら、実行したdirectoryに envというdirectoryが生成される


# References

+ [MacにPython3をインストール](http://qiita.com/7110/items/1aa5968022373e99ae28)