//
//  RandomReformer.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/27.
//
//

#import "RandomReformer.h"

@implementation RandomReformer

- (id)request:(YTKBaseRequest *)request reformData:(NSDictionary *)originData {
    NSDictionary *result = originData[@"result"];
    return result[@"random_num"];
}

@end
