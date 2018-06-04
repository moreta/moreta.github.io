navigation barを透明にした時にnavigation barのheightが無視される

<https://stackoverflow.com/questions/24468831/uitableview-goes-under-translucent-navigation-bar>



```swift
override func viewDidLayoutSubviews() {
    if let rect = self.navigationController?.navigationBar.frame {
        let y = rect.size.height + rect.origin.y
        self.tableView.contentInset = UIEdgeInsetsMake( y, 0, 0, 0)
    }
}
```