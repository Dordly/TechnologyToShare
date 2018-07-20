//
//  UtilView.m
//  最划算
//
//  Created by wangminqing on 15-2-2.
//  Copyright (c) 2015年 wangminqing. All rights reserved.
//

#import "UtilView.h"

@implementation UtilView


UIView *insertView(id superView, UIColor *color,CGRect rect){
    
    UIView *view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = color;
    [superView addSubview:view];
    
    return view;
}

/**会员管理*/
UIView * insertContentView(id mainView, CGFloat w, NSString * title,NSString * personNum,NSInteger tag, BOOL isLast, CGFloat h){
    UIView * selfView = insertView(mainView,[UIColor clearColor], CGRectMake(tag*w, 0, w, h));
    UILabel * titleLabel = insertAutoLabel(selfView, RGBA(254, 227, 225,1), [UIColor clearColor], Regular_28, NSTextAlignmentCenter, title);
    UILabel * numLabel = insertAutoLabel(selfView, [UIColor whiteColor], [UIColor clearColor], Medium_40, NSTextAlignmentCenter, personNum);
    UIView * lineView = insertAutoView(selfView, RGBA(255, 154, 153,1));
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfView.mas_top).offset(20);
        make.centerX.equalTo(selfView.mas_centerX);
        make.height.mas_offset(15);
    }];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5);
        make.centerX.equalTo(selfView.mas_centerX);
        make.height.mas_offset(30);
    }];
    if (isLast==YES){
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selfView.mas_right);
            make.centerY.equalTo(selfView.mas_centerY);
            make.height.mas_offset(40);
            make.width.mas_offset(1);
        }];
    }
    return selfView;
}

UIButton *insertTitleButton(id superView, UIColor *textColor, CGRect rect, id target,SEL action, NSInteger tag, NSString *text, UIFont *font,UIColor *h_Color){
    return insertImageButton(superView, textColor, rect, target, action, nil, nil, tag, text, font,h_Color);
}


UIButton *insertImageButton(id superView, UIColor *textColor, CGRect rect, id target,SEL action, UIImage *image_n,UIImage *image_h,NSInteger tag, NSString *text,UIFont *font,UIColor *h_Color){
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:rect];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if (nil != image_n) {
        [button setBackgroundImage:image_n forState:UIControlStateNormal];
    }
    
    if (nil != image_h){
        [button setBackgroundImage:image_h forState:UIControlStateNormal];
    }
    
    button.tag = tag;
    
    if (text.length > 1) {
        [button setTitle:text forState:UIControlStateNormal];
        [button setTitleColor:textColor forState:UIControlStateNormal];
        [button setTitleColor:h_Color forState:UIControlStateHighlighted];
    }
    
    button.titleLabel.font = font;
    
    [superView addSubview:button];
    
    return button;
    
}

UIImageView *insertImage(id superView, UIImage *image, CGRect rect){
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:rect];
    img.contentMode=UIViewContentModeScaleAspectFill;
    img.clipsToBounds=YES;
    img.layer.masksToBounds=YES;
//    img.layer.borderWidth = 0.15;
//    img.layer.borderColor = ThirdColor.CGColor;
    
//    img.layer.masksToBounds=YES;
//    img.layer.cornerRadius=30;
//    img.layer.borderWidth = 0.15;
//    //设置边框颜色
//    img.layer.borderColor = ThirdColor.CGColor;
//    img.contentMode=UIViewContentModeScaleAspectFill;
//    img.clipsToBounds=YES;

    [img setImage:image];
    
    [superView addSubview:img];
    
    return img;
}

UILabel *insertMutiLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr, NSInteger lineNum,NSLineBreakMode lineBreakMode ,CGRect rect){
    
    UILabel *label=[[UILabel alloc]initWithFrame: rect];
    label.backgroundColor = bgColor;
    label.font = font;
    label.textAlignment = align;
    label.textColor=textColor;
    label.text =contentStr;
    label.lineBreakMode = lineBreakMode;
    label.numberOfLines = lineNum;
    [superView addSubview:label];
    return label;
}
UILabel *insertLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr,CGRect rect){
    
    UILabel *label=[[UILabel alloc]initWithFrame: rect];
    label.backgroundColor = bgColor;
    label.font = font;
    label.textAlignment = align;
    label.textColor=textColor;
    label.text =contentStr;
    
    [superView addSubview:label];
    return label;
}
TapImageView *insertTapImage(id superView,UIImage *image, CGRect rect,UIColor *bgColor){
    
    TapImageView *tapImageView=[[TapImageView alloc]initWithFrame:rect];
    tapImageView.backgroundColor=bgColor;
    tapImageView.userInteractionEnabled=NO;
    tapImageView.contentMode=UIViewContentModeScaleAspectFill;
    tapImageView.clipsToBounds=YES;
    tapImageView.layer.masksToBounds=YES;
    tapImageView.layer.cornerRadius=2;
    tapImageView.layer.borderWidth = 0.3;
    tapImageView.layer.borderColor = ThirdColor.CGColor;
    tapImageView.image=image;
    [superView addSubview:tapImageView];
    return tapImageView;
    
}
PromtTapImageView *insertPromtTapImage(id superView,UIImage *image, CGRect rect,UIColor *bgColor){
    
    PromtTapImageView *promtTapImageView=[[PromtTapImageView alloc]initWithFrame:rect];
    promtTapImageView.backgroundColor=bgColor;
    promtTapImageView.userInteractionEnabled=NO;
    promtTapImageView.contentMode=UIViewContentModeScaleAspectFill;
    promtTapImageView.clipsToBounds=YES;
    promtTapImageView.layer.masksToBounds=YES;
    promtTapImageView.layer.cornerRadius=2;
    promtTapImageView.layer.borderWidth = 0.15;
    promtTapImageView.layer.borderColor = ThirdColor.CGColor;
   
    [superView addSubview:promtTapImageView];
    return promtTapImageView;
}

@end
