//
//  FirstAnnouncementViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/27.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FirstAnnouncementViewController.h"

@interface FirstAnnouncementViewController ()

@end

@implementation FirstAnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"公告" TitleColor:Color_white];
    [super setNavigationRightTitleItem:Color_white title:@"已读" Action:@selector(hasReade)];
    
}
- (void)hasReade {
    NSLog(@"已读");
}

@end
