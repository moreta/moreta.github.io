---
title: iOS Transition
date: 2014-04-22
tags: ios, transition
---


```
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
RESViewController *toViewController = [storyboard instantiateInitialViewController];

UIView *fromView =  weakSelf.window.rootViewController.view;
UIView *toView =  toViewController.view;
[UIView transitionWithView:weakSelf.window
                  duration:0.3
                  options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                           [fromView removeFromSuperview];
                           [weakSelf.window addSubview:toView];
                           weakSelf.window.rootViewController = toViewController;
                        }
                  completion:NULL];
```
