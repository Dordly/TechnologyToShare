//
//  ThirdSeeViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/23.
//  Copyright © 2018年 dordly. All rights reserved.
//

/**MarkDown预览*/
#import "ThirdSeeViewController.h"

@interface ThirdSeeViewController ()
@property (nonatomic, strong)UITextField * titleTF;//标题
@property (nonatomic, strong)UITextView * contentTV;//内容

@end
@implementation ThirdSeeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * backBt = insertAutoButton(self.view, Img_Name(@"back"), Img_Name(@"back"), Color_clear, nil, nil, nil, nil, UIControlContentHorizontalAlignmentCenter);
    [backBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(NAVIGATION_HEIGHT-34);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.width.height.offset(25);
    }];
    [backBt addTarget:self action:@selector(jumpBack) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}
- (void)jumpBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
