RxJava
========

+ RxJavaはObserverパターンの拡張


# hello world

+ Observableを生成する．
+ Observerを生成する．
+ ObservableにObserverを登録する (subscribeする)．

```java
import rx.Observable;
import rx.functions.Action1;

public class HelloWorld {

    public static void main(String[] args) {
        String[] names = {"Ben", "George"};

        // from でObservableを生成
        // substribeで Observer(Action1)を生成して登録する
        Observable.from(names).subscribe(new Action1<String>() {
            @Override
            public void call(String s) {
                System.out.println("Hello, " + s + "!");
            }
        });
    }
}

// 上と同じ
public static void main(String[] args) {
    String[] names = {"Ben", "George"};

    // Step1. 配列からObservableを生成します
    Observable observable = Observable.from(names);

    // Step2. Observerを生成します
    Action1<String> observer = new Action1<String>() {
        @Override
        public void call(String s) {
          System.out.println("Hello, " + s + "!");
        }
    };

    // Step3. ObservableにObserverをセットします (subscribeする)
    observable.subscribe(observer);
}

public static void main(String[] args) {
    String[] names = {"Ben", "George"};

    Observable.from(names).subscribe(new Observer<String>() {
        @Override
        public void onCompleted() {
          System.out.println("completed!");
        }

        @Override
        public void onError(Throwable e) {
          System.out.println("error... " + e.getMessage());
        }

        @Override
        public void onNext(String s) {
          if (s.equals("George")) {
            throw new RuntimeException("Oh my god..");
          }
          System.out.println("Hello, " + s + "!");
        }
    });
}
```
# FunctionとAction

call methodがreturnがあるか、ないかの違い

# Observerパターンとの違い

ReactiveプログラミングはObserverパターンと以下の点がパワーアップしています．

+ Completion/Errorハンドリング
+ イベントの合成やフィルタを関数で行える etc...

# References

+ [ObserverパターンとHelloWorldからはじめるRxJava](http://qiita.com/chooblarin/items/1cb6a58f6e52b8792c52)
