---
title: mailcatcher - mail test
date: 2014-11-17
tags: mail, test
---

# Install

```
gem install mailcatcher
```

# Rails Setting

# error

## kernel_require.rb:55:in require': cannot load such file -- i18n/core_ext/string/interpolate (LoadError)

<https://github.com/sj26/mailcatcher/issues/155>

原因は i18nのversion問題

```
gem install i18n -v 0.6.11
gem uninstall i18n -Ix --version '>0.6.11'
```

またはversionを固定したrepositoryからインストール

```
gem install mailcatcher -l 'https://github.com/moreta/mailcatcher/tree/patch-1'
```


# 確認

```
==> smtp://127.0.0.1:1025
==> http://127.0.0.1:1080
```
