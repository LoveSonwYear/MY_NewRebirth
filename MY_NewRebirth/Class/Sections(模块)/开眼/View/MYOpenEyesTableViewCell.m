//
//  MYOpenEyesTableViewCell.m
//  MY_NewRebirth
//
//  Created by 梅洋 on 2017/9/4.
//  Copyright © 2017年 meiyang. All rights reserved.
//

#import "MYOpenEyesTableViewCell.h"
#import "MYOpenEyesViewModel.h"
#import "MYOpenEyesInfo.h"

@interface MYOpenEyesTableViewCell ()
// 背景图
@property (nonatomic, strong)UIImageView *openEyesCellBackImv;
// 蒙版
@property (nonatomic, strong)UIView *openEyesCellMaskedView;
// 标题
@property (nonatomic, strong)UILabel *openEyesCellTitleLabel;
// 类型/时间
@property (nonatomic, strong)UILabel *openEyesCellTypesLabel;


@end


@implementation MYOpenEyesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - general
- (void)ls_addSubviews {
    [self.contentView addSubview:self.openEyesCellBackImv];
    [self.contentView addSubview:self.openEyesCellMaskedView];
    [self.openEyesCellMaskedView addSubview:self.openEyesCellTitleLabel];
    [self.openEyesCellMaskedView addSubview:self.openEyesCellTypesLabel];
}

- (void)ls_layoutSubviews {
    WS(weakSelf);
    // 主背景
    [self.openEyesCellBackImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentView);
    }];
    // 蒙版
    [self.openEyesCellMaskedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentView);
    }];
    // 标题
    [self.openEyesCellTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.openEyesCellMaskedView.mas_top).offset(jisuanH(80));
        make.width.mas_equalTo(weakSelf.openEyesCellMaskedView.mas_width);
        make.height.mas_equalTo(jisuanH(30));
        make.centerX.mas_equalTo(weakSelf.openEyesCellMaskedView.mas_centerX);
    }];
    // 类型
    [self.openEyesCellTypesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.openEyesCellTitleLabel.mas_bottom).offset(jisuanH(30));
        make.width.height.centerX.mas_equalTo(weakSelf.openEyesCellTitleLabel);
        make.bottom.mas_equalTo(weakSelf.openEyesCellMaskedView.mas_bottom).offset(jisuanH(-80));
    }];
}

#pragma mark - updataData
- (void)setOpenEyesCellViewModel:(MYOpenEyesCellViewModel *)openEyesCellViewModel {
    _openEyesCellViewModel = openEyesCellViewModel;
    
    NSArray *dataArr = openEyesCellViewModel.openCellItem.myOpenEyesInfo.videoList;
    MYOpenEyesVideoInfo *videoInfo = dataArr[0];
    //背景视图
    [self.openEyesCellBackImv sd_setImageWithURL:[NSURL URLWithString:videoInfo.coverForDetail] completed:nil];
    //标题
    self.openEyesCellTitleLabel.text = videoInfo.title;
    //种类 时间
    NSString *videoTime = [NSString stringWithFormat:@"%02ld'%02ld''",videoInfo.duration/60,videoInfo.duration%60];
    self.openEyesCellTypesLabel.text = [NSString stringWithFormat:@"%@ / %@",videoInfo.category,videoTime];
}


#pragma mark - lazy
- (UIImageView *)openEyesCellBackImv {
    if (!_openEyesCellBackImv) {
        _openEyesCellBackImv = [[UIImageView alloc] init];
    }
    return _openEyesCellBackImv;
}

- (UIView *)openEyesCellMaskedView {
    if (!_openEyesCellMaskedView) {
        _openEyesCellMaskedView = [[UIView alloc] init];
        _openEyesCellMaskedView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.33f];
    }
    return _openEyesCellMaskedView;
}

- (UILabel *)openEyesCellTitleLabel {
    if (!_openEyesCellTitleLabel) {
        _openEyesCellTitleLabel = [[UILabel alloc] init];
        _openEyesCellTitleLabel.textAlignment = NSTextAlignmentCenter;
        _openEyesCellTitleLabel.textColor = [UIColor whiteColor];
        _openEyesCellTitleLabel.font = [UIFont boldSystemFontOfSize:16.f];
    }
    return _openEyesCellTitleLabel;
}

- (UILabel *)openEyesCellTypesLabel {
    if (!_openEyesCellTypesLabel) {
        _openEyesCellTypesLabel = [[UILabel alloc] init];
        _openEyesCellTypesLabel.textAlignment = NSTextAlignmentCenter;
        _openEyesCellTypesLabel.textColor = [UIColor whiteColor];
        _openEyesCellTypesLabel.font = [UIFont systemFontOfSize:14];
    }
    return _openEyesCellTypesLabel;
}


@end
