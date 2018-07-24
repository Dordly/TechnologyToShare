//
//  FirstTableViewCell.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/23.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = Color_white;
        
        self.topWordLabel = insertAutoLabel(self.contentView, MainText_Color, Color_clear, Regular_32, NSTextAlignmentLeft, @"标题1");
        
        UIView *shadowView = insertAutoView(self.contentView, Color_clear);
        shadowView.layer.shadowColor = MainTwoText_Color.CGColor;
        shadowView.layer.shadowOffset = CGSizeMake(0, 0);
        shadowView.layer.shadowOpacity = 0.8;
        shadowView.layer.shadowRadius = 9.0;
        shadowView.layer.cornerRadius = 9.0;
        
        self.topTitleLabel = insertAutoLabel(shadowView, Color_white, Main_Color, Regular_18, NSTextAlignmentCenter, @" 标签一 ");
        self.topTitleLabel.layer.cornerRadius = 4;
        self.topTitleLabel.layer.masksToBounds = YES;
        
        self.userImgView = insertAutoImage(self.contentView, Img_Name(@"first_icon"), Color_clear);
        self.nameLable = insertAutoLabel(self.contentView, MainTwoText_Color, Color_clear, Regular_22, NSTextAlignmentLeft, @"佚名");
        self.contentLabel = insertAutoLabel(self.contentView, MainText_Color, Color_clear, Regular_28, NSTextAlignmentLeft, @"这里显示的是文章的部分内容");
        self.contentLabel.numberOfLines = 0;
        self.timeLabel = insertAutoLabel(self.contentView, MainTwoText_Color, Color_clear, Regular_22, NSTextAlignmentLeft, @"2018.07.23");
        self.numLabel = insertAutoLabel(self.contentView, MainTwoText_Color, Color_clear, Regular_22, NSTextAlignmentLeft, @"评价：2  喜欢：20");
        
        self.lineView = insertAutoView(self.contentView, Line_Color);
        self.moreButton = insertAutoButton(self.contentView, nil, nil, Color_clear, MainTwoText_Color, MainTwoText_Color, Regular_30, @"点击查看更多", UIControlContentHorizontalAlignmentRight);
        self.lineView.hidden = YES;
        self.moreButton.hidden = YES;
        
        [self.topWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(20);
            make.left.equalTo(self.contentView.mas_left).offset(20);
        }];
        [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.topWordLabel.mas_centerY);
            make.left.equalTo(self.topWordLabel.mas_right).offset(5);
            make.height.mas_offset(20);
            make.width.mas_offset(40);
        }];
        [self.topTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.left.equalTo(shadowView);
        }];
        [self.userImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topWordLabel.mas_bottom).offset(10);
            make.left.equalTo(self.topWordLabel.mas_left);
            make.width.height.mas_offset(30);
        }];
        [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.userImgView);
            make.left.equalTo(self.userImgView.mas_right).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.topWordLabel.mas_left);
            make.right.equalTo(self.nameLable.mas_right);
            make.top.equalTo(self.userImgView.mas_bottom).offset(10);
        }];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel.mas_left);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        }];
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.timeLabel);
            make.left.equalTo(self.timeLabel.mas_right).offset(10);
            make.right.equalTo(self.contentLabel.mas_right);
        }];
        
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-50);
            make.height.mas_offset(0.5);
        }];
        [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.mas_bottom);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
        }];
    }
    return self;
}
@end
