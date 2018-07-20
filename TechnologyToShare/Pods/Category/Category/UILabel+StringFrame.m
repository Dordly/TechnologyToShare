//
//  UILabel+StringFrame.m
//  Booking_Client
//
//  Created by QY_Samuel on 16/6/24.
//  Copyright © 2016年 Samuel. All rights reserved.
//

#import "UILabel+StringFrame.h"

@implementation UILabel (StringFrame)

- (CGSize)boundingRectWithSize:(CGSize)size {
    NSDictionary *attribute = @{NSFontAttributeName : self.font};
    CGSize retSize = [self.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return retSize;
}

@end
