//
//  PromtTapTapImageView.m
//  最划算
//
//  Created by 名品导购网MPLife.com on 15/11/19.
//  Copyright © 2015年 wangminqing. All rights reserved.
//

#import "PromtTapImageView.h"

@implementation PromtTapImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *promt1Image=insertImage(self, [UIImage imageNamed:@"PromtLoading.png"], CGRectMake((frame.size.width-30)/2, (frame.size.height-30)/2, 30, 30));
        promt1Image.tag=100;
        
        self.tapImageView=insertTapImage(self, nil, CGRectMake(0, 0, frame.size.width, frame.size.height), [UIColor clearColor]);
    }
    return self;
}
-(void)setSelfFrame:(CGRect)frame{
    self.frame=frame;
    UIImageView *tempPromt1Image=[self viewWithTag:100];
    tempPromt1Image.frame=CGRectMake((frame.size.width-30)/2, (frame.size.height-30)/2, 30, 30);
    self.tapImageView.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
}
@end
