//
//  MYOpenEyesDataTransator.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesDataTransator.h"
#import "MYOpenEyesCellViewModel.h"
#import "MYOpenEyesAPIManager.h"
#import "MYOpenEyesInfo.h"
#import "MYOpenEyesItem.h"
#import "MYOpenEyesModel.h"

@implementation MYOpenEyesDataTransator

- (id)manager:(LSAPIBaseManager *)manager translateData:(NSDictionary *)data {
    if ([manager isKindOfClass:[MYOpenEyesAPIManager class]]) {
        
        NSMutableArray *dailyListArray = data[@"dailyList"];
        
        return [[[dailyListArray rac_sequence] map:^id(NSDictionary *value) {
            
            MYOpenEyesInfo *openEyesInfo = [[MYOpenEyesInfo alloc] initWithDict:value];
            MYOpenEyesItem *openEyesItem = [[MYOpenEyesModel sharedInstance] getMYOpenEyesItemWithInfo:openEyesInfo];
            return [[MYOpenEyesCellViewModel alloc] initWithDataItem:openEyesItem delegate:nil];
        }] array];
    }
    return nil;
}







@end
