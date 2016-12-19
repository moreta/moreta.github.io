---
title: ios navigation bar
date: 2014-04-15
tags: ios, navigation
---


* <http://www.appcoda.com/customize-navigation-status-bar-ios-7/>



## logo image size

<http://stackoverflow.com/questions/17719947/size-of-image-on-uinavigationbar>


```
UIImageView *navigationImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 98, 34)];
navigationImage.image=[UIImage imageNamed:@"topNav-logo.png"];

UIImageView *workaroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 98, 34)];
[workaroundImageView addSubview:navigationImage];
self.navigationItem.titleView=workaroundImageView;
```

## plain style unsupported in a navigation item

テキスト通り