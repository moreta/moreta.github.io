Java BlockingQueue
=================

# `java.util.concurrent.BlockingQueue<E>`

+ All BlockingQueue is thread safe
+ Queueがいっぱいのときに空でなくなるまで待機
+ Queue가 비어있을때의 추출 시도

## What is BlockingQueue?

以下の操作を追加でサポートする Queue です。  
+ 要素の取得時にキューが空でなくなるまで待機したり
+ 要素の格納時にキュー内に空きが生じるまで待機する

## BlockingQueue メソッド

4 つの形式があり、すぐには達成できなくても将来のある時点で達成できる可能性がある操作を異なる方法で処理します。

+ 1 つめは例外をスローし、
+ 2 つめは特殊な値 (操作に応じて null と false のいずれか) を返し、
+ 3 つめは操作が正常に完了するまで現在のスレッドを無期限にブロックし、
+ 4 つめは処理を中止するまで指定された制限時間内のみブロックします。これらのメソッドについて、次の表にまとめます。

# BlockingQueue의 종류와 특징

## 1. ArrayBlockingQueue

- 고정배열에 일반적인 Queue를 구현한 클래스, 생성 후 크기변경 불가
- 꽉찼을때 추가 block, 비었을때 추출 block
- 선택적으로 공평성 정책을 두어 block한 thread들의 순차적 대기열 생성
  (대기열 처리에 대해 정확한 순서 보장 X, 공평성 따짐 - throughput 감소되나 variability를 줄이고 starvation을 해소한다.)

## 2. LinkedBlockingQueue

- 선택적으로 Bound가 가능한 Linked list로 구현한 Queue
- capacity를 초기에 정해주지 않는경우 integer.MAX_VALUE로 자동설정
- 용량을 초과하지 않는 한에서 node는 동적으로 삽입시마다 생성되며 초과 시 block.
- Linked queue는 일반적으로 배열 기반 큐 보다 동시성 App에서 높은 throughput을 가짐.

## 3. PriorityBlockingQueue

- PriorityQueue와 같은 정렬방식을 지니는 용량제한이 없는 Queue. 하지만 Element 추출에 대해 Block기능을 제공.
- 입력무제한(unbounded)으로 기본 설계가 되었기 때문에 추가작업 수행중 fail이 나면 이것은 자원고갈이 났다는 뜻이다. (OutOfMemoryError 발생)
- null element 및 non-comparable object 를 수용하지 않으며 natural ordering을 지원한다.(ClassCastException 발생)

## 4. SynchronousQueue

- Queue 내부로의 insert 작업이 다른 스레드의 remove 작업과 반드시 동시에 일어나야한다.
   (서로 대칭되는 작업이 없을경우 생길때까지 wait)
- 이 queue는 내부용량을 지니지 않는다. (단 1개의 공간도...) / null 값 수용 X
- remove될때만 새로운 element가 insert되므로 추출(peek이라는 함수)을 할 수 없다.
  반대로, 다른 스레드가 remove를 시도하지 않는이상 삽입을 할 수도 없다.
- Queue의 head는 최초 삽입 시도를 한 Thread의 삽입 element가 된다.
- poll()을 수행하였을 시 Queue에 삽입시도를 한 thread가 없다면 null을 리턴한다.

- Collection 합수들에 대해 SynchronousQueue는 empty collection으로서의 목적성을 지닌다.
- 이 Queue는 CSP나 Ada의 rendezvous channel과 비슷하다.
   수행중인 thread의 object의 queue에 대한 동작이 다른 살아있는 스레드 object의 queue에 대한 동작과
   sync-up 되어야 하는 handoff design에 적합하며 주로 information, event, task를 전달한다.

마지막 2가지는 SynchronousQueue가 유용하게 쓰이는 곳에 대한 이야기 인데, 해석에 자신이 없어서 원문을 덧붙인다.
For purposes of other Collection methods (for example contains), a SynchronousQueue acts as an empty collection.
Synchronous queues are similar to rendezvous channels used in CSP and Ada. They are well suited for handoff designs, in which an object running in one thread must sync up with an object running in another thread in order to hand it some information, event, or task.

# BlockingQueue의 Producer-Consumer 구조 기본 용법

다음의 구조에서 빨간 implement부분에 상위에서 다룬 4개의 Queue중 적절한 동작방식을 가진 것을 택하면 된다.
element의 입력에 put(), 추출에 take()가 사용되었다는 점에 유의하자

```java
 class Producer implements Runnable {
   private final BlockingQueue queue;
   Producer(BlockingQueue q) { queue = q; }
   public void run() {
     try {
       while (true) { queue.put(produce()); }
     } catch (InterruptedException ex) { ... handle ...}
   }
   Object produce() { ... }
 }

 class Consumer implements Runnable {
   private final BlockingQueue queue;
   Consumer(BlockingQueue q) { queue = q; }
   public void run() {
     try {
       while (true) { consume(queue.take()); }
     } catch (InterruptedException ex) { ... handle ...}
   }
   void consume(Object x) { ... }
 }

 class Setup {
   void main() {
     BlockingQueue q = new SomeQueueImplementation();

     // 여기서 q는 공유자원이다. Thread생성 시 매개변수로 포인터를 넘겨준다.
     Producer p = new Producer(q);
     Consumer c1 = new Consumer(q);
     Consumer c2 = new Consumer(q);
     new Thread(p).start();
     new Thread(c1).start();
     new Thread(c2).start();
   }
 }
}
```

# References

+ [今まで知らなかった 5 つの事項: java.util.concurrent 第 1 回](http://www.ibm.com/developerworks/jp/java/library/j-5things4.html)
  + 並行コレクションによるマルチスレッド・プログラミング
+ [BlockingQueue 의 종류와 용법](http://oniondev.egloos.com/558949)
+ [BlockingQueue을 이용한 생산자 소비자 패턴](http://forum.falinux.com/zbxe/index.php?document_srl=661569&mid=lecture_tip)
  + まだみてない
