---
title: Unix screen
date: 2016-06-24
tags: unix, screen, background, job
---


+ screenはmultiple processを作る
  + mutiple unix login sessionを作るよりリソースが節約される
+ 仮想ターミナル的な感じで考えればいい
+ nohupも使う必要がない
  + script内で使うときにはnohupがいいかな？



# screen 実行後 command list

## screen 실행후의 명령어는 Ctrl-a로 시작합니다:

shortcut           | desc
-------------------|-------------------------------------------------------------------------------------------------------
Ctrl-a, c          | (create) 새로운 쉘이 생기면서 그 쉘로 이동
Ctrl-a, a          | 바로 전 창으로 이동
Ctrl-a, n          | (next) 다음 창으로 이동
Ctrl-a, p          | (previous) 이전 창으로 이동
Ctrl-a, 숫자         | 숫자에 해당하는 창으로 이동
Ctrl-a, '          | 창번호 또는 창이름으로 이동 ( ' => 싱글 쿼테이션 )
Ctrl-a, "          | 창번호를 보여준다. ( " => 더블 쿼테이션 )
Ctrl-a, A          | 현재 창의 title을 수정
Ctrl-a, w          | 창 리스트 보여주기
Ctrl-a, esc        | Copy 모드로 전환. Copy 모드에서는 vi의 이동키로 이동을 할 수 있다.
Crtl-a, [          | 커서 이동을 할 수 있고 특정 블럭을 복사하는 기능으로 사용한다. 먼저 시작 위치에서 space 바를 누르고 끝 위치에서 space 바를 누르면 해당 부분이 buffer로 복사된다.
Ctrl-a, ]          | buffer의 내용을 stdin으로 쏟아 넣는다. 이 기능은 vi의 입력모드에서 사용하면 유용하다.
Ctrl-a, :(콜론)      | 명령행 모드로 전환
Ctrl-a, d          | (detach) 현재 작업을 유지하면서 screen 세션에서 빠져나옴 *세션이 종료 되지 않습니다.*
Crll-a, D(shift-d) | ?? TODO <<
Ctrl-a, x          | lock screen

## 아래 부분은 창을 나눠서 사용하는 명령입니다.
shortcut    | desc
------------|------------------------
Ctrl-a, S   | (split) 창을 나눔 (region)
Ctrl-a, Tab | 다른 region으로 이동
Ctrl-a, Q   | 현재 region을 제외한 나머지 숨기기

## exit - 세션을 완전히 빠져 나오는 명령입니다.

screen 의 쉘상에서 exit 를 치고 엔터를 하면 세션이 완전히 종료 됩니다.

```
exit
```

## unix commandを新しいwindowで実行

```
screen unixcommand
```

## 기본 세션명으로 시작

```
screen
```

+ screen 을 시작 하는 기본 명령입니다.
+ 기본 세션명으로 시작합니다.


## 세션명을 주고 시작 (2)

```
screen -S 세션명
```

+ -S 다음에 주는 세션명으로 시작합니다.
+ - screen -list
+ -list 옵션을 주고 실행하면 이전에 작업했었던 screen 리스트가 있으면 세션명과 함께 리스트를 보여줍니다.


## 현재 생성되어 있는 세션 리스트 확인하기

```
screen -list
```

## 새션에 재접속 : セッションへの再接続（他のユーザがデタッチしたscreenに接続していない場合）

自分自身でデタッチして、他のユーザがアタッチしていないセッションに接続する際にはscreenコマンドに引数【-r】をつけて起動します

```
screen -r 세션명
```

+ 이전에 세션이 있을 경우 -R 다음에 오는 세션명으로 이전 작업을 불러옵니다.
+ -R 다음에 세션명을 주지 않았을 경우에는 이전 세션이 한개만 있을 경우 그 작업을 불러옵니다.
+ 이전 작업이 여러개 있을 경우에는 이전 작업 리스트를 보여줍니다.
+ 세션명을 가진 세션이 없다면 새로운 세션을 만들어서 보여줌. (안만들려면 소문자 -r을 사용할 것)


## 이미 생성된 세션에 연결하기 （マルチディスプレーモード）

これ `screen -R`となにが違う？

+ セッションのアタッチ（マルチディスプレーモード）
+ screenコマンドが非常に便利なのは、複数の人間が同じターミナルを共有できることにあります。 ただし、同じアカウント（uid）でログインする必要がありますのでご注意ください。
+ マルチディスプレーモードへの接続は引数に【-x】を利用します。

```
screen -x [session-name]
```

# macのローカルで実行したscriptをとめたくない場合には

caffeinateを使う

<http://osxdaily.com/2014/06/16/caffeinate-prevent-sleep-while-command-active-mac-os-x/>

```
caffeinate -i [command / process]
caffeinate -i make # make commandがactive中はsystemをsleepにしない
```


# References

+ [In Unix, what is screen, and how do I use it?](https://kb.iu.edu/d/acuy)
+ [screen 명령어, 터미널 멀티세션 제공](http://www.dreamy.pe.kr/zbxe/CodeClip/164809)
+ [다른사람과 공유해서 이용하는 예](http://forum.falinux.com/zbxe/index.php?document_srl=530766&mid=lecture_tip)
+ [screenコマンドでリモートマシン操作](http://www.i-sys.biz/Support/Linux/screen.html)
