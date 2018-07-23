//
//  ThirdViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createMainView];
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
- (void)createMainView {
    UIButton * closeBt = insertAutoButton(self.view, Img_Name(@"close"), Img_Name(@"close"), Color_clear, nil, nil, nil, nil, UIControlContentHorizontalAlignmentCenter);
    [closeBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(NAVIGATION_HEIGHT-34);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.height.width.offset(25);
    }];
    [closeBt addTarget:self action:@selector(closePage:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * lineView = insertAutoView(self.view, Line_Color);
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(closeBt.mas_bottom).offset(20);
        make.height.mas_offset(1);
    }];
}
- (void)closePage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
