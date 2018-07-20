//
//  UtilView.h
//  最划算
//
//  Created by wangminqing on 15-2-2.
//  Copyright (c) 2015年 wangminqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TapImageView.h"
#import "PromtTapImageView.h"

@interface UtilView : NSObject

#pragma mark ============>UIView
//设置常见View
UIView *insertView(id view, UIColor *color,CGRect rect);

UIView * insertContentView(id mainView, CGFloat w, NSString * title,NSString * personNum,NSInteger tag, BOOL isLast, CGFloat h);

#pragma mark =============>UIButton
//设置标题Button
UIButton *insertTitleButton(id superView, UIColor *textColor, CGRect rect, id target,SEL action, NSInteger tag, NSString *text,UIFont *font,UIColor *h_Color);
//设置ImageButton
UIButton *insertImageButton(id superView, UIColor *textColor, CGRect rect, id target,SEL action, UIImage *image_n,UIImage *image_h,NSInteger tag, NSString *text,UIFont *font,UIColor *h_Color);

#pragma mark ==============> UIImageView
//设置常见ImageView
UIImageView *insertImage(id superView, UIImage *image, CGRect rect);

UILabel *insertMutiLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr, NSInteger lineNum,NSLineBreakMode lineBreakMode ,CGRect rect);

UILabel *insertLabel(id superView,UIColor *textColor,UIColor *bgColor,UIFont *font,NSTextAlignment align,NSString *contentStr,CGRect rect);


TapImageView *insertTapImage(id superView,UIImage *image, CGRect rect,UIColor *bgColor);

PromtTapImageView *insertPromtTapImage(id superView,UIImage *image, CGRect rect,UIColor *bgColor);
@end
