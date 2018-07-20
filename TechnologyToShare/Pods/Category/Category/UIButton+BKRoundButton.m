//
//  UIButton+BKRoundButton.m
//  Booking_Client
//
//  Created by Samuel on 16/4/21.
//  Copyright © 2016年 Samuel. All rights reserved.
//

#import "UIButton+BKRoundButton.h"

@implementation UIButton (BKRoundButton)

+ (UIButton *)buttonWithTitle:(NSString *)title withTarget:(id)target withAction:(SEL)action cornerRadius:(CGFloat)cornerRadius {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 1;
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTintColor:[UIColor grayColor]];
    return button;
}

@end
