//
//  LoginSuccessReformer.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "LoginSuccessReformer.h"
#import "LoginSuccessReformerKeys.h"

NSString * const kLoginSuccessDataKeyCode =                 @"kLoginSuccessDataKeyCode";
NSString * const kLoginSuccessDataKeyMessage =              @"kLoginSuccessDataKeyMessage";
NSString * const kLoginSuccessDataKeyFsIp =                 @"kLoginSuccessDataKeyFsIp";
NSString * const kLoginSuccessDataKeyFsPort =               @"kLoginSuccessDataKeyFsPort";
NSString * const kLoginSuccessDataKeyGestirePwd =           @"kLoginSuccessDataKeyGestirePwd";
NSString * const kLoginSuccessDataKeyRegisterYet =          @"kLoginSuccessDataKeyRegisterYet";
NSString * const kLoginSuccessDataKeyRegisterationTimeout = @"kLoginSuccessDataKeyRegisterationTimeout";
NSString * const kLoginSuccessDataKeyToken =                @"kLoginSuccessDataKeyToken";
NSString * const kLoginSuccessDataKeyTokenTimeout =         @"kLoginSuccessDataKeyTokenTimeout";
NSString * const kLoginSuccessDataKeyTransport =            @"kLoginSuccessDataKeyTransport";
NSString * const kLoginSuccessDataKeyUserID =               @"kLoginSuccessDataKeyUserID";
NSString * const kLoginSuccessDataKeyUserPassword =         @"kLoginSuccessDataKeyUserPassword";
NSString * const kLoginSuccessDataKeyUserSip =              @"kLoginSuccessDataKeyUserSip";
NSString * const kLoginSuccessDataKeyUsername =             @"kLoginSuccessDataKeyUsername";

@implementation LoginSuccessReformer

- (id)request:(YTKBaseRequest *)request reformData:(NSDictionary *)originData {
    
    if (![originData[@"code"] isEqualToString:@"0"]) return @{kLoginSuccessDataKeyCode: originData[@"code"],
                                                              kLoginSuccessDataKeyMessage: originData[@"msg"]};
    
    NSDictionary *originResultData = originData[@"result"];
    NSDictionary *resultData = @{
                    kLoginSuccessDataKeyCode: originData[@"code"],
                    kLoginSuccessDataKeyFsIp: originResultData[@"fs_ip"],
                    kLoginSuccessDataKeyFsPort: originResultData[@"fs_port"],
                    kLoginSuccessDataKeyGestirePwd: originResultData[@"gestire_pwd"],
                    kLoginSuccessDataKeyRegisterYet: originResultData[@"register_yet"],
                    kLoginSuccessDataKeyRegisterationTimeout: originResultData[@"registrationTimeout"],
                    kLoginSuccessDataKeyToken: originResultData[@"token"],
                    kLoginSuccessDataKeyTokenTimeout: originResultData[@"token_timeout"],
                    kLoginSuccessDataKeyTransport: originResultData[@"transport"],
                    kLoginSuccessDataKeyUserID: originResultData[@"user_id"],
                    kLoginSuccessDataKeyUserPassword: originResultData[@"user_password"],
                    kLoginSuccessDataKeyUserSip: originResultData[@"user_sip"],
                    kLoginSuccessDataKeyUsername: originResultData[@"username"],
                   };
    
    return resultData;
}

- (void)saveSuccessDataUserDefaults:(NSDictionary *)data {
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyFsIp] forKey:kLoginSuccessDataKeyFsIp];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyFsPort] forKey:kLoginSuccessDataKeyFsPort];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyGestirePwd] forKey:kLoginSuccessDataKeyGestirePwd];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyRegisterYet] forKey:kLoginSuccessDataKeyRegisterYet];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyRegisterationTimeout] forKey:kLoginSuccessDataKeyRegisterationTimeout];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyToken] forKey:kLoginSuccessDataKeyToken];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyTokenTimeout] forKey:kLoginSuccessDataKeyTokenTimeout];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyTransport] forKey:kLoginSuccessDataKeyTransport];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyUserID] forKey:kLoginSuccessDataKeyUserID];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyUserPassword] forKey:kLoginSuccessDataKeyUserPassword];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyUserSip] forKey:kLoginSuccessDataKeyUserSip];
    [[NSUserDefaults standardUserDefaults] setObject:data[kLoginSuccessDataKeyUsername] forKey:kLoginSuccessDataKeyUsername];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
