//
//  QMValidDataTools.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/24.
//
//

#import "QMValidDataTools.h"

@implementation QMValidDataTools

+ (QMValidDataType)validDataForPhoneNumber:(NSString *)phoneNumber {
    NSString *regexString = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    BOOL isMatch = [predicate evaluateWithObject:phoneNumber];
    
    if (isMatch) return QMValidDataTypePhoneOK;
    
    NSInteger length = phoneNumber.length;
    
    if (length < 11) return QMValidDataTypePhoneLessError;
    else if (length > 11) return QMValidDataTypePhoneMoreError;
    else return QMValidDataTypePhoneFormatError;
}

+ (QMValidDataType)validDataForPassword:(NSString *)password {
    NSUInteger length = password.length;
    
    if (length < 6) return QMValidDataTypePasswordLessError;
    else if (length >= 25) return QMValidDataTypePasswordMoreError;
    else return QMValidDataTypePasswordOK;
}

+ (QMValidDataType)validDataForValidCode:(NSString *)validCode {
    NSString *regexString = @"^[0-9]{4}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    BOOL isMatch = [predicate evaluateWithObject:validCode];

    return isMatch ? QMValidDataTypeValidCodeOK:QMValidDataTypeValidCodeFormatError;
}

+ (QMValidDataType)validDataForEmail:(NSString *)email {
    NSString *emailRegexString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegexString];
    BOOL isMatch = [predicate evaluateWithObject:email];
    
    return isMatch ? QMValidDataTypeEmailOK:QMValidDataTypeEmailError;
}

+ (QMValidDataType)validDataForIDCard:(NSString *)idCard {
    
    if (idCard.length <= 0) return QMValidDataTypeIDCardError;
    
    NSString *regexString = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString];
    BOOL isMatch = [identityCardPredicate evaluateWithObject:idCard];
    
    return isMatch ? QMValidDataTypeIDCardOK:QMValidDataTypeIDCardError;
}

@end
