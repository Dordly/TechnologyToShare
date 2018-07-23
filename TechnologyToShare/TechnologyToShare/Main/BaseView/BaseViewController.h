//
//  BaseViewController.h
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//设置ViewController背景色
- (void)setViewControllerBackgroud:(UIColor *)color;
//设置上导航栏左、右两个ButtonItem以icon的形式展示
//images count = 2 left and right
- (void)setImageButtonForNavigation:(NSArray *)images;
- (void)setImageButtonForRightNaviagtion:(NSString *)image Action:(SEL)action;
//设置单色导航栏
- (void)setNavigationBarColor:(UIColor *)color;
//设置单色导航栏、默认字体颜色、字体大小的标题
- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title;
//设置单色导航栏,默认字体颜色、自定义字体大小的标题
-(void)setNavigationbarTitleAndTitleColor:(UIColor *)color title:(NSString *)title;
/**设置搜索导航栏*/
//- (void)setNavigationBarWithSearchTextFieldWithplaceHodel:(NSString *)text Action:(SEL)action;
//设置导航栏标题颜色以及标题文字信息
//设置上导航栏右边ButtonItem以Title的形式展示
-(void)setNavigationRightTitleItem:(UIColor *)color title:(NSString*)title  Action:(SEL)action;
//设置上导航栏左边buttonItem以Title
-(void)setNavigationLeftTitleItem:(UIColor *)color Img:(UIImage *)img Action:(SEL)action WithIsJump:(BOOL)jump;
//设置上导航栏右边ButtonItem以Icon的形式展示
-(void)setNavigationRightIconItem:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action;
//设置上导航栏左边ButtonItem以Icon的形式展示
-(void)setNavigationLeftIconItem:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action;
/**设置上导航栏右边ButtonItem以视图形式展示*/
-(void)setNavigationRightIconView:(UIImage *)image Action:(SEL)action;
//设置上导航栏右边ButtonItem以View的形式展示
-(void)setNavigationRightView:(UIColor *)color Image:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action;
//设置上导航栏左边ButtonItem以View的形式展示
-(void)setNavigationLeftView:(UIColor *)color Image:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action;
- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title TitleColor:(UIColor *)titleColor;
//设置单色导航栏,自定义字体颜色、自定义字体大小的标题
- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)titleFont;
//导航栏点击事件
- (void)OnclickNavigationButton:(UIButton *)sender;
//push页面，启动手势滑动返回
- (void)pushController:(UIViewController *)view;
//push页面，启动手势滑动返回(自定义动画)
- (void)pushCustomAutoController:(UIViewController *)view;
-(void)setNavigationLeftAndRightbarFrame:(CGRect)leftFrame RightBarFrame:(CGRect)rightFrame LeftAndRightImages:(NSArray *)images;
- (void)setWapNavigationBar;
/**设置导航栏右边ButtonItem以View的形式展示*/
-(void)setNewNavRightView:(UIColor *)color Image:(UIImage *)image TitleNum:(NSString *)titleNum TitleBgColor:(UIColor *)bgColor Action:(SEL)action;
-(void)setLeftItem:(UIColor *)color title:(NSString*)title Img:(UIImage *)img Action:(SEL)action WithIsJump:(BOOL)jump;
-(void)setNavigationRightIconnotSelectItem:(UIImage *)image Action:(SEL)action WithTitle:(NSString *)title;

@end
