//
//  QMValidDataTools.h
//  Pods
//
//  Created by chenjiangchuan on 2017/3/24.
//
//  用来验证手机号、密码、验证码、邮箱、身份证是否有效
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QMValidDataType) {
    QMValidDataTypePhoneOK,
    QMValidDataTypePhoneMoreError,
    QMValidDataTypePhoneLessError,
    QMValidDataTypePhoneFormatError,
    
    QMValidDataTypePasswordOK,
    QMValidDataTypePasswordMoreError,
    QMValidDataTypePasswordLessError,
    QMValidDataTypePasswordFormatError,
    
    QMValidDataTypeValidCodeOK,
    QMValidDataTypeValidCodeError,
    QMValidDataTypeValidCodeFormatError,
    
    QMValidDataTypeEmailOK,
    QMValidDataTypeEmailError,
    
    QMValidDataTypeIDCardOK,
    QMValidDataTypeIDCardError,
};

static NSArray * const __QMValidDataTypeArray;

#define QMValidDataTypeGet (__QMValidDataType == nil ? __QMValidDataType = \
                                                [NSArray arrayWithObjects: \
                                                    @"QMValidDataTypePhoneOK", \
                                                    @"QMValidDataTypePhoneMoreError", \
                                                    @"QMValidDataTypePhoneLessError", \
                                                    @"QMValidDataTypePhoneFormatError", \
                                                    @"QMValidDataTypePasswordOK", \
                                                    @"QMValidDataTypePasswordMoreError", \
                                                    @"QMValidDataTypePasswordLessError", \
                                                    @"QMValidDataTypePasswordFormatError", \
                                                    @"QMValidDataTypeValidCodeOK", \
                                                    @"QMValidDataTypeValidCodeError", \
                                                    @"QMValidDataTypeValidCodeFormatError", \
                                                    @"QMValidDataTypeEmailOK", \
                                                    @"QMValidDataTypeEmailError", \
                                                    @"QMValidDataTypeIDCardOK", \
                                                    @"QMValidDataTypeIDCardError", \
                                                    nil] : __QMValidDataType)

#define QMValidDataTypeString(type) ([QMValidDataTypeGet objectAtIndex:type])
#define QMValidDataTypeEnum(string) ([QMValidDataTypeGet indexOfObject:string])

@interface QMValidDataTools : NSObject

+ (QMValidDataType)validDataForPhoneNumber:(NSString *)phoneNumber;

+ (QMValidDataType)validDataForPassword:(NSString *)password;

+ (QMValidDataType)validDataForValidCode:(NSString *)validCode;

+ (QMValidDataType)validDataForEmail:(NSString *)email;

+ (QMValidDataType)validDataForIDCard:(NSString *)idCard;

@end
