//
//  UIButton+BKRoundButton.h
//  Booking_Client
//
//  Created by Samuel on 16/4/21.
//  Copyright © 2016年 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BKRoundButton)

+ (UIButton *)buttonWithTitle:(NSString *)title withTarget:(id)target withAction:(SEL)action cornerRadius:(CGFloat)cornerRadius;

@end
