//
//  NeighourListReformer.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "NeighourListReformer.h"
#import "NeighourListReformerKeys.h"

NSString * const kNeighourListDataKeyCode =      @"kNeighourListDataKeyCode";
NSString * const kNeighourListDataKeyMessage =   @"kNeighourListDataKeyMessage";
NSString * const kNeighourListDataKeyFPort =     @"kNeighourListDataKeyFPort";
NSString * const kNeighourListDataKeyFUserID =   @"kNeighourListDataKeyFUserID";
NSString * const kNeighourListDataKeyFIP =       @"kNeighourListDataKeyFIP";
NSString * const kNeighourListDataKeyFNeibName = @"kNeighourListDataKeyFNeibName";
NSString * const kNeighourListDataKeyID =        @"kNeighourListDataKeyID";
NSString * const kNeighourListDataKeyFFsIP =     @"kNeighourListDataKeyFFsIP";
NSString * const kNeighourListDataKeyFFsPort =   @"kNeighourListDataKeyFFsPort";

@implementation NeighourListReformer

- (id)request:(YTKBaseRequest *)request reformData:(NSDictionary *)originData {
    
    if (![originData[@"code"] isEqualToString:@"0"]) return @{kNeighourListDataKeyCode: originData[@"code"],
                                                              kNeighourListDataKeyMessage: originData[@"msg"]};
    
    NSArray *resultOriginData = originData[@"result"];
    NSMutableArray *resultData = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < resultOriginData.count; index++) {
        NSDictionary *data = @{
                               kNeighourListDataKeyFPort: resultOriginData[index][@"fport"],
                               kNeighourListDataKeyFUserID: resultOriginData[index][@"fuser_id"],
                               kNeighourListDataKeyFIP: resultOriginData[index][@"fip"],
                               kNeighourListDataKeyFNeibName: resultOriginData[index][@"fneib_name"],
                               kNeighourListDataKeyID: resultOriginData[index][@"id"],
                               kNeighourListDataKeyFFsIP: resultOriginData[index][@"ffs_ip"],
                               kNeighourListDataKeyFFsPort: resultOriginData[index][@"ffs_port"],
                               };
        [resultData addObject:data];
    }
    
    
    return [resultData copy];
}

@end
