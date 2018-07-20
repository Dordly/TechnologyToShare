//
//  UtilAutoView.h
//  最划算
//
//  Created by 名品导购网MPLife.com on 16/2/18.
//  Copyright © 2016年 wangminqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapImageView.h"
#import "UITextView+Placeholder.h"
@interface UtilAutoView : NSObject
#pragma mark ============>UIView
//设置常见View
UIView *insertAutoView(id view, UIColor *color);


#pragma mark =============>UIButton
UIButton *insertAutoButton(id superView,UIImage *normalImage,UIImage *selectedImage,UIColor *bgColor,UIColor *titleNormalColor,UIColor *titleSelectedColor,UIFont *titleFont,NSString *titleStr,UIControlContentHorizontalAlignment slignment);

UIButton *changeAutoButton(id superView,UIImage *normalImage,UIImage *selectedImage,UIColor *bgColor,UIColor *titleNormalColor,UIColor *titleSelectedColor,UIFont *titleFont,NSString *titleStr);
#pragma mark ==============> UIImageView
//设置常见ImageView
UIImageView *insertAutoImage(id superView, UIImage *image,UIColor *bgColor);
UILabel *insertAutoMutiLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr, NSInteger lineNum,NSLineBreakMode lineBreakMode);
UILabel *insertAutoLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr);
TapImageView *insertAutoTapImage(id superView,UIImage *image,UIColor *bgColor);

#pragma mark ===============>UItextField

UITextField *insertAutoTextField(id superView,NSString*placeholderStr,UIFont *font,NSTextAlignment alignment,UIColor *textColor,UIColor *bgColor);

#pragma mark ===============>UItextView

UITextView *insertAutoTextView(id superView,NSString*placeholderStr,UIFont *font,NSTextAlignment alignment,UIColor *textColor,UIColor *bgColor);

#pragma mark - 创建循环内容显示 -
UILabel *  setContentLabel(id mainView, UIColor * textColor, UIColor * bgColor, UIFont *font,NSTextAlignment align,NSString *contentStr,NSInteger topTag, BOOL isButton, SEL action);

@end


