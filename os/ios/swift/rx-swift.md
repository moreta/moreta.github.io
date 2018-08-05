
<https://www.raywenderlich.com/192293/new-course-beginning-rxswift>

# 利用例

+ [【RxSwift入門】普段使ってるこんなんもRxSwiftで書けるんよ](https://qiita.com/ikemai/items/8d3efcc71ea9db340484)

## UIScrollView. contentOffset

normal version
```swift
class SampleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging \(scrollView.contentOffset)")
    }
}
```

Rx version
```swift
class SampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rx_contentOffset
            .subscribeNext { [weak self] contentOffset in
                // contentOffset値の変化時に取得
                print("rx_contentOffset : \(contentOffset)")
            }
            .addDisposableTo(rx_disposeBag)
    }
}
```

# References

+ [各種operatorのdiagram](http://rxmarbles.com/)

## この順番で読む

1. [はじめてのRxSwiftのメモ](https://qiita.com/syou007/items/41ff1469ee7a92e7ec57)
2. [RxSwift Why?](https://github.com/ReactiveX/RxSwift/blob/ff7273a835926337957d457966df5a81b580f72e/Documentation/Why.md)
