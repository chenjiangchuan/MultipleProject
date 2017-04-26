//
//  NeighbourCanBindingReformer.m
//  Pods
//
//  Created by chenjiangchuan on 2017/3/28.
//
//

#import "NeighbourCanBindingReformer.h"
#import "NeighbourCanBindingKeys.h"

NSString * const kNeighourCanBindingDataKeyCode =            @"kNeighourCanBindingDataKeyCode";
NSString * const kNeighourCanBindingDataKeyMessage =         @"kNeighourCanBindingDataKeyMessage";
NSString * const kNeighourCanBindingDataKeyNeighborhoodsID = @"kNeighourCanBindingDataKeyNeighborhoodsID";
NSString * const kNeighourCanBindingDataKeyFRemark =         @"kNeighourCanBindingDataKeyFRemark";
NSString * const kNeighourCanBindingDataKeyFAddress =        @"kNeighourCanBindingDataKeyFAddress";
NSString * const kNeighourCanBindingDataKeyFNeibname =       @"kNeighourCanBindingDataKeyFNeibname";
NSString * const kNeighourCanBindingDataKeyDepartmentID =    @"kNeighourCanBindingDataKeyDepartmentID";
NSString * const kNeighourCanBindingDataKeyFEncodeKey =      @"kNeighourCanBindingDataKeyFEncodeKey";
NSString * const kNeighourCanBindingDataKeyCanBinding =      @"kNeighourCanBindingDataKeyCanBinding";

@implementation NeighbourCanBindingReformer

- (id)request:(YTKBaseRequest *)request reformData:(NSDictionary *)originData {
    
    if (![originData[@"code"] isEqualToString:@"0"]) return @{kNeighourCanBindingDataKeyCode: originData[@"code"],
                                                              kNeighourCanBindingDataKeyMessage: originData[@"msg"]};
    
    NSDictionary *resultOriginData = originData[@"result"];
    NSDictionary *neiborIdResultData = resultOriginData[@"neibor_id"];
    NSDictionary *resultData = @{
                                 kNeighourCanBindingDataKeyCode: originData[@"code"],
                                 kNeighourCanBindingDataKeyNeighborhoodsID: neiborIdResultData[@"neighborhoods_id"],
                                 kNeighourCanBindingDataKeyFRemark: neiborIdResultData[@"fremark"],
                                 kNeighourCanBindingDataKeyFAddress: neiborIdResultData[@"faddress"],
                                 kNeighourCanBindingDataKeyFNeibname: neiborIdResultData[@"fneibname"],
                                 kNeighourCanBindingDataKeyDepartmentID: neiborIdResultData[@"department_id"],
                                 kNeighourCanBindingDataKeyFEncodeKey: neiborIdResultData[@"fencode_key"],
                                 kNeighourCanBindingDataKeyCanBinding: neiborIdResultData[@"can_binding"],
                                 };
    
    return resultData;
}

@end
