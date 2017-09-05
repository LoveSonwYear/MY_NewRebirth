//
//  MYOpenEyesViewController.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesViewController.h"
#import "MYOpenEyesView.h"
#import "MYOpenEyesViewModel.h"

@interface MYOpenEyesViewController ()

@property (nonatomic, strong)MYOpenEyesView *openEyesView;
@property (nonatomic, strong)MYOpenEyesViewModel *openEyesViewModel;

@end

@implementation MYOpenEyesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - general
- (void)ls_initData {
    
    [self.openEyesViewModel loadData];
}

- (void)ls_addSubviews {
    self.title = @"开眼";
    
    [self.view addSubview:self.openEyesView];
}

- (void)ls_layoutSubviews {
    WS(weakSelf);
    [self.openEyesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(weakSelf.view);
    }];
}

- (void)ls_bindViewModel {
    
}



#pragma mark - lazy

- (MYOpenEyesView *)openEyesView {
    if (!_openEyesView) {
        _openEyesView = [[MYOpenEyesView alloc] initWithViewModel:self.openEyesViewModel];
    }
    return _openEyesView;
}

- (MYOpenEyesViewModel *)openEyesViewModel {
    if (!_openEyesViewModel) {
        _openEyesViewModel = [[MYOpenEyesViewModel alloc] init];
    }
    return _openEyesViewModel;
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
