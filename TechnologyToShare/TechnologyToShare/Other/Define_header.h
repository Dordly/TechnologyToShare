//
//  Define_header.h
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#ifndef Define_header_h
#define Define_header_h

//基础宏定义
#define Frame(X,Y,W,H)          CGRectMake(X, Y, W, H)
#define DFONTSIZE(F)            F*CGRectGetWidth([UIScreen mainScreen].bounds)/750.0
#define DLEFTMARGIN(X)          X*CGRectGetWidth([UIScreen mainScreen].bounds)/750.0
#define DTOPMARGIN(Y)           Y*CGRectGetHeight([UIScreen mainScreen].bounds)/1334.0
#define DWIDTH(W)               W*CGRectGetWidth([UIScreen mainScreen].bounds)/750.0
#define DHEIGHT(H)              H*CGRectGetHeight([UIScreen mainScreen].bounds)/1334.0
#define SCREEN_WIDTH            CGRectGetWidth([UIScreen mainScreen].bounds)
#define SCREEN_HEIGHT           CGRectGetHeight([UIScreen mainScreen].bounds)
#define NAVIGATION_HEIGHT       ([[ValidateString deviceVersion] isEqualToString:@"iPhone X"]?88:64)
//#define NAVIGATION_HEIGHT       (self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height)
#define TABBAR_HEIGHT           self.tabBarController.tabBar.frame.size.height
#define NAVIGATIONBAR_COLOR     [UIColor colorWithRed:58.0/255.0 green:72.0/255.0 blue:101.0/255.0 alpha:1.0]
#define iOS10Later              ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)
#define IOS6 [[[UIDevice currentDevice] systemVersion]floatValue]<=6
#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7
#define IOS8_1  [[[UIDevice currentDevice] systemVersion]floatValue]<=8
#define IOS8  [[[UIDevice currentDevice] systemVersion]floatValue]>=8
#define IOS9_1  [[[UIDevice currentDevice] systemVersion]floatValue]<9
#define IOS9  [[[UIDevice currentDevice] systemVersion]floatValue]>=9

/**Img*/
#define Img_Name(n) [UIImage imageNamed:n]

#define bScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define bScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])

#define bRGB(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define bNAVIGATION_HEIGHT   (([[[UIDevice currentDevice] systemVersion]floatValue]>=7)?64:44)

#define bIOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7
#define bIOS8  [[[UIDevice currentDevice] systemVersion]floatValue]>=8

#endif /* Define_header_h */
