---
title: npm basics
data: 2014-12-02
tags: npm
---

NPM basics
============

# install or upgrade

```bash
npm install -g npm
```

## git repositoryをinstall

<https://docs.npmjs.com/files/package.json#git-urls-as-dependencies>

# npm自体の install or update

`npm install -g npm`

#  list

`npm list [-g]`


##  グローバルにインストールされたパッケージ

```
sudo npm ls -g
sudo npm la -g
sudo npm list -g
sudo npm ll -g
```

# uninstall

`npm uninstall [-g] ＜パッケージ名＞`

# いらないpackage掃除

```
npm prune
```


# package.json

## run-script

package.json

```js
...
  "scripts": {
    "dev": "webpack --watch",
    "build": "webpack -p"
  },
...
```
`npm run dev`


### main

"main" 項目はパッケージの中で最初に呼ばれるモジュールのIDです。 つまりパッケージに foo と名前をつけ、それをユーザーがインストールし、 require("foo") を実行した時に "main" で指定したモジュールの exports オブジェクトが 返されます。

パッケージルートからの相対パスを指定しなければなりません。

多くのモジュールにとってメインスクリプトを持つことは有用でありますが しばしばそうでないかもしれません。


# errors

+ [npmで怒られたエラー集まとめ](http://qiita.com/M-ISO/items/d693ac892549fc95c14c)

## npm WARN EPEERINVALID

なにかインストールされてないときに

```
npm WARN EPEERINVALID mongodb-core@1.2.24 requires a peer of kerberos@~0.0 but none was installed.
```

実際にこのwarnはkerberosを使わなければ無視しても大丈夫


## npm ERR! extraneous

means a package is installed but is not listed in your project's `package.json`

# publish

npmに登録するには以下のcommandで

```
npm publish
# same
npm publish --tag latest
```

## beta publish

```
npm publish --tag beta
```

