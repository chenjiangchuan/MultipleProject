//
//  UIColor+HexRGB.m
//
//
//  Created by chenjiangchuan on 16/9/12.
//  Copyright © 2016年  All rights reserved.
//

#import "UIColor+HexRGB.h"

@implementation UIColor (HexRGB)

+ (UIColor *)colorFromHexRGB:(NSString *)inColorString
{
    UIColor *resultColor = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;

    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }

    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits

    resultColor = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];

    return resultColor;
}

@end
