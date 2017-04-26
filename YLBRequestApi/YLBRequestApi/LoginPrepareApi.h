//
//  LoginPrepareApi.h
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import "YTKNetwork/YTKNetwork.h"

@interface LoginPrepareApi : YTKRequest

- (instancetype)initWithUsername:(NSString *)username tick:(NSString *)tick;

@end
