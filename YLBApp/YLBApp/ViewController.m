//
//  ViewController.m
//  YLBApp
//
//  Created by chenjiangchuan on 2017/4/26.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "ViewController.h"
#import <YLBTools/YLBTools.h>
#import <YLBRequestApi/YLBRequestApi.h>

@interface ViewController () <YTKChainRequestDelegate>

/** UIButton */
@property (strong, nonatomic) UIButton *button;
/** LoginSuccessReformer */
@property (strong, nonatomic) LoginSuccessReformer *loginSuccessReformer;
/** RandomReformer */
@property (strong, nonatomic) RandomReformer *randomReformer;
/** NeighourListReformer */
@property (strong, nonatomic) NeighourListReformer *neighourListReformer;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = @"https://api.sayee.cn:28084";
    
    [QMUUID saveUUIDToKeyChain];
    
    [self.view addSubview:self.button];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews {
    self.button.frame = CGRectMake(50, 50, 100, 20);
}

#pragma mark - Event Response

- (void)buttonAction:(UIButton *)button {
    
    NSDictionary *parameter = @{
                                @"username": @"18170957509",
                                @"password": @"123456",
                                };
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970] * 1000;
    long long dTime = [[NSNumber numberWithDouble:time] longLongValue]; // 将double转为long long型
    NSString *tick = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型
    
    LoginPrepareApi *loginPrepareApi = [[LoginPrepareApi alloc] initWithUsername:parameter[@"username"] tick:tick];
    
    YTKChainRequest *chainRequest = [[YTKChainRequest alloc] init];
    [chainRequest addRequest:loginPrepareApi callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
        
        // 第一次请求获取到randomNumber
        NSString *randomNumber = [baseRequest fetchDataWithReformer:self.randomReformer];
        
        // 第二次请求
        LoginApi *loginApi = [[LoginApi alloc] initWithUsername:parameter[@"username"] password:parameter[@"password"] tick:tick clientType:@"4" randomNumber:randomNumber];
        
        [chainRequest addRequest:loginApi callback:^(YTKChainRequest * _Nonnull chainRequest, YTKBaseRequest * _Nonnull baseRequest) {
            //                    NSLog(@"baseRequest = %@", baseRequest.responseJSONObject);
            NSDictionary *loginDictionary = [baseRequest fetchDataWithReformer:self.loginSuccessReformer];
            
            if ([loginDictionary[kLoginSuccessDataKeyCode] isEqualToString:@"0"]) {
                [self.loginSuccessReformer saveSuccessDataUserDefaults:loginDictionary];
                
                // 获取小区房产列表
                GetNeighbourListApi *getNeighbourListApi = [[GetNeighbourListApi alloc] init];
                [getNeighbourListApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                    NSArray *resultArray = [request fetchDataWithReformer:self.neighourListReformer];
                    if ([resultArray isKindOfClass:[NSDictionary class]]) {
                        NSLog(@"%@", ((NSDictionary *)resultArray)[kNeighourListDataKeyMessage]);
                    } else { // 获取数据成功
                        NSLog(@"%@", resultArray);
                    }
                } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                    NSLog(@"failure = %@", request);
                }];
                
            } else {
                NSLog(@"%@", loginDictionary[kLoginSuccessDataKeyMessage]);
            }
        }];
    }];
    chainRequest.delegate = self;
    [chainRequest start];
}

#pragma mark - YTKChainRequestDelegate

- (void)chainRequestFinished:(YTKChainRequest *)chainRequest {
    NSLog(@"%s", __FUNCTION__);
}

- (void)chainRequestFailed:(YTKChainRequest *)chainRequest failedBaseRequest:(YTKBaseRequest *)request {
    NSLog(@"%s, error = %@", __FUNCTION__, request.error);
}

#pragma mark - Lazy Initialze

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"click me" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (LoginSuccessReformer *)loginSuccessReformer {
    if (_loginSuccessReformer == nil) {
        _loginSuccessReformer = [[LoginSuccessReformer alloc] init];
    }
    return _loginSuccessReformer;
}

- (RandomReformer *)randomReformer {
    if (_randomReformer == nil) {
        _randomReformer = [[RandomReformer alloc] init];
    }
    return _randomReformer;
}

- (NeighourListReformer *)neighourListReformer {
    if (_neighourListReformer == nil) {
        _neighourListReformer = [[NeighourListReformer alloc] init];
    }
    return _neighourListReformer;
}

@end
