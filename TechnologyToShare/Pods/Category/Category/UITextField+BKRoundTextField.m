//
//  UITextField+BKRoundTextField.m
//  Booking_Client
//
//  Created by Samuel on 16/4/23.
//  Copyright © 2016年 Samuel. All rights reserved.
//

#import "UITextField+BKRoundTextField.h"

@implementation UITextField (BKRoundTextField)

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeholder {
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeholder;
    textField.font = [UIFont systemFontOfSize:13];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.backgroundColor = [UIColor whiteColor];
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.cornerRadius = 5;
    //[householdTF setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    [textField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    return textField;
}


@end
