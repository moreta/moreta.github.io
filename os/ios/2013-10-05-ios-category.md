---

title: "iOS category"
date: 2013-10-05 02:36
comments: true
tags: ios
---


## example

* <http://mobile.tutsplus.com/tutorials/iphone/objective-c-categories/> ここがいいかも
* <http://www.lastday.jp/2012/04/15/objective-c-what-category-is>
* <http://metalkin.tistory.com/?page=4>
* <http://blog.yagom.net/352>
* <http://tiny2n.tistory.com/138>


## 利用

カテゴリは既存クラスにメソッドを追加する際などに利用される。

```
@interface NSManagedObject(Student) 

//  生徒の組を戻す。
- (NSNumber*)classNumber;

//  生徒の組を設定する。
- (void)setClassNumber:(NSNumber*)classNumber;
@end

```

このような宣言によってコンパイラはNsManagedObjectに対し、２つのメソッドを利用できるようにする