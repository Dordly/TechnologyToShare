//
//  ThirdViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdSeeViewController.h"

@interface ThirdViewController ()<UIAlertViewDelegate>

@property (nonatomic, strong)UITextField * titleTF;//标题
@property (nonatomic, strong)UITextView * contentTV;//内容
@property (nonatomic, strong)UIToolbar * toolBar;//底部内容展示

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
    
    //发布，预览
    UIButton * oneBt = insertAutoButton(self.view, nil, nil, Color_clear, Main_Color, Main_Color, Medium_32, @"发布", UIControlContentHorizontalAlignmentRight);
    UIButton * twoBt = insertAutoButton(self.view, nil, nil, Color_clear, Main_Color, Main_Color, Medium_32, @"预览", UIControlContentHorizontalAlignmentRight);
    [oneBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(closeBt.mas_centerY);
        make.right.equalTo(self.view.mas_right).offset(-20);
    }];
    [twoBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(closeBt.mas_centerY);
        make.right.equalTo(oneBt.mas_left).offset(-15);
    }];
    oneBt.tag = 1;
    twoBt.tag = 2;
    [oneBt addTarget:self action:@selector(jumpAlert:) forControlEvents:UIControlEventTouchUpInside];
    [twoBt addTarget:self action:@selector(jumpAlert:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView * lineView = insertAutoView(self.view, Line_Color);
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(closeBt.mas_bottom).offset(20);
        make.height.mas_offset(1);
    }];
    
    //标题
    self.titleTF = insertAutoTextField(self.view, @"请输入内容标题", Medium_40, NSTextAlignmentLeft, MainText_Color, Color_clear);
    //分割线
    UIView * contentLineView = insertAutoView(self.view, Line_Color);
    //内容
    self.contentTV = insertAutoTextView(self.view, @"请输入文字内容", Regular_34, NSTextAlignmentLeft, MainText_Color, Color_clear);
    [self.titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.mas_offset(50);
    }];
    [contentLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleTF);
        make.top.equalTo(self.titleTF.mas_bottom).offset(10);
        make.height.mas_offset(1);
    }];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleTF);
        make.top.equalTo(contentLineView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
}
- (void)closePage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)jumpAlert:(UIButton *)sender {
    if (sender.tag == 1){
        //发布
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"是否立即发布？" delegate:self cancelButtonTitle:@"发布" otherButtonTitles:@"保存", nil];
        alertView.delegate = self;
        [alertView show];
        
    }else{
        //预览
        
        ThirdSeeViewController * seeVC = [[ThirdSeeViewController alloc]init];
        seeVC.hidesBottomBarWhenPushed = YES;
        [self presentViewController:seeVC animated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        //发布
    }else{
        //保存
    }
}
@end
