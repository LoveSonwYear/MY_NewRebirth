//
//  MYOpenEyesItem.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesItem.h"

@implementation MYOpenEyesItem

- (MYOpenEyesInfo *)myOpenEyesInfo {
    return (MYOpenEyesInfo *)_dataInfo;
}

#pragma mark - system
- (void)dealloc {
    if (_delegate && [(id<MYOpenEyesItemDelegate>)_delegate respondsToSelector:@selector(removeFromOpenEyesModel:)]) {
        [(id<MYOpenEyesItemDelegate>)_delegate removeFromOpenEyesModel:self];
    }
}

#pragma mark - public
- (void)updateTimeFireObserver:(BOOL)fireObserver {
    if (fireObserver) {
        // undo 测试obverser
        [self.myOpenEyesInfo updateDataInfo:nil];
        [self fireUpdateTimeObserves];
    }
}

#pragma mark - update data
- (void)updateDataInfo:(MYOpenEyesInfo *)dataInfo {
    [self.myOpenEyesInfo updateDataInfo:dataInfo];
    [self fireUpdateTimeObserves];
}

#pragma mark - private
- (void)fireUpdateTimeObserves {
    
    NSHashTable *tmp = [_observers copy];
    
    for (id<MYOpenEyesInfoObserver> observer in tmp) {
        if ([_observers containsObject:observer]) {
            continue;
        }
        if ([observer respondsToSelector:@selector(openEyesItemDataChange:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [observer openEyesItemDataChange:self];
            });
        }
    }
    
}









@end
