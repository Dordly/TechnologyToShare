//
//  FirstTableViewCell.h
//  TechnologyToShare
//
//  Created by dordly on 2018/7/23.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableViewCell : UITableViewCell
/**标题*/
@property (nonatomic, strong)UILabel * topWordLabel;
/**标签*/
@property (nonatomic, strong)UILabel * topTitleLabel;
/**头像*/
@property (nonatomic, strong)UIImageView * userImgView;
/**名称*/
@property (nonatomic, strong)UILabel * nameLable;
/**内容*/
@property (nonatomic, strong)UILabel * contentLabel;
/**时间*/
@property (nonatomic, strong)UILabel * timeLabel;
/**评论数，喜欢数*/
@property (nonatomic, strong)UILabel * numLabel;
/**分割线*/
@property (nonatomic, strong)UIView * lineView;
/**更多*/
@property (nonatomic, strong)UIButton * moreButton;
@end
