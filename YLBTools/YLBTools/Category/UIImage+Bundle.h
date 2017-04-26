//
//  UIImage+Bundle.h
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Bundle)

/**
 *  @author orioChan, 17-03-28 15:03:37
 *
 *  在Pod中读取bundle中的图片资源
 *
 *  @param bundleName Bundle名字
 *  @param imageName  图片名字
 *
 *  @return UIImage对象
 */
+ (UIImage *)bundleName:(NSString *)bundleName withImageName:(NSString *)imageName;

@end
