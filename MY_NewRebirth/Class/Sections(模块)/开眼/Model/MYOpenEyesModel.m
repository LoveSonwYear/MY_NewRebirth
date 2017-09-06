//
//  MYOpenEyesModel.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesModel.h"

@interface MYOpenEyesModel ()<MYOpenEyesItemDelegate>

@property (nonatomic, strong)RACDisposable *timerDispose;

@property (nonatomic, strong)NSMutableDictionary *itemsDictionary;

@end

@implementation MYOpenEyesModel {
    NSHashTable *_itemList;
}

+ (instancetype)sharedInstance {
    static MYOpenEyesModel *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[MYOpenEyesModel alloc] init];
    });
    return shareInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _itemList = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

#pragma mark - private
- (void)initTimer {
    @weakify(self);
    if (_timerDispose) {
        [_timerDispose dispose];
        _timerDispose = nil;
    }
    self.timerDispose = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        @strongify(self);
        [self fireTimerObservers];
    }];
}

- (void)clearTimer {
    if (_timerDispose) {
        [_timerDispose dispose];
        _timerDispose = nil;
    }
}

- (void)fireTimerObservers {
    NSHashTable *tmp = [_timerDispose copy];
    for (MYOpenEyesItem *openEyesItem in tmp) {
        if (![_itemList containsObject:openEyesItem]) {
            continue;
        }
        [openEyesItem updateTimeFireObserver:YES];
    }
}

#pragma mark - publish
- (MYOpenEyesItem *)getMYOpenEyesItemWithInfo:(MYOpenEyesInfo *)info {
    if (!info) {
        return nil;
    }
    NSArray *array = info.videoList;
    if (![self.itemsDictionary objectForKey:array]) {
        MYOpenEyesItem *item = [[MYOpenEyesItem alloc] initWithDataInfo:info delegate:self];
        NSValue *value = [NSValue valueWithNonretainedObject:item];
        [self.itemsDictionary setObject:value forKey:array];
        [_itemList addObject:item];
        if (_itemList.count > 0 && !_timerDispose) {
            [self initTimer];
        }
        return item;
    } else {
        MYOpenEyesItem *item = (MYOpenEyesItem *)((NSValue *)[self.itemsDictionary objectForKey:array]).nonretainedObjectValue;
        [item updateDataInfo:info];
        return item;
    }
}

#pragma mark - lazy
- (NSMutableDictionary *)itemsDictionary {
    if (!_itemsDictionary) {
        _itemsDictionary = [[NSMutableDictionary alloc] init];
    }
    return _itemsDictionary;
}

#pragma mark - LSCodeStandardItemDelegate
- (void)removeFromOpenEyesModel:(MYOpenEyesItem *)item {
    NSArray *array = item.myOpenEyesInfo.videoList;
    if ([self.itemsDictionary.allKeys containsObject:array]) {
        [self.itemsDictionary removeObjectForKey:array];
    }
    if (self.itemsDictionary.allKeys.count == 0 && _timerDispose) {
        [self clearTimer];
    }
}


















@end
