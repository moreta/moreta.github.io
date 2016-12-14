---
title: Objective-c
date: 2014-01-26
tags: objective-c
---


#### NSIndexSet

NSIndexSet で保持できる整数は NSUInteger 型

```objective-c
NSMutableIndexSet* indexes = [[NSMutableIndexSet alloc] init];

[indexes addIndex:1];
[indexes addIndex:3];
[indexes addIndex:5];

// 変更できないIndexSetにする
NSIndexSet* result = [[NSIndexSet allooc] initWithIndexSet:indexes];
```


```objective-c
NSUInteger indexValue;

// 最初のインデックス値を取得します。
indexValue = indexes.firstIndex;

// ここから、最後の値を取得し終えるまで、繰り返し値を取得して行きます。
while (indexValue != NSNotFound)
{
// ここで取得したインデックス値に対する処理を行います。


// 取得したインデックス値をもとに、その次のインデックス値を取得します。
indexValue = [indexes indexGreaterThanIndex:indexValue];
}
```


#### typedef

既存の型に新しい名前(別名)を付けるためのキーワード


### import

#### ifndef & define

```
#ifndef SomeHeader_h
#define SomeHeader_h

//ここにいろいろと書く

#endif
```

Cでは`#import`ではなく、`#include`で外部ファイルを読み込むが、
重複して読み込まれるとコンパイルエラーになる。

Objective-Cでは`#import`で読み込む。Cの`#include`と違って、
コンパイラが自動で二重にヘッダーファイルを読み込むことを防いでくれる。

#### enum

```
enum Status {
 Start = 0,
 Stop = 1
};


// 利用
enum Status status;
status = Start;
NSLog(@"status %d", status); // 0

status = Stop;
NSLog(@"status %d", status); //1

```

#### typedef & enum

typedefを使って、enumを独自の型として定義
