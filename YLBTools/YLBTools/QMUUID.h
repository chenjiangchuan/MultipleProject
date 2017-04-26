//
//  QMUUID.h
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import <Foundation/Foundation.h>

@interface QMUUID : NSObject

/**
 *  把UUID写入keychain中
 */
+ (void)saveUUIDToKeyChain;

/**
 *  从keychain中读取UUID
 *
 *  @return UUID
 */
+ (NSString *)readUUIDFromKeyChain;


+ (NSString *)getUUIDString;


@end
