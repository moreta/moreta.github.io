

navigation barをhiddenにしたときにswipe backが動作しない

```swift
self.navigationController?.interactivePopGestureRecognizer.delegate = nil;
```

+ [Replace back button but keeping swipe to navigate back](https://stackoverflow.com/questions/38179275/replace-back-button-but-keeping-swipe-to-navigate-back)
+ [iOS7 interactivePopGestureRecognizer for hidden navigation bar](http://luugiathuy.com/2013/11/ios7-interactivepopgesturerecognizer-for-uinavigationcontroller-with-hidden-navigation-bar/)