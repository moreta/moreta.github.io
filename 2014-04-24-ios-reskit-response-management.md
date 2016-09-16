---
title: RESTKit Response management
date: 2014-04-24
tags: ios, restkit, response-management, authentication
---


## response management

<http://blog.higgsboson.tk/2013/09/03/global-request-management-with-restkit/>

```
#import "RKObjectRequestOperation.h"

@interface CustomRKObjectRequestOperation : RKObjectRequestOperation

@end

@implementation CustomRKObjectRequestOperation

- (void)setCompletionBlockWithSuccess:(void ( ^ ) ( RKObjectRequestOperation *operation , RKMappingResult *mappingResult ))success failure:(void ( ^ ) ( RKObjectRequestOperation *operation , NSError *error ))failure
{
    [super setCompletionBlockWithSuccess:^void(RKObjectRequestOperation *operation , RKMappingResult *mappingResult) {
        if (success) {
            success(operation, mappingResult);
        }

    }failure:^void(RKObjectRequestOperation *operation , NSError *error) {

        [[NSNotificationCenter defaultCenter] postNotificationName:@"connectionFailure" object:operation];

        if (failure) {
            failure(operation, error);
        }

    }];
}

@end
```

`[[RKObjectManager sharedManager] registerRequestOperationClass:[CustomRKObjectRequestOperation class]];`

失敗をlistenする必要があるのでどこかに以下を置く。特別ではないならAppDelegateに置く

`[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectionFailedWithOperation:) name:@"connectionFailure" object:nil];`

```
- (void)connectionFailedWithOperation:(NSNotification *)notification
{
    RKObjectRequestOperation *operation = (RKObjectRequestOperation *)notification.object;
    if (operation) {

        NSInteger statusCode = operation.HTTPRequestOperation.response.statusCode;

        switch (statusCode) {
            case 0: // No internet connection
            {
            }
                break;
            case  401: // not authenticated
            {
            }
                break;

            default:
            {
            }
                break;
        }
    }
}
```





