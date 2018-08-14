//
//  FourthViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FourthViewController.h"
#import <WebKit/WKWebView.h>
#import "DordlyBezierView.h"
@interface FourthViewController ()
@property (nonatomic, strong)WKWebView * webView;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"发现" TitleColor:Color_white];
    
    DordlyBezierView * bezierView = [[DordlyBezierView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    bezierView.backgroundColor = Color_white;
    [self.view addSubview:bezierView];
//    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
//    [self.view addSubview:self.webView];
    
}
//计算字符个数
-  (int)convertToInt:(NSString *)strtemp {
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return (strlength+1)/2;
}
@end
