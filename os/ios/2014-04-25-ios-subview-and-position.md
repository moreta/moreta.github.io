---
title : iOS subview & position
date : 2014-04-25
tags : ios, subview
---




# 複数のview上から順番にaddする場合

addSubviewすると何もしないとがさなる形になるので
最初に追加したviewのframeを取得して次のviewのframeの計算に利用する


```
CGFloat offset = 25.0f;

CGRect frame1 = CGRectMake(10, 100, 30, 50);

UILabel *label = [[UILabel alloc] initWithFrame:frame1];
label.text = @"Varying text length here";
label.numberOfLines = 0;
[label sizeToFit];
[[self view] addSubview:label];

// CGRectMake (origin.x, origin.y, size.width, size.height)
CGRect frame2 = CGRectMake(10,
                           label.frame.origin.y + label.frame.size.height + offset,
                           300,
                           50);

UILabel *label2 = [[UILabel alloc] initWithFrame:frame2];
label2.text = @"Varying text length here";
label.numberOfLines = 0;
[label2 sizeToFit];
[[self view] addSubview:label2];
```
