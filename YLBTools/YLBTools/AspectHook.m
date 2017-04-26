//
//  AspectHook.m
//  TabBarControllerAOP
//
//  Created by chenjiangchuan on 2017/3/26.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "AspectHook.h"
#import "Aspects.h"
#import "UIImage+Bundle.h"

@implementation AspectHook

+ (void)aspectHookViewController {
    
    [UIViewController aspect_hookSelector:@selector(init) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
        
//        NSLog(@"%s", __FUNCTION__);
//        NSLog(@"%@", aspectInfo.instance);
        
        // 获取当前tabBarItem
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[UITabBarController class]]];
        
        // 字体颜色
        NSMutableDictionary *foregroundColorAttribute = [NSMutableDictionary dictionary];
        foregroundColorAttribute[NSForegroundColorAttributeName] = [UIColor orangeColor];
        
        // 字体大小
        NSMutableDictionary *fontAttributeNormal = [NSMutableDictionary dictionary];
        UIFont *tabTextFont = [UIFont systemFontOfSize:10];
        fontAttributeNormal[NSFontAttributeName] = tabTextFont;
        
        // 更改tabBarItem属性
        [tabBarItem setTitleTextAttributes:foregroundColorAttribute forState:UIControlStateSelected];
        [tabBarItem setTitleTextAttributes:fontAttributeNormal forState:UIControlStateNormal];
        
        // 获取当前的navigationBar
        UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UINavigationController class]]];
        
        // 字体大小
        NSMutableDictionary *fontAttribute = [NSMutableDictionary dictionary];
        UIFont *navigationBarFont = [UIFont systemFontOfSize:16];
        fontAttribute[NSFontAttributeName] = navigationBarFont;
        [navigationBar setTitleTextAttributes:fontAttribute];
        
        // 更改navigationBar属性
        [navigationBar setBackgroundImage:[UIImage bundleName:@"QMToolsModule" withImageName:@"navigationbarBackground"] forBarMetrics:UIBarMetricsDefault];
        
    } error:nil];
}

@end
