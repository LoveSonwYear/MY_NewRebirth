//
//  MYOpenEyesModel.h
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/5.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "LSModel.h"
#import "MYOpenEyesItem.h"
#import "MYOpenEyesInfo.h"

@interface MYOpenEyesModel : LSModel

+ (instancetype)sharedInstance;

- (MYOpenEyesItem *)getMYOpenEyesItemWithInfo:(MYOpenEyesInfo *)info;

@end
