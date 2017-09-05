//
//  MYOpenEyesItem.h
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "LSDataItem.h"
#import "MYOpenEyesInfo.h"

@class MYOpenEyesItem;

@protocol MYOpenEyesInfoObserver <LSDataItemObserver>
@optional
- (void)openEyesItemDataChange:(MYOpenEyesItem *)item;
@end

@protocol MYOpenEyesItemDelegate <LSDataItemDelegate>
- (void)removeFromOpenEyesModel:(MYOpenEyesItem *)item;
@end


@interface MYOpenEyesItem : LSDataItem

@property (nonatomic, strong, readonly)MYOpenEyesInfo *myOpenEyesInfo;

#pragma mark - logic
- (void)updateTimeFireObserver:(BOOL)fireObserver;

#pragma mark - data
- (void)updateDataInfo:(MYOpenEyesInfo *)dataInfo;

@end
