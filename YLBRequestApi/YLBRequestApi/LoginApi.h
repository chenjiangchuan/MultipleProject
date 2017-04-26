//
//  LoginApi.h
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import "YTKNetwork/YTKNetwork.h"

@interface LoginApi : YTKRequest

- (instancetype)initWithUsername:(NSString *)username
                        password:(NSString *)password
                            tick:(NSString *)tick
                      clientType:(NSString *)clientType
                    randomNumber:(NSString *)randomNumber;

@end
