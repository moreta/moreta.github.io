---
title: iOS collection view
date: 2014-04-23
tags: ios, collectionview
---




* <http://damir.me/implementing-uicollectionview-layout>
* <http://skeuo.com/uicollectionview-custom-layout-tutorial>
* <https://github.com/chiahsien/CHTCollectionViewWaterfallLayout>
* <https://github.com/ElectricPeelSoftware/EPSReactiveCollectionViewController>
これが？
* <http://applidium.github.io/ADLivelyCollectionView/>
* <https://github.com/applidium/ADLivelyCollectionView>

# form

* <https://github.com/ElectricPeelSoftware/EPSCollectionViewFormLayout>

# create collectionview programmatically

* <https://github.com/erica/iOS-6-Cookbook>

UICollectionView ではあらかじめセルのクラスを登録しておくことで、再利用可能なセルがない場合に新しく作成したものを返してくれるようになっています。
そのため dequeueReusableCellWithReuseIdentifier: が nil を返しません。


## imageを使う方法

<http://stackoverflow.com/questions/19269266/reused-cells-in-a-uicollectionview-show-multiple-uiimageviews-when-they-should-o>