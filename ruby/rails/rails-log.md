---
title: Rails log
date: 2014-09-27
tags: rails, log
---

# initialize

```rb
logger = Logger.new('log/rake.log')
```


# log level

```rb
logger.unknown("不明なエラー")
logger.fatal("致命的なエラー")
logger.error("エラー")
logger.warn("警告")
logger.info("通知")
logger.debug("デバッグ情報")
```


# References

+ [Rakeタスクの賢いロギング](http://qiita.com/naoty_k/items/0be1a055932b5b461766)
