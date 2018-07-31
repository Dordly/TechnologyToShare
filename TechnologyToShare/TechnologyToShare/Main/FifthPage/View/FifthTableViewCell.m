//
//  FifthTableViewCell.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/25.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FifthTableViewCell.h"

@implementation FifthTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = Color_white;
        
        self.leftImgView = insertAutoImage(self.contentView, Img_Name(@""), Color_clear);
        self.centerTitleLabel = insertAutoLabel(self.contentView, MainText_Color, Color_clear, Regular_32, NSTextAlignmentLeft, @"标题一");
        self.rightImgView = insertAutoImage(self.contentView, Img_Name(@"right"), Color_clear);
        [self.leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView.mas_left).offset(20);
            make.height.width.mas_offset(25);
        }];
        [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).offset(-20);
            make.height.width.mas_offset(20);
        }];
        [self.centerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.leftImgView.mas_right).offset(10);
            make.right.equalTo(self.rightImgView.mas_left).offset(-10);
        }];
    }
    return self;
}
@end
