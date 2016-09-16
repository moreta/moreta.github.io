---
title: Ruby Multi Thread & Multi Process & Fiber
date: 2016-07-29
tags: ruby, thread, coroutine, fiber
---

# threadとprocess

[マルチスレッド/プロセスまとめ（Ruby編）](http://qiita.com/masashi127/items/b186bbf20b4c9632cc86)から

## process(プロセス)

+ プログラムの実行単位
+ 固有のメモリ空間を持つ(リソースを共有しない)
+ マルチプロセスの場合、物理/仮想メモリ領域間のアドレス解決のオーバーヘッドが高い。

## スレッド

+ プロセスの実行単位
+ 共通のメモリ空間を持つ（リソースを共有する）
+ マルチスレッドの場合、物理/仮想メモリ領域間のアドレス解決は発生しない。

# Rubyにおけるマルチスレッド

+ GILが導入されたネイティブスレッド（バージョン1.9以降）
+ 1つのプロセスに複数のスレッドを生成できるが、GILにより実行できるスレッドは常に1つ。
+ マルチプロセッサの場合、時間単位に複数のプロセッサのスレッド間で処理が切り替わるため、あたかも並列処理しているように見える。
+ **そのため全体の処理速度はシングルプロセッサの場合とほとんど変わらない。**
+ ただし、**IO待ちの際GILが解放** されるため、一時的な並列処理が可能になる。

## multi thread

```ruby
require "parallel"
require 'benchmark'
require "secure random"

id = 0
count = 0

exec_time = Benchmark.realtime do

  Parallel.each([*1..10], in_threads: 4) {|i|
    id = i

    100000.times do |ii|
      if id != i
        count += 1
      end
      id = i
      Digest::MD5.digest(SecureRandom.uuid)
    end
  }
end
puts exec_time
puts count
```

## multi process

+ topで確認したら`in_processes:`で指定した数分PIDが増える
+ serverのcpu数を確認し合わせて使うのがいい

```ruby
require "parallel"
require 'benchmark'
require "secure random"

id = 0
count = 0

exec_time = Benchmark.realtime do

  Parallel.each([*1..10], in_processes: 4) {|i|
    id = i

    100000.times do |ii|
      if id != i
        count += 1
      end
      id = i
      Digest::MD5.digest(SecureRandom.uuid)
    end
  }
end
puts exec_time
puts count
```

# FiberとProcの違い

+ 「ブロックのコードを任意の場所で呼び出せる」だけではProcと変わりません
+ `Fiber.yield`と`Fiber.resume`を組み合わせて使うことによってProcと差別化できる。
+ generatorを作るときに有効
  + 「計算を途中までで止めて部分的な結果を返し、また続きから計算を再開する」ようなモノを ジェネレータ と呼ぶ
+ Fiberは親子関係を持ち、親からはresume、子からはFiber.yieldという非対称な呼び出し関係にあるため、コルーチンではなくセミコルーチンと呼んだほうが正確

resumeとyieldの例

```ruby
f = Fiber.new do
  Fiber.yield 'return by yield' # 処理を親に戻す
  Fiber.yield 'return by yield again'
  'end of block'
end

puts '--- 1 ---'
f.resume #=> 'return by yield'
puts '--- 2 ---'
f.resume #=> 'return by yield again'
puts '--- 3 ---'
f.resume #=> 'end of block'
puts '--- 4 ---'
f.resume #=> FiberError: dead fiber called
```

ruby generatorで fibonacci数を順々に返す

```ruby
fibonacci = Fiber.new do
  x, y = 0, 1
  loop do
    Fiber.yield y # yieldに渡した値がresumeの返り値となる
    x, y = y, x + y
  end
end

puts fibonacci.resume #=> 1
puts fibonacci.resume #=> 1
puts fibonacci.resume #=> 2
puts fibonacci.resume #=> 3
puts fibonacci.resume #=> 5
puts fibonacci.resume #=> 8
puts fibonacci.resume #=> 13
```

# References

+ [マルチスレッド/プロセスまとめ（Ruby編）](http://qiita.com/masashi127/items/b186bbf20b4c9632cc86)
+ [Fiberによる協調的な並行プログラミング](http://allabout.co.jp/gm/gc/447245/)
