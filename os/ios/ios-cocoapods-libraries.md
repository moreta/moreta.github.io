
# pods gallery site

* <http://cocoapods.org/>
* <http://code4app.net/>

# for Swift

+ [Alamofire - Elegant HTTP Networking in Swift](https://github.com/Alamofire/Alamofire)

# pods

+ [cocoapod list](http://namaraii.com/archives/6210)
+ [cocoapod rank](https://gist.github.com/luvtechno/8842522)
+ [color](https://github.com/bennyguitar/Colours)
+ [bootstrap & theme](https://github.com/Pixate/pixate-freestyle-ios)

## totorial | intro

path의 튜토리얼 페이지같은거
* <https://github.com/icepat/ICETutorial>
* <https://github.com/ealeksandrov/EAIntroView>
                                                              `
## Table & scroll

옆으로 위아래로 스크롤
* <https://github.com/rs/SDSegmentedControl>
* ほか<http://stackoverflow.com/questions/15012279/ios-library-or-diy-etsy-like-category-control>
* -<https://github.com/allaboutapps/A3GridTableView>

메일 앱같은 메뉴
* <https://github.com/daria-kopaliani/DAContextMenuTableViewController>

# select or segment

EMVerticalSegmentedControl

![image](http://lunchmate-blog.s3.amazonaws.com/blog-image/EMVerticalSegmentedControl.png)

# error

## Psych::SyntaxError - (/Users/moretajoo/.cocoapods/repos/master/CocoaPods-version.yml): mapping values are not allowed in this context at line 3 column 4

```
min: 0.18.1
last: 0.29.0
```

これを修正なかversion mergeがまちがったみたい

```
min: 0.32.1
last: 0.32.1
```

でもこれしても結局できない
なので、cocoapodsのlocal repositoryを削除して再インストール

```
cd ~
rm -rf .cocoapods/
cd your_project
pod install
```

# error


## `The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation`

でも、`pod install`しても解決されない



# Podfile sample


```
platform :ios

pod 'A2DynamicDelegate' #Blocks are to functions as A2DynamicDelegate is to delegates.
pod 'Reachability' #ARC and GCD Compatible Reachability Class for iOS and OS X. Drop in replacement for Apple Reachability.
pod 'AFNetworking' #A delightful iOS and OS X networking framework.
pod 'AQGridView' #A grid view for iPhone/iPad, designed to look similar to NSCollectionView.
pod 'Base64' #RFC 4648 Base64 implementation in Objective-C ARC.
pod 'CustomBadge' #Draws a typical iOS badge indicator with a custom text on any view.
pod 'EGOCache' #Fast Caching for Objective-C (iPhone & Mac Compatible).
pod 'FileMD5Hash' #Library for computing MD5 hashes of files with small memory usage.
pod 'JSONKit' #A Very High Performance Objective-C JSON Library.
pod 'NSData+Base64' #Base64 for NSData.
pod 'RestKit' #RestKit is a framework for consuming and modeling RESTful web resources on iOS and OS X.
pod 'SDWebImage' #Asynchronous image downloader with cache support with an UIImageView category.
pod 'SOCKit' #String <-> Object Coder for Objective-C.
pod 'SSKeychain' #Simple Cocoa wrapper for the keychain that works on Mac and iOS.
pod 'SVProgressHUD' #A clean and lightweight progress HUD for your iOS app.
pod 'SVPullToRefresh' #Give pull-to-refresh to any UIScrollView with 1 line of code.
pod 'TestFlightSDK' #TestFlightSDK for over-the-air beta testing and crash reporting.
pod 'UAModalPanel' #An animated modal panel alternative for iOS.
pod 'cocoa-oauth' #Cocoa library for creating signed requests according to the OAuth 1.0a standard.
pod 'libffi' #A portable foreign-function interface library.
pod 'vfrReader' #An open source PDF file reader/viewer for iOS.

```


# 使えるのみ

## form

* <https://github.com/jverdi/JVFloatLabeledTextField>

## HUD & progress

* <https://github.com/relatedcode/ProgressHUD>
* <https://github.com/sgryschuk/SGNavigationProgress>

## image

* <https://github.com/gonzalezreal/Vertigo>

## select

* <https://github.com/chiunam/CTAssetsPickerController>

## menu

* <https://github.com/romaonthego/REFrostedViewController>

## collection & grid

* <https://github.com/applidium/ADLivelyCollectionView>

## intro

* <https://github.com/park0ur/Path-Intro-iPhone> スースはこっちが綺麗
* <https://github.com/icepat/ICETutorial>

## effect animation

* <https://github.com/facebook/pop>

## その他

* [ios7 sample](http://code4app.net/ios/iOS7-Sampler/5254b2186803faba0d000003)
* [ios7 actionsheet sample](https://github.com/ianb821/IBActionSheet)
