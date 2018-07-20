//
//  BaseTabBar.m
//  WhewElectricity
//
//  Created by dordly on 2018/5/30.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "BaseTabBar.h"
@interface BaseTabBar()
//指向中间“+”按钮
@property (nonatomic, strong) UIButton * centerBtn;

@end

@implementation BaseTabBar
#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置tabBarItem选中状态时的颜色
        self.tintColor = Main_Color;
        self.backgroundColor = Color_white;
        // 添加中间按钮到tabBar上
        self.centerBtn = insertAutoButton(self, Img_Name(@"third_a"), Img_Name(@"third_a"), Color_clear, nil, nil, nil, nil, UIControlContentHorizontalAlignmentCenter);
        self.centerBtn.frame = CGRectMake(0, 0, 60, 60);
        
        [self.centerBtn addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.centerBtn];
    }
    
    return self;
}

// 重新布局tabBarItem（这里需要具体情况具体分析，本例是中间有个按钮，两边平均分配按钮）
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 把tabBarButton取出来（把tabBar的SubViews打印出来就明白了）
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat centerBtnWidth = CGRectGetWidth(self.centerBtn.frame);
    CGFloat centerBtnHeight = CGRectGetHeight(self.centerBtn.frame);
    // 设置中间按钮的位置，居中，凸起一丢丢
    if ([[ValidateString deviceVersion] isEqualToString:@"iPhone X"]){
        self.centerBtn.center = CGPointMake(barWidth / 2, barHeight - centerBtnHeight/2-50);
    }else{
        self.centerBtn.center = CGPointMake(barWidth / 2, barHeight - centerBtnHeight/2-20);
    }
    
    // 重新布局其他tabBarItem
    // 平均分配其他tabBarItem的宽度
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    // 逐个布局tabBarItem，修改UITabBarButton的frame
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            // 重新设置x坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        // 重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    // 把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerBtn];
}

#pragma mark - Actions

- (void)clickCenterBtn:(UIButton *)sender
{
    NSLog(@"click");
    [self.myTabBarDelegate addButtonClick:self];
}

#pragma mark - Getter

//- (UIButton *)centerBtn
//{
//    if (_centerBtn == nil) {
//        self.centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 60)];
//        [self.centerBtn setImage:[UIImage imageNamed:@"nav_center_a"] forState:UIControlStateNormal];
//        [self.centerBtn addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _centerBtn;
//}

#pragma mark - UIViewGeometry

// 重写hitTest方法，让超出tabBar部分也能响应事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
        return nil;
    }
    UIView *result = [super hitTest:point withEvent:event];
    // 如果事件发生在tabbar里面直接返回
    if (result) {
        return result;
    }
    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
    for (UIView *subview in self.subviews) {
        // 把这个坐标从tabbar的坐标系转为subview的坐标系
        CGPoint subPoint = [subview convertPoint:point fromView:self];
        result = [subview hitTest:subPoint withEvent:event];
        // 如果事件发生在subView里就返回
        if (result) {
            return result;
        }
    }
    return nil;
}

@end
