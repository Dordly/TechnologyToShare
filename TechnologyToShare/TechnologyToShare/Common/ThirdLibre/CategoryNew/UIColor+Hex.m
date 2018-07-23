//
//  UIColor+Hex.m
//  JinBeiCat
//
//  Created by 蒋先军 on 2017/2/15.
//  Copyright © 2017年 RSRTech. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *) colorWithHex:(uint) hex
{
    int red, green, blue, alpha;
    blue = hex & 0x000000FF;
    green = ((hex & 0x0000FF00) >> 8);
    red = ((hex & 0x00FF0000) >> 16);
    alpha = ((hex & 0xFF000000) >> 24);
    return [UIColor colorWithRed:red/255.0f
                           green:green/255.0f
                            blue:blue/255.0f
                           alpha:alpha/255.f];
}

@end
