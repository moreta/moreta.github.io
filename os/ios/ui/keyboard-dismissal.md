# iOS キーボードを閉じる処理


## `someTextField.resignFirstResponder()`

* `endEditing`より(少し修正だけ)軽い
* custom controlを作って使う場合などで活用できる
* resignFirstResponder() is good to use any time you know exactly which text field is the first responder and you want to resign its first responder status. This can be slightly more efficient then the alternative, but if you're doing something such as creating a custom control, this can make plenty of sense. Perhaps you have a text field, and when the "Next" button is pressed, you want to get rid of the keyboard and present a date picker, for example. Here, I would definitely use resignFirstResponder()


## `self.view.endEditing(true)`

* どのUITextFieldやUITextViewがファーストレスポンダーかを知る必要がありません
* I typically reserve this for scenarios when I just absolutely need to clear the keyboard no matter what is currently going on, for whatever reason. Perhaps, I've got a slide-over menu? Just before this slides out, no matter what is going on, the keyboard should go away, so I'll make sure everything resigns its first responder status. It's important to note that endEditing() will look through the entire hierarchy of subviews and make sure whatever is the first responder resigns its status. This makes it less efficient then calling resignFirstResponder() if you already have a concrete reference to the first responder, but if not, it's easier than finding that view and having it resign


## `UIApplication.sharedApplication().keyWindow?.endEditing(true)`

* 表示しているビューのコントローラを知らなくてもキーボードを閉じることができます。

## `UIApplication.sharedApplication().sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, forEvent: nil)`

* 現在のファーストレスポンダーに対してメソッドを実行することができることを利用しています。
* Windowより上層のUIApplicationを利用することができます。


## iOS7以降では、スクロールビューやテーブルビューを利用している場合に、それらをドラッグしたりキーボードを下にドラッグした時にキーボードを閉じる

```swift
scrollView.keyboardDismissMode = .OnDrag
scrollView.keyboardDismissMode = .Interactive
```

# References

+ [resignFirstResponder vs. endEditing for Keyboard Dismissal
](https://stackoverflow.com/questions/29882775/resignfirstresponder-vs-endediting-for-keyboard-dismissal)
+ [iOSでキーボードを閉じる方法各種](https://qiita.com/rizumita/items/11a577dcde183a2ee4d5)



