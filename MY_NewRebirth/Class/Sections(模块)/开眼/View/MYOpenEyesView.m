//
//  MYOpenEyesView.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesView.h"
#import "MYOpenEyesViewModel.h"
#import "MYOpenEyesTableViewCell.h"

@interface MYOpenEyesView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *openEyesTableView;

@property (nonatomic, strong)MYOpenEyesViewModel *openEyesViewModel;

@end

@implementation MYOpenEyesView

#pragma mark - general
- (void)ls_initData {
    
}

- (void)ls_addSubviews {
    [self addSubview:self.openEyesTableView];
}

- (void)ls_layoutSubviews {
    WS(weakSelf);
    [self.openEyesTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
}

- (void)ls_bindViewModel {
    
}

#pragma mark - delegate
#pragma mark - LSVMUIBridgeProtocol
- (void)ls_getViewModel:(id<LSViewModelProtocol>)viewModel {
    _openEyesViewModel = (MYOpenEyesViewModel *)viewModel;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MYOpenEyesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MYOpenEyesTableViewCell class]) forIndexPath:indexPath];
    
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}






#pragma mark - lazy
- (UITableView *)openEyesTableView {
    if (!_openEyesTableView) {
        _openEyesTableView = [[UITableView alloc] init];
        _openEyesTableView.delegate   = self;
        _openEyesTableView.dataSource = self;
        [_openEyesTableView registerClass:[MYOpenEyesTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MYOpenEyesTableViewCell class])];
    }
    return _openEyesTableView;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
