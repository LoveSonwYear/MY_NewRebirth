//
//  MYOpenEyesInfo.h
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "LSDataInfo.h"

@class MYOpenEyesVideoInfo;
@protocol MYOpenEyesVideoInfo
@end

@class MYOpenEyesVoideProviderInfo;
@protocol MYOpenEyesVoideProviderInfo
@end

@class MYOpenEyesVoidePlayInfo;
@protocol MYOpenEyesVoidePlayInfo
@end

@class MYOpenEyesVoideConsumptionInfo;
@protocol MYOpenEyesVoideConsumptionInfo
@end

@interface MYOpenEyesInfo : LSDataInfo
@property (nonatomic, assign) NSInteger date;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, strong) NSArray *videoList;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (void)updateDataInfo:(MYOpenEyesInfo *)dataInfo;
@end

@interface MYOpenEyesVideoInfo : LSDataInfo
@property (nonatomic, copy)   NSString *dataType;
@property (nonatomic, assign) NSInteger voideId;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *voideDescription;
@property (nonatomic, strong) MYOpenEyesVoideProviderInfo *provider;
@property (nonatomic, copy)   NSString *category;
@property (nonatomic, copy)   NSString *author;
@property (nonatomic, copy)   NSString *playUrl;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, assign) NSInteger releaseTime;
@property (nonatomic, strong) NSArray *playInfo;
@property (nonatomic, strong) MYOpenEyesVoideConsumptionInfo *consumption;
@property (nonatomic, copy)   NSString *campaign;
@property (nonatomic, copy)   NSString *waterMarks;
@property (nonatomic, copy)   NSString *adTrack;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, copy)   NSString *shareAdTrack;
@property (nonatomic, copy)   NSString *favoriteAdTrack;
@property (nonatomic, copy)   NSString *webAdTrack;
@property (nonatomic, assign) NSInteger date;
@property (nonatomic, copy)   NSString *promotion;
@property (nonatomic, copy)   NSString *label;
@property (nonatomic, copy)   NSString *collected;
@property (nonatomic, copy)   NSString *played;
@property (nonatomic, copy)   NSString *coverForFeed;
@property (nonatomic, copy)   NSString *coverForDetail;
@property (nonatomic, copy)   NSString *coverBlurred;
@property (nonatomic, copy)   NSString *coverForSharing;
@property (nonatomic, copy)   NSString *webUrlForWeibo;
@property (nonatomic, copy)   NSString *rawWebUrl;
@end

// 第三(1)层
@interface MYOpenEyesVoideProviderInfo : LSDataInfo
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *icon;
@end

//  第三(2)层
@interface MYOpenEyesVoidePlayInfo : LSDataInfo
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, strong) NSDictionary *urlList;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *url;
@end

// 第三(3)层
@interface MYOpenEyesVoideConsumptionInfo : LSDataInfo
@property (nonatomic, assign) NSInteger collectionCount;
@property (nonatomic, assign) NSInteger shareCount;
@property (nonatomic, assign) NSInteger replyCount;
@end







