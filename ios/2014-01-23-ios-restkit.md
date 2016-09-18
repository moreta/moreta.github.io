---
title: RESTKit
date: 2014-01-23
tags: ios, restkit
---


# RestKit 0.20 tutorial


## RKGist

RKGist is an example application built with RestKit for use in conjunction with the Getting Acquainted with RestKit tutorial

* <https://github.com/RestKit/RKGist/blob/master/TUTORIAL.md>

### Master-Detail Application Create

ProductName : RKGist
ほかは適当に

### Installing RestKit via CocoaPods

```
gem install cocoapods
pod setup

cd your-project

```

`emacs Podfile`

`Podfile`に以下を入れる

```
platform :ios, 6.0
pod 'RestKit', '~> 0.20.3'

# Include optional Testing and Search components
pod 'RestKit/Testing', '~> 0.20.3'
pod 'RestKit/Search', '~> 0.20.3'

# Import Expecta for Testing
target :test do
  link_with :RKGistTests
  pod 'Expecta', '0.2.1'
end
```

Invoke CocoaPods to install the dependencies:
`pod install`


`.pch`ファイル

```
#import <Availability.h>

#ifndef __IPHONE_5_0
#warning "This project uses features only available in iOS SDK 5.0 and later."
#endif

#ifdef __OBJC__
    #import <UIKit/UIKit.h>
    #import <Foundation/Foundation.h>
    // #import <CoreData/CoreData.h>
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED
    #import <SystemConfiguration/SystemConfiguration.h>
    #import <MobileCoreServices/MobileCoreServices.h>
#else
    #import <SystemConfiguration/SystemConfiguration.h>
    #import <CoreServices/CoreServices.h>
#endif

// Make RestKit globally available
#import <RestKit/RestKit.h>

```


# totutorial
## raywenderlich

*coffeekit*

<http://www.raywenderlich.com/58682/introduction-restkit-tutorial>

*NSScreencast tutorials*

* <http://nsscreencast.com/episodes/53-restkit-object-manager>
* <http://nsscreencast.com/episodes/52-restkit-coredata>
* <http://nsscreencast.com/episodes/51-intro-to-restkit-mapping>

## 他tutorial

*Developing RESTful iOS Apps with RestKit by Blake Watters*

* <http://mobile.tutsplus.com/tutorials/iphone/restkit_ios-sdk/>
* <http://mobile.tutsplus.com/tutorials/iphone/advanced-restkit-development_iphone-sdk/>

* <http://madeveloper.blogspot.com/2013/01/ios-restkit-tutorial-code-for-version.html>
* [RestKit wiki](https://github.com/RestKit/RestKit/wiki)
* [NSScreen is a paid service but its codes are free](https://github.com/subdigital/nsscreencast)




## 孤児になったobjectの削除


## modelとmanagerを利用して


<http://stackoverflow.com/questions/19632529/simple-json-login-post-on-restkit-0-20>

## request api

<http://keighl.com/post/loving-restkit-020/>

`getObject`, `putObject`, `postObject`
`postObject :`でobjectの指定はoptional

```
[[RKObjectManager sharedManager] postObject:nil // Optional object to be serialized to NSDictionary

                                       // Relative path from RKObjectManager baseURL
                                       path:@"login"

                                 // Extra information to send along
                                 parameters:@{ @"email" : self.email, @"password" : self.password}

                                    // Success block.
                                    success:^(RKObjectRequestOperation *o, RKMappingResult *result) {
                                      o.HTTPRequestOperation.response.statusCode; // Status code
                                      result.array // All mapped object
                                      result.firstObject; // First mapped object in the array
                                    }

                                    // Error block
                                    failure:^(RKObjectRequestOperation *o, NSError *error) {
                                      o.HTTPRequestOperation.response.statusCode; // Response code
                                      o.HTTPRequestOperation.responseData; // Raw response data
                                    }
];
```

## Mapping setup & configuration

<http://keighl.com/post/loving-restkit-020/>

```
RKObjectMapping *gameSerializationMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];

[gameSerializationMapping addAttributeMappingsFromDictionary:@{
  @"name": @"name",
  @"duration": @"duration",
  @"privacy": @"private",
  @"description": @"description",
}];

[objectManager addRequestDescriptor:
    [RKRequestDescriptor requestDescriptorWithMapping:gameSerializationMapping
                                          objectClass:[Game class]
                                          rootKeyPath:@"game"
                                               method:RKRequestMethodPOST]];

[objectManager addRequestDescriptor:
    [RKRequestDescriptor requestDescriptorWithMapping:gameSerializationMapping
                                          objectClass:[Game class]
                                          rootKeyPath:@"game"
                                               method:RKRequestMethodPUT]];
```

## requeset , response descriptorを利用する方法

<http://stackoverflow.com/questions/18265461/handle-a-post-response-with-restkit-that-is-not-mapped-to-the-post-object>

*Object*

```
@interface MYRequest : NSObject

@property NSNumber *prop1;
@property NSNumber *prop2;

@end

@interface MYResponse : NSObject

@property NSArray *data;
@property NSString *message;

@end
```

*Mapping*

```
RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
[requestMapping addAttributeMappingsFromArray:@[@"prop1", @"prop2"]];

RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[MYResponse class]];
[requestMapping addAttributeMappingsFromArray:@[@"data", @"message"]];
```

*Descriptors*
```
RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:requestMapping
                                                                               objectClass:[MYRequest class]
                                                                               rootKeyPath:nil
                                                                                    method:RKRequestMethodPOST];

RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping
                                                                                        method:RKRequestMethodPOST
                                                                                   pathPattern:@"items"
                                                                                       keyPath:nil
                                                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
```

```
[self.objectManager addRequestDescriptor:requestDescriptor];
[self.objectManager addResponseDescriptor:responseDescriptor];
```

```
MYRequest *body = [MYRequest new];
[body setProp1:@123];
[body setProp2:@5];

[self.objectManager postObject:body
                          path:@"items"
                    parameters:nil
                       success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                           MYResponse *result = [mappingResult firstObject];
                           NSLog(@"Data: %@\nMessage: %@", [result data], [result message]);
                       }
                       failure:^(RKObjectRequestOperation *operation, NSError *error) {
                           NSLog(@"Error: %@", error);
                       }];
```





