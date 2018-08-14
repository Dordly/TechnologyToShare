//
//  DordlyBezierView.m
//  TechnologyToShare
//
//  Created by dordly on 2018/8/14.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "DordlyBezierView.h"

@implementation DordlyBezierView

- (void)drawRect:(CGRect)rect
{
    //1、创建一个矩形贝塞尔曲线
    UIBezierPath * bezier_path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 20, 100, 100)];
    [bezier_path moveToPoint:CGPointMake(60, 60)];
    [bezier_path addLineToPoint:CGPointMake(80, 80)];
    [bezier_path addLineToPoint:CGPointMake(60, 90)];
    /** 设置端点类型
     kCGLineCapButt,
     kCGLineCapRound,
     kCGLineCapSquare
     */
    bezier_path.lineCapStyle = kCGLineCapButt;
    /** 设置线条连接类型
     kCGLineJoinMiter,
     kCGLineJoinRound,
     kCGLineJoinBevel
     */
    bezier_path.lineJoinStyle = kCGLineJoinMiter;
    
    bezier_path.miterLimit = 1;
    CGFloat path[] = {20,1};
    [bezier_path setLineDash:path count:2 phase:0];
    bezier_path.lineWidth = 5;//线条宽度
    
    //2、创建一个圆形贝塞尔曲线
    UIBezierPath * bezier_oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 20, 150, 100)];
    bezier_oval.lineWidth = 5;
    
    //3、创建一个圆角贝塞尔曲线
    UIBezierPath * bezier_rounds = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 160, 100, 100) cornerRadius:20];
    bezier_rounds.lineWidth = 5;
    
    //4、创建一个可选择圆角方位的贝塞尔曲线,自定义个别角为圆角（topLeft & bottomRight），圆角度为：20
    UIBezierPath * bezier_roundedCorner = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 160, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
    bezier_roundedCorner.lineWidth = 5;
    
    //5、创建一个圆弧曲线ArcCenter 圆弧长度，radius 圆角度，startAngle 起始点，endAngle 结束点 ，clockwise 是否闭合
    UIBezierPath * bezier_arcCenter = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 400) radius:50 startAngle:M_PI/2*3 endAngle:M_PI/3 clockwise:YES];
    bezier_arcCenter.lineWidth = 5;
    
    //6、添加二次/三次贝塞尔曲线
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 5;
    [bezierPath moveToPoint:CGPointMake(10, 510)];
    [bezierPath addLineToPoint:CGPointMake(50, 510)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 510) controlPoint:CGPointMake(50, 600)];
    [bezierPath addCurveToPoint:CGPointMake(200, 530) controlPoint1:CGPointMake(130, 600) controlPoint2:CGPointMake(170 ,400)];
    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    [bezierPath moveToPoint:CGPointMake(20, 530)];
//    [bezierPath addLineToPoint:CGPointMake(40, 530)];
    
    //根据CGPathRef绘制贝塞尔曲线
    CGMutablePathRef paths = CGPathCreateMutable();
    CGPathMoveToPoint(paths, NULL, 10, 640);
    CGPathAddCurveToPoint(paths, NULL, 100, 700, 250, 550, 350, 650);
    UIBezierPath *bezierPath_CGPath = [UIBezierPath bezierPathWithCGPath:paths];
    bezierPath_CGPath.lineWidth = 6;
    //选择填充颜色
    [[UIColor redColor] set];
    [bezier_path fill];
    [bezier_oval fill];
    [bezier_rounds fill];
    [bezier_roundedCorner fill];
    //[bezierPath_ArcCenter fill];
    //[bezierPath_CGPath fill];
    
    //选择线条颜色
    [[UIColor blackColor] set];
    [bezier_path stroke];
    [bezier_oval stroke];
    [bezier_rounds stroke];
    [bezier_roundedCorner stroke];
    [bezier_arcCenter stroke];
    [bezierPath stroke];
    [bezierPath_CGPath stroke];
    //
    CALayer* aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 510);
    aniLayer.bounds = CGRectMake(10, 0, 10, 10);
    aniLayer.cornerRadius = 5;
    [self.layer addSublayer:aniLayer];
    //
    CAKeyframeAnimation* keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = NSIntegerMax;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 15;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;
    [aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];
}

@end
