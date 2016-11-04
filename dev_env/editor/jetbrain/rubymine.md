---
title: rubymine
date: 2014-09-10
tags: rubymine, editor, mac
---


## rubymineでruby2.xを使った時にdebug gem installで失敗する

他のmacではできたのに家のマックでできないのは、多分家のマックに
別のgccとg++をインストールしたからかも、

これをインストールした理由はnokogiriとかエラーにでたからだけど取り急ぎためしてみよう


*version確認*

```
gcc --version
g++ --versio
```

もし、このようなtextができなら linkを変えよう

```
i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2336.11.00)
Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

これがでるなら多分rubymineでもエラーになってないと思う。
```
Apple LLVM version 5.1 (clang-503.0.40) (based on LLVM 3.4svn)
Target: x86_64-apple-darwin13.3.0
Thread model: posix
```

もし、xcode command line toolがインストールしたらclangベースのgccとg++があるはず

symbolic linkを貼り直した。

```
sudo ln -sf /usr/bin/llvm-g++ /usr/bin/g++ 
sudo ln -sf /usr/bin/llvm-gcc /usr/bin/gcc 
```

って、うまくできた!
