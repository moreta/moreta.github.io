---
title: ios controller
date: 2014-04-28
tags: ios, controller
---

# Custom Initialization for a View Controller using Storyboards



* <http://stackoverflow.com/questions/12981953/custom-initialization-for-a-view-controller-using-storyboards>
* <http://stackoverflow.com/questions/7226239/objective-c-custom-view-and-implementing-init-method>

こんな感じかな？

```
- (void)commonInit
{
    // do any initialization that's common to both -initWithFrame:
    // and -initWithCoder: in this method
}

- (id)initWithFrame:(CGRect)aRect
{
    if ((self = [super initWithFrame:aRect])) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    if ((self = [super initWithCoder:coder])) {
        [self commonInit];
    }
    return self;
}
```