---
title: Electron
date: 2015-12-26
tags: electron
---


<http://electron.atom.io/>


# template

[Electron application boilerplate based on React, Redux, React Router, Webpack, React Transform HMR for rapid application development](https://github.com/chentsulin/electron-react-boilerplate)


# quick start


## cloneして実行まで

```
# Clone the Quick Start repository
git clone https://github.com/atom/electron-quick-start

# Go into the repository
cd electron-quick-start

# Install the dependencies and run
npm install && npm start
```

## packagingまで

prerequisite

```
npm install -g electron-prebuilt asar
```

run app

```
asar pack . app.asar
asar list app.asar
./node_modules/.bin/electron . 
# or if install electron globally 
electron .
```

packaging

```
cp app.asar /Yourelectron path/Electron.app/Contents/Resources/app/
```



## Application Packaging

<http://electron.atom.io/docs/v0.36.0/tutorial/application-packaging/>

1. electron distributionをダウンロード & 解凍
2. asarを作成
3. 作成したasarを以下のdirectoryへ配置
  + OSX : `/Your Electron distribution file Path/Electron.app/Contents/Resources/`
  + Windows or Linux: `/Your Electron distribution file Path/resources/`

### Method 1. - Generating asar Archive and Copy

1. Install the asar Utility

```
npm install -g asar
```
2. Package with asar pack

```
asar pack your-app app.asar
```

### Method 2. - Use electron-packager

通常はこれを使うかな。

## Application Distribution

<http://electron.atom.io/docs/v0.36.0/tutorial/application-distribution/>

### 方法1

ソースをelectron distributionのなかにcopyする

```
electron/Electron.app/Contents/Resources/app/
├── package.json
├── main.js
└── index.html
```

### 方法2 - asar

app.asarにしたファイルを以下にいれる

```
electron/Electron.app/Contents/Resources/app/
```

# 用語

+ distribution関連
  + symbols
  + dsym
    + debug symbols
