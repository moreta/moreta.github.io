---
title: Java Thread
data: 2016-04-14
tags: java, thread
---

# 関連class

##  java.lang.Thread

extend Thread

+ Thread インスタンスは一度しか start() メソッドを呼び出すことができないことに注意
  + ２回めからはjava.lang.IllegalThreadStateException が発生

Thread classをextendして`run()`を実装したら
threadがstartしたらrun()メソッドが走る。

## java.lang.Runnable

implement Thread

+ 新しいスレッドを作って別の作業をさせたい場合

自分でextend Threadするのでなく`run()`を実装したクラスを作り、new Threadするときに渡す
```
Thread thread = new Thread(runnableClassInstance);
```


# スレッドの制御

+ スレッドを一定時間だけ休止させる: `Thread.sleep`
+ 他のスレッドが終了するまで待つ:
+ 他のスレッドと協調して動作させる
+ 他のスレッドに割り込む

## Join

join はthreadがthreadと合流するという意味。

## Thread safe

### threadが危ない例

+ 以下のコードはtotal 20000カウントするが、結果は20000にならない
+ 20000より少なくなる。なぜならcountを２つのthreadが同時に参照する場合があるから

```java
public class Counter {

    private int count;

    public Counter() {
        this.count = 0;
    }

    public void countUp() {
        this.count += 1;
    }

    public int get() {
        return this.count;
    }
}

public class MultiThreadedCountUp {

    public static void main(String[] args) throws InterruptedException {
        Counter counter = new Counter();

        // カウントアップするスレッドを2つ作る
        CountUpTask countUp = new CountUpTask(counter);
        Thread t1 = new Thread(countUp);
        Thread t2 = new Thread(countUp);

        // 合計200000回カウントアップする
        t1.start();
        t2.start();

        // カウントアップが終わるまで待つ
        t1.join();
        t2.join();

        // 結果を表示
        System.out.println(counter.get());
    }
}
```

### thread safeするためには

synchronized で修飾されたメソッドを実行しようとすると、this オブジェクトの monitor (モニタ) に入れたらメソッドを実行する。

```java
public class Counter {
...
    public synchronized void countUp() {
        this.count += 1;
    }
...
}
```

# Threadlocal

## References

+ <http://tutorials.jenkov.com/java-concurrency/threadlocal.html>
+ [Threadlocal](http://javacan.tistory.com/entry/ThreadLocalUsage)
+ [JavaアプリケーションサーバでThreadLocal利用時の注意点](http://d.hatena.ne.jp/yamadamn/20131214/1386996898)

## 概要

* The ThreadLocal class in Java enables you to create variables that can only be read and written by the same thread. Thus, even if two threads are executing the same code, and the code has a reference to a ThreadLocal variable, then the two threads cannot see each other's ThreadLocal variables
+ ThreadLocalは、Javaでスレッドごとにオブジェクトを保持するための機構であり、スレッドセーフにデータの利用を行える便利なクラスです

## 利用

+ Spring securityの利用者認証情報伝播でThreadLocalを利用
+ transaction managerはtransaction contextを伝播するためThreadLocalを利用
+ Thread safeなデータの保管


## 注意

+ 再デプロイ時にメモリリークの原因になる
+ 再利用前提のスレッドとThreadLocalを一緒に使うときには利用が終わったらデータを削除するのが安全。
  + javaでThreadを利用する場面は大体、thread poolを利用する。
  ここでThreadLocalを利用すると同じThreadをあとから利用することになった処理は前に処理でセットされた値を使うことになる。

### 解決策

+ リクエストごとに確実にThreadLocal#removeする
+ 3rd Partyライブラリなどで用意されている破棄メソッドを呼び
+ アプリケーションのデプロイを行う際は、アプリケーションサーバの再起動も併せて実施する



## Accessing a ThreadLocal

```java
// Once a ThreadLocal has been created you can set the value to be stored in it like this:
myThreadLocal.set("A thread local value");
// You read the value stored in a ThreadLocal like this:
String threadLocalValue = (String) myThreadLocal.get();
```


# References

+ [マルチスレッドプログラミング](http://java2005.cis.k.hosei.ac.jp/materials/lecture26/multithreaded.html)
