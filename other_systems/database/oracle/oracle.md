---
title: Mac Oracle環境
date: 2014-05-16
tags: oracle
---


100年ぶりのoracle

# GUI

## sql developer

<http://www.oracle.com/technetwork/jp/developer-tools/sql-developer/downloads/index.html?ssSourceSiteId=null>

# CUI

## sql plus

### download link

<http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html>

```
Version 10.2.0.4 (64-bit)
*Instant Client Package - SQL*Plus: Additional libraries and executable for running SQL*Plus with Instant Client
```
をダウンロード

### install

<http://yskwkzhr.blogspot.jp/2013/12/install-oracle-instant-client-on-osx-mavericks.html>

`for f in ~/Downloads/instantclient-*-macos.x64-11.2.0.3.0.zip; do unzip -o $f -d ~/local; done`

## sql

### mergeとlocking

merge statementを使うときにもlockingするみたい。
