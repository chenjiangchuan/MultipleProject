//
//  UIImage+Bundle.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "UIImage+Bundle.h"

@implementation UIImage (Bundle)

+ (UIImage *)bundleName:(NSString *)bundleName withImageName:(NSString *)imageName {
    NSBundle *selfBundle = [NSBundle bundleForClass:NSClassFromString(bundleName)];
    NSString *imagePath = [selfBundle pathForResource:[NSString stringWithFormat:@"%@.bundle/%@.png", bundleName, imageName] ofType:nil];
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
