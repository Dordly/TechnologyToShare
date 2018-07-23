//
//  BaseTabBarViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "FirstViewController.h"//首页
#import "SecondViewController.h"//关注
#import "ThirdViewController.h"//添加&发表
#import "FourthViewController.h"//发现
#import "FifthViewController.h"//个人中心
#import "BaseTabBar.h"
@interface BaseTabBarViewController ()<BaseTabBarDelegate,UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 利用KVO来使用自定义的tabBar
    BaseTabBar * tabBar = [[BaseTabBar alloc] init];
    tabBar.myTabBarDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    self.delegate = self;
    [self addAllChildViewController];
    
}
- (void)addAllChildViewController {
    
    FirstViewController * fistVC = [[FirstViewController alloc]init];
    [self addChildViewController:fistVC title:@"首页" imageNamed:@"first_a" SelectImageNamed:@"first_n"];
    
    SecondViewController * secondVC = [[SecondViewController alloc]init];
    [self addChildViewController:secondVC title:@"关注" imageNamed:@"second_a" SelectImageNamed:@"second_n"];
    
    
    FourthViewController * fourthVC = [[FourthViewController alloc]init];
    [self addChildViewController:fourthVC title:@"发现" imageNamed:@"fourth_a" SelectImageNamed:@"fourth_n"];
    
    
    FifthViewController * fifthVC = [[FifthViewController alloc]init];
    [self addChildViewController:fifthVC title:@"我的" imageNamed:@"fifth_a" SelectImageNamed:@"fifth_n"];
    
}
// 添加某个 childViewController
- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title imageNamed:(NSString *)imageNamed SelectImageNamed:(NSString *)selectImage
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageNamed];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    [self addChildViewController:nav];
}
- (void)changeLineOfTabbarColor {
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 0.5);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, Color_white.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setShadowImage:image];
    [self.tabBar setBackgroundImage:[UIImage new]];
}
- (void)addButtonClick:(BaseTabBar *)tabBar
{
    
    ThirdViewController * thirdVC = [[ThirdViewController alloc]init];
    [self presentViewController:thirdVC animated:YES completion:nil];
}@end
