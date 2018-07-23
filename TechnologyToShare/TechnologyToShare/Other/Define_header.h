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

#define Regular_16              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(16.0)]
#define Regular_18              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(18.0)]
#define Regular_20              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(20.0)]//4号文字
#define Regular_22              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(22.0)]
#define Regular_24              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(24.0)]//3号辅助文字
#define Regular_26              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(26.0)]
#define Regular_28              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(28.0)]
#define Regular_30              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(30.0)]//2号正文文字
#define Regular_32              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(32.0)]
#define Regular_34              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(34.0)]//1号标题文字
#define Regular_36              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(36.0)]
#define Regular_38              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(38.0)]
#define Regular_40              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(40.0)]
#define Regular_42              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(42.0)]
#define Regular_44              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(44.0)]
#define Regular_46              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(46.0)]
#define Regular_48              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(48.0)]
#define Regular_50              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(50.0)]
#define Regular_52              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(52.0)]
#define Regular_60              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(60.0)]
#define Regular_72              [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(72.0)]
#define Regular_120             [UIFont fontWithName:@"HelveticaNeue" size:DFONTSIZE(120.0)]
//2号正文文字加粗
#define Medium_28               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(28.0)]
#define Medium_30               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(30.0)]
#define Medium_32               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(32.0)]
#define Medium_40               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(40.0)]
#define Medium_58               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(58.0)]
#define Medium_60               [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(60.0)]
#define Medium_100              [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(100.0)]
#define Medium_120              [UIFont fontWithName:@"HelveticaNeue-Medium" size:DFONTSIZE(120.0)]
#define Avenir_44               [UIFont fontWithName:@"AvenirNext-Regular" size:DFONTSIZE(44.0)]
#define Futura_60               [UIFont fontWithName:@"Futura-CondensedMedium" size:DFONTSIZE(60)]

#endif /* Define_header_h */
