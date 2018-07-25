//
//  ThirdViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdSeeViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface ThirdViewController ()<UIAlertViewDelegate>

@property (nonatomic, strong)UITextField * titleTF;//标题
@property (nonatomic, strong)UITextView * contentTV;//内容
@property (nonatomic, strong)UIToolbar * toolBar;//底部内容展示
@property (nonatomic, strong)JSContext *jsContext;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jsContext = [[JSContext alloc]init];
    [self createMainView];
    [self initialize];
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
    [self.view endEditing:YES];
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
        seeVC.htmlString = [self htmlString];
        seeVC.titleName = self.titleTF.text;
        seeVC.hidesBottomBarWhenPushed = YES;
        [self presentViewController:seeVC animated:YES completion:nil];
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //标题不能为空
    if (!self.titleTF.text.length) {
        [self showMessage:@"请先填写文章标题"];
        return;
    }
    if (buttonIndex == 0){
        //发布
    }else{
        //保存
        NSData *data = [self.contentTV.text dataUsingEncoding:NSUTF8StringEncoding];
        NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *filePath = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.md", self.titleTF.text]];
        //写入文件
        [data writeToFile:filePath atomically:YES];
        NSLog(@"md成功保存，地址%@", filePath);
        [self showMessage:@"保存成功"];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)showMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)initialize
{
//    self.contentTV.inputAccessoryView = self.toolBar;
    self.contentTV.textContainerInset = UIEdgeInsetsMake(10, 5, 10, 5);
    //错误回调
    [self.jsContext setExceptionHandler:^(JSContext *context, JSValue *exception){
        NSLog(@"%@", exception.toString);
    }];
    
    //markdown -> html  js参考 https://github.com/showdownjs/showdown
    static NSString *js;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        js = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"showdown" ofType:@"js"] encoding:NSUTF8StringEncoding error:nil];
    });
    //加载js
    [self.jsContext evaluateScript:js];
    
    //注入function  markdown -> html，使用时，可以通过 convert('xxx'); 调用
    NSString *jsFunction = @"\
    function convert(md) { \
    return (new showdown.Converter()).makeHtml(md);\
    }";
    [self.jsContext evaluateScript:jsFunction];
}

- (NSString *)htmlString
{
    //markdown -> html
    JSValue *jsFunctionValue = self.jsContext[@"convert"];
    JSValue *htmlValue = [jsFunctionValue callWithArguments:@[self.contentTV.text]];
    //加载css样式
    static NSString *css;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        css = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"markdown" ofType:@"css"] encoding:NSUTF8StringEncoding error:nil];
    });
    return [NSString stringWithFormat:@"\
            <html>\
            <head>\
            <title>%@</title>\
            <style>%@</style>\
            </head>\
            <body>\
            %@\
            </body>\
            </html>\
            ", self.titleTF.text, css, htmlValue.toString];
}
@end
