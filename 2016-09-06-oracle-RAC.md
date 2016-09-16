---
title: Oracle RAC
date: 2016-09-06
tags: oracle, oracle-rac
---

+ [Oracle RACの概要](https://docs.oracle.com/cd/E16338_01/rac.112/b56290/admcon.htm)
+ [ゼロから理解するOracle RAC](http://www.atmarkit.co.jp/ait/articles/0904/13/news115.html)


+ ディスクI/Oを軽減させるため
  + データを参照、更新する際にはデータベース・バッファ・キャッシュと呼ばれるメモリ領域にデータをキャッシュしている
  + キャッシュ上で変更されたデータは遅延書き込むもする
