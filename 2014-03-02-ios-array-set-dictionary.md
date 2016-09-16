---
title: iOS Array & Set & dictionary
date: 2014-03-02
tags: ios, objective-c, array, set
---


# set


```

    NSArray *color1 = @[@"blue", @"red", @"yellow", @"white"];
    NSArray *color2 = @[@"green", @"white", @"black"];
    NSSet *colorSet1 = [NSSet setWithArray:color1];
    NSSet *colorSet2 = [NSSet setWithArray:color2];

    NSMutableSet *allColors = [NSMutableSet setWithCapacity:1];
    [allColors unionSet:colorSet1];
    [allColors unionSet:colorSet2];

    NSLog(@"すべての色 %@", allColors);
    NSLog(@"colorSet1 %@", colorSet1);
    NSLog(@"colorSet2 %@", colorSet2);

```


## OrderSetの値をソートする

```

    NSComparisonResult (^comparator)(id, id) = ^(id obj1, id obj2)
    {
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        if (v1 < v2)
            return (NSComparisonResult)NSOrderedAscending;
        else if (v1 > v2)
            return (NSComparisonResult)NSOrderedDescending;
        else
            return (NSComparisonResult)NSOrderedSame;

    };

    // オーダーセットを作る
    NSArray *nums = @[@2, @8, @24, @3, @5];
    NSMutableOrderedSet *numOrderSet = [NSMutableOrderedSet orderedSetWithArray:nums];
    [numOrderSet addObject:@11];

    // comparator
    NSArray *sortedArray = [numOrderSet sortedArrayUsingComparator:comparator];
    NSLog(@" %@", sortedArray);

```

# dictionary(辞書と構造体)

キーと値がペアになったデータ構造持ったデータ。
*ようは、hashのようなもの*


新しいシンタックスはrubyと似ている

## GET

旧
```
[exdic valueForKey:@"a"]
```

新
```
exdic[@"a"]
```

## SET

旧
```
[place setObject:@"六本木", forKey:@"駅"]
```

新
```
place[@"駅"] = @"六本木"
```

# NSMutabledictionary