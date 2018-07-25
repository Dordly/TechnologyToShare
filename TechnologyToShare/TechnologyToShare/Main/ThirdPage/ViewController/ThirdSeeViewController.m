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
@property (nonatomic, strong)UIWebView * webView;
@property (nonatomic, strong)UILabel * titleLabel;
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
    
    //标题
    self.titleLabel = insertAutoLabel(self.view, MainText_Color, Color_clear, Regular_34, NSTextAlignmentCenter, self.titleName);
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(backBt);
        make.left.equalTo(backBt.mas_right).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-45);
    }];
    
    self.webView = [[UIWebView alloc]init];
    self.webView.backgroundColor = Color_white;
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backBt.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
    }];
    if (self.htmlString.length) {
        [self.webView loadHTMLString:self.htmlString baseURL:nil];
    }
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
