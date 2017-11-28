---
title: RESTKit Scroll view
date: 2014-04-24
tags: ios, scroll view
---


# 注意

UIScrollViewでは、タッチを取得することができない。

上位viewにeventを渡さないから

## 渡す方法1

```
// CustomScrollView.m
@interface CustomScrollView : UIScrollView
...
@end

@implement CustomScrollView

(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.superview touchesEnded:touches withEvent:event]; // eventを上位viewに渡す
}
@end


// event受け取る側
// SuperViewControllerが superviewになって [self.superview touchesEnded:touches withEvent:event]このeventを受け取る
@interface SuperViewController : UIViewController <UIScrollViewDelegate>
{

    CustomScrollView *customScrollView;
}
@end

@implement SuperViewController
- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event
{
    // Process the single tap here
    NSLog(@"eventがきた!");
}
@end

```

## 渡す方法2 直接 scrollviewから

```
// SuperViewController
@interface CustomScrollView : UIScrollView<UIScrollViewDelegate>

// SuperViewController
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
 //タッチした時の処理
 }
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 //タッチしたまま移動させた時の処理
 }
 - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
 //タッチを終えた時の処理
 }
```

# method calling order

```
– scrollViewWillBeginDragging:
  ↓
– scrollViewDidScroll:
（複数回call。ゆっくりドラッグすればするほど多くなる。）
  ↓
– scrollViewDidEndDragging:willDecelerate:
  ↓
– scrollViewWillBeginDecelerating:
  ↓
– scrollViewDidScroll:
（複数回call）
  ↓
– scrollViewDidEndDecelerating:
```

# 参考


* <http://code4app.net/category/scrollview>
* <http://iosdevelopertips.com/user-interface/detect-single-tap-in-uiscrollview.html>
* <http://pplace.jp/2013/01/1185/>
* <http://blog.daum.net/lionbbg/7454598>