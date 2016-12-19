---
title: ios image関連
date: 2014-04-25
tags: ios, image
---

# SDWebImage vs FastImageCache
<http://bpoplauschi.wordpress.com/tag/fastimagecache/>

*結論はSDWebImageがいい。*
その後がFastImageCacheが追っている


# SDWebImage

## source

githubからそのままダウンロードや cloneすると`libwebp/src/utils/random.c not found`がないと怒られる。

`libwebp`はsubmoduleなのでそれまで cloneするようにすると大丈夫

`git clone --recursive https://github.com/rs/SDWebImage.git`

##
<http://qiita.com/myaaaaa_chan/items/1198abc5351ca57a552c>

##
* (SDWebImageを初めて使う際の注意点)[http://www.masaplabs.com/use-sdwebimage-notice/]

##
* (SDWebImageでアプリ容量がどんどん増えていく件)[http://ht6030.com/archives/155]





