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
        [self initWithDictionary:dict];
    }
    return self;
}

- (void)initWithDictionary:(NSDictionary *)dictionary {
    _date      = dictionary[@"date"];
    _total     = dictionary[@"total"];
    _videoList = dictionary[@"videoList"];
}

- (void)updateDataInfo:(MYOpenEyesInfo *)dataInfo {
    
    if (dataInfo.date) {
        _date = dataInfo.date;
    }
    if (dataInfo.total) {
        _total = dataInfo.total;
    }
    if (dataInfo.videoList) {
        _videoList = dataInfo.videoList;
    }
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







