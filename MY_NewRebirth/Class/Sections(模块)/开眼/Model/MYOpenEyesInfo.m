//
//  MYOpenEyesInfo.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesInfo.h"

@implementation MYOpenEyesInfo

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        
    }
    return self;
}


+ (NSDictionary *)mj_objectClassInArray {
    return @{@"videoList":@"MYOpenEyesVideoInfo"};
}

@end

@implementation MYOpenEyesVideoInfo
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"playInfo":@"MYOpenEyesVoidePlayInfo"};
}
@end

@implementation MYOpenEyesVoideProviderInfo
@end

@implementation MYOpenEyesVoidePlayInfo

@end

@implementation MYOpenEyesVoideConsumptionInfo
@end







