//
//  UIImage+Color.h
//  JinBeiCat
//
//  Created by 蒋先军 on 2017/2/16.
//  Copyright © 2017年 RSRTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor*)color;
+ (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

@end
