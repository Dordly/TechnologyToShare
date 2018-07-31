//
//  FourthViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong)UIImageView * imageView;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"发现" TitleColor:Color_white];
    
    self.imageView = insertAutoImage(self.view, Img_Name(@"gep"), Color_clear);
    self.imageView.frame = CGRectMake(40, 40, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    
    //允许和用户之间进行交互
    self.imageView.userInteractionEnabled = YES;
    //添加手势
    //1.旋转手势
    UIRotationGestureRecognizer * gestureOne = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(gestureClick:)];
    gestureOne.delegate = self;
    [self.imageView addGestureRecognizer:gestureOne];
    
    //2.捏合手势
    UIPinchGestureRecognizer * gestureTwo = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(gestureTwoClick:)];
    gestureTwo.delegate = self;
    [self.imageView addGestureRecognizer:gestureTwo];
    
    //3.滑动手势
    UISwipeGestureRecognizer * gestureThree1 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureThreeClick:)];
    gestureThree1.direction = UISwipeGestureRecognizerDirectionRight;
    [self.imageView addGestureRecognizer:gestureThree1];
    
    UISwipeGestureRecognizer * gestureThree2 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(gestureThreeClick:)];
    gestureThree2.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.imageView addGestureRecognizer:gestureThree2];
    
    //4.点击手势
    UITapGestureRecognizer * gestureFour = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestureFourClick:)];
    gestureFour.numberOfTapsRequired = 1;//点击次数
    [self.imageView addGestureRecognizer:gestureFour];
    
    //5.长按手势
    UILongPressGestureRecognizer * gestureFif = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(gestureFifClick:)];
    gestureFif.minimumPressDuration = 1;//长按时间
    [self.view addGestureRecognizer:gestureFif];
    
}
#pragma mark - 旋转手势 -
- (void)gestureClick:(UIRotationGestureRecognizer *)sender {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    sender.rotation = 0;//每次旋转完后清0，防止叠加
}
#pragma mark - 捏合手势 -
- (void)gestureTwoClick:(UIPinchGestureRecognizer *)sender {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    sender.scale = 1;
}
#pragma mark - 滑动手势 -
- (void)gestureThreeClick:(UISwipeGestureRecognizer *)sender {
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        self.imageView.center = CGPointMake(SCREEN_WIDTH/2+20, SCREEN_HEIGHT/2);
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        self.imageView.center = CGPointMake(SCREEN_WIDTH/2-20, SCREEN_HEIGHT/2);
    }
}
#pragma mark - 点击手势 -
- (void)gestureFourClick:(UITapGestureRecognizer *)sender {
    //点击放大/缩小图片
    self.imageView.frame = CGRectMake(40, 40, SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
}
#pragma mark - 长按手势 -
- (void)gestureFifClick:(UILongPressGestureRecognizer *)sender {
    //获取长按的位置在屏幕上对应的点
    CGPoint point  = [sender locationInView:self.view];
    self.imageView.center = point;
}
//返回YES表示同时支持识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
    
}
@end
