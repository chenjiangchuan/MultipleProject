//
//  GetNeighbourListApi.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "GetNeighbourListApi.h"
#import "LoginSuccessReformerKeys.h"

@implementation GetNeighbourListApi

- (NSString *)requestUrl {
    return @"/users/get_nei_ip_list.json";
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
             @"user_id": [[NSUserDefaults standardUserDefaults] objectForKey:kLoginSuccessDataKeyUserID]
             };
}

@end
