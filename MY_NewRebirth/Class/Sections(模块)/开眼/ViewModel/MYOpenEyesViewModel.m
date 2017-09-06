//
//  MYOpenEyesViewModel.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesViewModel.h"
#import "MYOpenEyesAPIManager.h"
#import "MYOpenEyesDataTransator.h"

@interface MYOpenEyesViewModel ()<LSAPIManagerCallBackDelegate, LSAPIManagerParamSource, LSAPIManagerInterceptor>

@property (nonatomic, strong)MYOpenEyesAPIManager *openEyesAPIManager;

@property (nonatomic, strong)MYOpenEyesDataTransator *openEyesDataTransator;

@end

@implementation MYOpenEyesViewModel

#pragma mark - public
- (void)loadData {
    [self.openEyesAPIManager loadData];
}

#pragma mark - LSAPIManagerParamSource
- (NSDictionary *)paramsDataForAPIManager:(LSAPIBaseManager *)manager {
    return [@{@"num":@"1",
              @"date":@"20170905",
              @"vc":@"10",
              @"u":@"011f2924aa2cf27aa5dc8066c041fe08116a9a0c",
              @"v":@"3.8.0",
              @"f":@"iphone"} mutableCopy];
}

#pragma mark - LSAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(LSAPIBaseManager *)manager {
    self.dataArray = [manager fetchDataWithTranslator:self.openEyesDataTransator];
    // 发送信号
    [self.openEyesRefreshSubject sendNext:nil];
}

- (void)managerCallAPIDidFailed:(LSAPIBaseManager *)manager {
    DLog(@"获取数据失败了!");
}

#pragma mark - LSAPIManagerInterceptor

- (BOOL)manager:(LSAPIBaseManager *)manager beforePerformSuccessWithResponse:(LSURLResponse *)response {
    DLog(@"拦截到 + beforePerformSuccessWithResponse + %@", response);
    return YES;
}

- (void)manager:(LSAPIBaseManager *)manager afterPerformSuccessWithResponse:(LSURLResponse *)response {
    DLog(@"拦截到 + afterPerformSuccessWithResponse + %@", response);
}

- (BOOL)manager:(LSAPIBaseManager *)manager beforePerformFailWithResponse:(LSURLResponse *)response {
    DLog(@"拦截到 + beforePerformFailWithResponse + %@", response);
    return YES;
}

- (void)manager:(LSAPIBaseManager *)manager afterPerformFailWithResponse:(LSURLResponse *)response {
    DLog(@"拦截到 + afterPerformFailWithResponse + %@", response);
}

- (BOOL)manager:(LSAPIBaseManager *)manager shouldCallAPIWithParams:(NSDictionary *)params {
    DLog(@"拦截到 + shouldCallAPIWithParams + %@", params);
    return YES;
}

- (void)manager:(LSAPIBaseManager *)manager afterCallingAPIWithParams:(NSDictionary *)params {
    DLog(@"拦截到 + afterCallingAPIWithParams + %@", params);
}

#pragma mark - lazy
- (RACSubject *)openEyesRefreshSubject {
    if (!_openEyesRefreshSubject) {
        _openEyesRefreshSubject = [RACSubject subject];
    }
    return _openEyesRefreshSubject;
}

- (MYOpenEyesAPIManager *)openEyesAPIManager {
    if (!_openEyesAPIManager) {
        _openEyesAPIManager = [[MYOpenEyesAPIManager alloc] init];
        _openEyesAPIManager.delegate    = self;
        _openEyesAPIManager.paramSource = self;
        _openEyesAPIManager.interceptor = self;
    }
    return _openEyesAPIManager;
}

- (MYOpenEyesDataTransator *)openEyesDataTransator {
    if (!_openEyesDataTransator) {
        _openEyesDataTransator = [[MYOpenEyesDataTransator alloc] init];
    }
    return _openEyesDataTransator;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
    }
    return _dataArray;
}




@end
