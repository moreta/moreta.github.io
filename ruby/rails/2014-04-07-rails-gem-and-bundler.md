---
title: Rails Gem & Bundler
date: 2014-04-07
tags: ruby, gem, bundler
---


# このようなエラー

```
NoMethodError: private method `open' called for Gem::Package:Class
```

bundler gemのヴァージョンが古いから

```
gem install bundler
```

で解決


## Gemfile

### version specifiers

#### `~>`指定子

`~> 2.0.3` = `>= 2.0.3` and `< 2.1`

`~> 2.1` = `>= 2.1` and `< 3.0`

`~> 2.2.beta`は match prerelease versions like `2.2.beta.12`

## make my own gem

<http://guides.rubygems.org/make-your-own-gem/>
