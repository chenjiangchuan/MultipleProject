//
//  LoginPrepareApi.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import "LoginPrepareApi.h"
#import <YLBTools/YLBTools.h>

@implementation LoginPrepareApi
{
    NSString *_username;
    NSString *_tick;
}

- (instancetype)initWithUsername:(NSString *)username tick:(NSString *)tick {
    self = [super init];
    if (self) {
        _username = username;
        _tick = tick;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/users/login.json";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"username": _username,
             @"tick": _tick,
             };
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    return @{
             @"uuid": [QMUUID readUUIDFromKeyChain],
             @"username": _username,
             };
}

@end
