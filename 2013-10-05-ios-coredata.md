---
title: "iOS Coredata"
date: 2013-10-05
comments: true
tags: ios, coredata
---

## API

エンティティ

* 情報 `NSEntityDescription`
* 属性 `NSAttributeDescription`
* 関係 `NSRelationshipDescription`

### MSManagedObjectModel

* データベース、ストレージ、NSpersistentStoreCoordinatorが利用する設計図で理解しよう。
* Model.momdこのファイルから生成する

```
NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
NSManagedObjectModel* managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
```

.momdは実はdirectoryで
編集用のModel.xcdatamodeldから生成される実行用ファイル群を収める

## NSPersistentStoreCoordinator

MSManagedObjectModel（データベースやストレージで理解しよう）から生成

```
NSError *error = nil;
NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
//  自分のクラスオブジェクトからURLをもらうように変更。[self class].url
if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self class].url options:nil error:&error]) {
  NSLog(@"永続ストアの設定に失敗 %@", [error localizedDescription]);    //  [error info]を使ったり、errorをそのまま表示させてもよい。
  return nil;
 }
```

* 永続性を保証する
* ようはDBに入れるためのコンテキストの間を仲介する役割

## NSManagedObjectContext

* modelの情報をpersistent storage(DBで考えよう)に保存するために利用される(NSManagedObjectContext use a coordinator to save object graphs to persistent storage and to retrieve model information)

```
NSManagedObjectContext *_managedObjectContext = [[NSManagedObjectContext alloc] init];
 [_managedObjectContext setPersistentStoreCoordinator:coordinator];
 return _managedObjectContext;
```

## NSManagedObject

* `NSManagedObjectContext`から管理される
* 一つのrowで考えればいい

```
id obj = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
[obj setValue:@"お名前" forKey:@"name"];
[obj setValue:@"男性" forKey:@"sex"];
[obj setValue:@"1" forKey:@"classNumber"];
```

`managedObjectContext`から取得して

## CoreDataで保存しない一時的なManagedObjectを作る方法

```objc
- (id)objectForTemp{
    NSManagedObject *obj;
    NSManagedObjectContext *context = self.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Book" inManagedObjectContext:context];
    obj = [[[Book alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:nil] autorelease];

    return obj;
}
```

## How to Deal with Temporary NSManagedObject instances?

<http://stackoverflow.com/questions/3256195/how-to-deal-with-temporary-nsmanagedobject-instances>

The easiest way to do this is to create your NSManagedObject instances without an associated NSManagedObjectContext.

~~~ objc
NSEntityDescription *entity = [NSEntityDescription entityForName:@"MyEntity" inManagedObjectContext:myMOC];
NSManagedObject *unassociatedObject = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
~~~

Then when you want to save it:

~~~ objc
[myMOC insertObject:unassociatedObject];
NSError *error = nil;
[myMoc save:&error];
//Check the error!
~~~

## １つのレコードのみfetchする()

<http://stackoverflow.com/questions/1197593/how-to-fetch-only-the-first-record-in-core-data>

You can use the setFetchLimit: method on NSFetchRequest to limit the number of records fetched. So if you only want the first record:

~~~
// Given some existing NSFetchRequest *request and NSManagedObjectContext *context:
[request setFetchLimit:1];
NSError *error;
NSArray *results = [context executeFetchRequest:request error:&error];
~~~

Note that the call to executeFetchRequest:error: will still return an NSArray; you still need to pull the first object off the array before you can work with it, even though it's an array of size 1.

Another, less efficient method: Depending on your store type, limiting the fetch may produce dramatic performance speedups. If it doesn't, however, or you're not that worried about performance, and you might use more data later, you can just pull the first object off the array ahead of time:

~~~
// Given some existing result NSArray *results:
NSManagedObject *firstManagedObject = [results objectAtIndex:0];
~~~

You can even get it into another array (for use in a UITableViewController, for example) by doing this:

~~~
// Again, with some NSArray *results:
NSArray *singleObjectResult = [results subarrayWithRange:NSMakeRange(0, 1)];
~~~

上記の方法もいいが以下のようにcategoryを使うのもいい

~~~
// NSManagedObject+Additions.h

@interface NSManagedObject (Acani)

+ (NSString *)entityName;
+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSManagedObject *)firstInManagedObjectContext:(NSManagedObjectContext *)context;

@end


// NSManagedObject+Additions.m

#import "NSManagedObject+Additions.h"

@implementation NSManagedObject (Acani)

+ (NSString *)entityName {
    return NSStringFromClass([self class]);
}

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription entityForName:self.entityName inManagedObjectContext:context];
}

+ (NSManagedObject *)firstInManagedObjectContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[self entityInManagedObjectContext:context]];
    [fetchRequest setFetchLimit:1];

    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    [fetchRequest release];
    if (fetchedObjects == nil) {
        NSLog(@"Fetch sender error %@, %@", error, [error userInfo]);
        return nil;
    } else if ([fetchedObjects count] > 0) {
        return [fetchedObjects objectAtIndex:0];
    }
    return nil;
}

@end
~~~


# custom NSManagedObject

## 初期化

### awakeFromInsert(新規作成の時に初期化)

生涯を通して１度だけ生成時に呼び出されるメソッド


```
- (void)awakeFromInsert
{
    [super awakeFromInsert];
    printf(" awakeFromInsert %p\n", self);
    self.date = [NSDate date];
}

```

### awakeFromFetch(永続ストアから再現しと時の初期化)

```
- (void)awakeFromFetch
{
    [super awakeFromFetch];
    printf(" awakeFromFetch %p\n", self);
}
```

## アクセサメソッド

### primitive method


# NSManagedObjectContextObjectsDidChangeNotification


# Core Dataに関するエラー番号の情報

[Core Data Constants Reference](https://developer.apple.com/library/mac/documentation/cocoa/reference/CoreDataFramework/Miscellaneous/CoreData_Constants/Reference/reference.html)

[Core Data Constants Reference:PDF](https://developer.apple.com/library/mac/documentation/cocoa/reference/CoreDataFramework/Miscellaneous/CoreData_Constants/CoreData_Constants.pdf)