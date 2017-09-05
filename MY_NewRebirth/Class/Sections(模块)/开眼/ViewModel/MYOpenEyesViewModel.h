//
//  MYOpenEyesViewModel.h
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "LSViewModel.h"

@interface MYOpenEyesViewModel : LSViewModel

@property (nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong)RACSubject *openEyesRefreshSubject;

- (void)loadData;

@end
