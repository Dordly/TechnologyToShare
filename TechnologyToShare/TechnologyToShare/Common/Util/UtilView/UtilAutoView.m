//
//  UtilAutoView.m
//  最划算
//
//  Created by 名品导购网MPLife.com on 16/2/18.
//  Copyright © 2016年 wangminqing. All rights reserved.
//

#import "UtilAutoView.h"

@implementation UtilAutoView

UIView *insertAutoView(id superView, UIColor *color){
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = color;
    [superView addSubview:view];
    
    return view;
    
}
UIButton *insertAutoButton(id superView,UIImage *normalImage,UIImage *selectedImage,UIColor *bgColor,UIColor *titleNormalColor,UIColor *titleSelectedColor,UIFont *titleFont,NSString *titleStr,UIControlContentHorizontalAlignment slignment){
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:selectedImage forState:UIControlStateSelected];
    [btn setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bgColor];
    btn.titleLabel.font=titleFont;
    btn.contentHorizontalAlignment = slignment;
    [btn setTitle:titleStr forState:UIControlStateNormal];
    
//    [btn setTitle:titleStr forState:UIControlStateSelected];
//    btn.layer.masksToBounds=YES;
//    btn.layer.cornerRadius=2;
//    btn.layer.borderWidth = 0.15;
//    btn.layer.borderColor = ThirdColor.CGColor;
    [superView addSubview:btn];
    return btn;
    
};
UIButton *changeAutoButton(id superView,UIImage *normalImage,UIImage *selectedImage,UIColor *bgColor,UIColor *titleNormalColor,UIColor *titleSelectedColor,UIFont *titleFont,NSString *titleStr){
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    [btn setTitleColor:titleNormalColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bgColor];
    btn.titleLabel.font=titleFont;
    [btn setTitle:titleStr forState:UIControlStateNormal];
    [superView addSubview:btn];
    return btn;
    
};
UIImageView *insertAutoImage(id superView, UIImage *image,UIColor *bgColor){
    
    UIImageView *img = [[UIImageView alloc]init];
    img.backgroundColor=bgColor;
    [img setImage:image];
    img.contentMode=UIViewContentModeScaleAspectFill;
    img.clipsToBounds=YES;
    [superView addSubview:img];
    return img;
}

UILabel *insertAutoMutiLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr, NSInteger lineNum,NSLineBreakMode lineBreakMode){
    
    UILabel *label=[[UILabel alloc]init];
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
UILabel *insertAutoLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr){
    
    UILabel *label=[[UILabel alloc]init];
    label.backgroundColor = bgColor;
    label.font = font;
    label.textAlignment = align;
    label.textColor=textColor;
    label.text =contentStr;
    
    [superView addSubview:label];
    return label;
}
#pragma mark - 创建循环内容显示 -
UILabel *  setContentLabel(id mainView, UIColor * textColor, UIColor * bgColor, UIFont *font,NSTextAlignment align,NSString *contentStr,NSInteger topTag, BOOL isButton, SEL action){
    UILabel *label=[[UILabel alloc]init];
    label.backgroundColor = bgColor;
    label.font = font;
    label.textAlignment = align;
    label.textColor=textColor;
    label.text =contentStr;
    [mainView addSubview:label];
    return label;
}
TapImageView *insertAutoTapImage(id superView,UIImage *image,UIColor *bgColor){
    
    TapImageView *tapImageView=[[TapImageView alloc]init];
    tapImageView.backgroundColor=bgColor;
    tapImageView.userInteractionEnabled=YES;
    tapImageView.contentMode=UIViewContentModeScaleAspectFill;
    tapImageView.clipsToBounds=YES;
    tapImageView.layer.masksToBounds=YES;
    tapImageView.layer.cornerRadius=5;
    tapImageView.layer.borderWidth = 0.15;
    tapImageView.layer.borderColor = ThirdColor.CGColor;
    tapImageView.image=image;
    [superView addSubview:tapImageView];
    return tapImageView;
    
}
UITextField *insertAutoTextField(id superView,NSString*placeholderStr,UIFont *font,NSTextAlignment alignment,UIColor *textColor,UIColor *bgColor){
    
    UITextField *textField = [[UITextField alloc]init];
    textField.borderStyle = UITextBorderStyleNone;
    textField.placeholder=placeholderStr;
    textField.autocorrectionType = UITextAutocorrectionTypeYes;
    textField.returnKeyType = UIReturnKeyDone;
    textField.clearButtonMode = UITextFieldViewModeNever;
    textField.font = font;
    textField.textAlignment = alignment;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.textColor= textColor;
    [textField setBackgroundColor:bgColor];
    [superView addSubview:textField];
    return textField;
    
    
}
UITextView *insertAutoTextView(id superView,NSString*placeholderStr,UIFont *font,NSTextAlignment alignment,UIColor *textColor,UIColor *bgColor){

    UITextView *textView = [[UITextView alloc]init];
    textView.placeholder=placeholderStr;
    textView.font = font;
    textView.textAlignment = alignment;
    textView.textColor= textColor;
    [textView setBackgroundColor:bgColor];
    [superView addSubview:textView];
    return textView;
    
}
@end
