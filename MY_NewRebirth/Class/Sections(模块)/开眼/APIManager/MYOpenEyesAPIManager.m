//
//  MYOpenEyesAPIManager.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesAPIManager.h"

@interface MYOpenEyesAPIManager ()

@end

@implementation MYOpenEyesAPIManager

- (instancetype)init {
    if (self = [super init]) {
        self.checker = self;
    }
    return self;
}

#pragma mark - LSAPIManagerProtocol
- (NSString *)path {
    return @"baobab.wandoujia.com/";
}

- (NSString *)serviceIdentifier {
    return kLSNetServiceGeneral;
}

- (LSAPIManagerRequestType)requestType {
    return LSAPIManagerRequestTypeGET;
}

- (NSDictionary *)requestParams:(NSDictionary *)params {
    return params;
}

- (BOOL)shouldCache {
    return YES;
}

#pragma mark - LSAPIManagerDataChecker
- (BOOL)manager:(LSAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data {
    NSLog(@"验证成功 + isCorrectWithParamsData + %@", data);
    return YES;
}

- (BOOL)manager:(LSAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data {
    NSLog(@"验证成功 + isCorrectWithCallBackData + %@", data);
    return YES;
}








@end
