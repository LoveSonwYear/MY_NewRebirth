//
//  MYBaseNavigationController.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYBaseNavigationController.h"

@interface MYBaseNavigationController ()

@end

@implementation MYBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self my_loadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources sdthat can be recreated.
}

- (void)my_loadView {
    [self.navigationBar setBackgroundImage:[UIColor imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        self.navigationBar.layer.masksToBounds = NO;
    }
}

+ (void)initialize {
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *fontSizeDic = [NSMutableDictionary dictionary];
    fontSizeDic[NSFontAttributeName] = [UIFont systemFontOfSize: 21];
    fontSizeDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:fontSizeDic];
    
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    //普通
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1];
    [appearance setTitleTextAttributes:dict forState:UIControlStateNormal];
    //高亮
    NSMutableDictionary *hightDict = [NSMutableDictionary dictionary];
    hightDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:hightDict forState:UIControlStateHighlighted];
    //不能点
    NSMutableDictionary *disableDict = [NSMutableDictionary dictionary];
    disableDict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableDict forState:UIControlStateDisabled];
    
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
