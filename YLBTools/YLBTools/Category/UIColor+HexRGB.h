//
//  UIColor+HexRGB.h
//  
//
//  Created by chenjiangchuan on 16/9/12.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexRGB)

/**
 *  通过十六进制设置颜色
 *
 *  @param inColorString 十六进制的数字 @"fafafa"
 *
 *  @return UIColor
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
