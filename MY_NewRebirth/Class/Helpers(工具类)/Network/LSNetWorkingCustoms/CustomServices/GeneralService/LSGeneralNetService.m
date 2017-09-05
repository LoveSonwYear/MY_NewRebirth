//
//  LSGeneralNetService.m
//  LSArchitecture
//
//  Created by 王隆帅 on 2017/3/26.
//  Copyright © 2017年 王隆帅. All rights reserved.
//

#import "LSGeneralNetService.h"
#import "LSAppContext.h"

@implementation LSGeneralNetService

- (BOOL)isOnline {
    
    return [[LSAppContext sharedInstance] isOnline];
}


/**
 线上环境
 生产环境
 */
- (NSString *)onlineApiBaseUrl {

//    return @"http://115.29.103.17:8030";
    return @"http://baobab.wandoujia.com/";
}

/**
 线下环境
 测试环境
 */
- (NSString *)offlineApiBaseUrl {

//    return @"http://115.29.103.17:8030";
    return @"http://baobab.wandoujia.com/";
}

@end
