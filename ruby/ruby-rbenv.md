
# Install

## macOs

```sh
brew update
brew install rbenv
```

## cent os

```sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv # Check out rbenv into ~/.rbenv
cd ~/.rbenv && src/configure && make -C src # これは失敗しても大丈夫
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile # Add ~/.rbenv/bin to your $PATH for access to the rbenv command-line utility.
~/.rbenv/bin/rbenv init

# restart shell or relogin
type rbenv # check rbenv
```

# Install ruby versions

```sh
rbenv install --list # インストール可能なリスト
rbenv install -l # インストール可能なリスト
rbenv install 2.3.3
```

## install 確認

```sh
rbenv versions # installされているall version
rbenv version # 現在versionだけ？
```

# Version指定

## global

```sh
Zrbenv global 1.8.7-p352 # ~/.rbenv/versionに記録
```

## local

```sh
rbenv local 1.9.3-p327 # .ruby-versionが生成される
```

# installed ruby list

```sh
rbenv versions
```


# gemsetの利用

rbenvにはgemsetがないので、使いたいならpluginでインストールする必要がある

<https://github.com/jf/rbenv-gemset>

# Others

## rbenv rehashで実行commandを ~/.rbenv/shimes/に配置 (これは最新のrbenvでは必要ない)

+ rbenv rehashを実行すると、~/.rbenv/versions/2.1.0/bin/下のコマンドが ~/.rbenv/shims/ に
+ gemでインストールしたコマンドを使う前にrbenv rehashをして $HOME/.rvm/shims 以下の情報を更新しなくてはいけません
+ rehashをしなくもいいように



# References

+ [rbenvとは？（rbenvを利用したRubyのインストール）](http://qiita.com/yunzeroin/items/33a51c805e60ed5eca0e)
+ [KISS yet powerful gem / gemset management for rbenv](https://github.com/jf/rbenv-gemset)
