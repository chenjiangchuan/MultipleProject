//
//  NeighbourCanBindingApi.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "NeighbourCanBindingApi.h"
#import "LoginSuccessReformerKeys.h"

@implementation NeighbourCanBindingApi
{
    NSString *_neighbourName;
}

- (instancetype)initWithNeighbourName:(NSString *)neighbourName {
    self = [super init];
    if (self) {
        _neighbourName = neighbourName;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/users/is_can_binding.json";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    return @{
             @"token": [[NSUserDefaults standardUserDefaults] objectForKey:kLoginSuccessDataKeyToken],
             @"username": [[NSUserDefaults standardUserDefaults] objectForKey:kLoginSuccessDataKeyUsername],
             };
}

- (id)requestArgument {
    return @{
             @"username": [[NSUserDefaults standardUserDefaults] objectForKey:kLoginSuccessDataKeyUsername],
             @"nei_name": _neighbourName,
             @"user_id": [[NSUserDefaults standardUserDefaults] objectForKey:kLoginSuccessDataKeyUserID]
             };
}

@end
