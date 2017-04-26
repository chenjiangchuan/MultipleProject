//
//  LoginApi.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import "LoginApi.h"
#import <YLBTools/YLBTools.h>

@implementation LoginApi {
    NSString *_username;
    NSString *_password;
    NSString *_tick;
    NSString *_clientType;
}

- (instancetype)initWithUsername:(NSString *)username
                        password:(NSString *)password
                            tick:(NSString *)tick
                      clientType:(NSString *)clientType
                    randomNumber:(NSString *)randomNumber {
    self = [super init];
    if (self) {
        _username = username;
        _password = [[randomNumber stringByAppendingFormat:@"%@%@", tick, [password md5String ]] md5String];
        _tick = tick;
        _clientType = clientType;
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
             @"password": _password,
             @"client_type": _clientType,
             };
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    return @{
             @"uuid": [QMUUID readUUIDFromKeyChain],
             @"username": _username,
             };
}

@end
