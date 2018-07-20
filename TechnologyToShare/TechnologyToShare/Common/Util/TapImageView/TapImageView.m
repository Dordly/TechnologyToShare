//
//  TapImageView.m
//  SHToday_Effective_Cost
//
//  Created by wangminqing on 13-4-27.
//  Copyright (c) 2013年 wangminqing. All rights reserved.
//

#import "TapImageView.h"

@implementation TapImageView
@synthesize delegate;
@synthesize thumbnailUrl;
@synthesize middleImageUrl;
@synthesize tapRow;
@synthesize imgPosition;
@synthesize imgType;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //self.userInteractionEnabled = YES;
        self.thumbnailUrl = nil;
        self.middleImageUrl = nil;
        
        
        
        
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.delegate touchTapImageView:self
                                Ended:touches withEvent:event];
   
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
