Python Install
=====================

# install

```sh
# Python3 のインストール
brew install python3

# 確認 
python3 -V
```

# virtualenv による環境構築

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