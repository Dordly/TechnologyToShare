//
//  BaseTabBar.h
//  WhewElectricity
//
//  Created by dordly on 2018/5/30.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  BaseTabBar;
@protocol BaseTabBarDelegate <NSObject>
-(void)addButtonClick:(BaseTabBar *)tabBar;
@end
@interface BaseTabBar : UITabBar
//指向MyTabBar的代理
@property (nonatomic,weak) id<BaseTabBarDelegate> myTabBarDelegate;
@end
