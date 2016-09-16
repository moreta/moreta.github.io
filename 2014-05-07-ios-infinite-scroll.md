---
title: iOS infinite scroll
date: 2014-05-07
tags: ios, infinite-scroll
---



* <https://github.com/hachinobu/LoadMoreTableView>

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //一番下までスクロールしたかどうか
    if(self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height))
    {
      //まだ表示するコンテンツが存在するか判定し存在するなら○件分を取得して表示更新する
    }
}
```

* <http://stackoverflow.com/questions/22777176/uirefreshcontrol-pull-left-to-right-refresh-concept-in-uicollectionview-horiz>

でも、このソースは
