//
//  BaseViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIViewController attemptRotationToDeviceOrientation];
    self.view.backgroundColor = Color_white;
    if (bIOS7) {
        //iOS7默认开启了全视图布局，视图会填充满整个屏幕，默认是开启的即UIRectEdgeAll。
        //该参数的类型是UIRectEdge的枚举类型，定义了视图的扩展方向。
        self.edgesForExtendedLayout= UIRectEdgeNone;
        //如果你使用了不透明的操作栏，设置edgesForExtendedLayout的时候也请将
        //extendedLayoutIncludesOpaqueBars的值设置为No（默认值是YES）。
        self.extendedLayoutIncludesOpaqueBars = NO;
        //指定一个视图控制器是否出现非全屏，接管的状态栏从外观上呈现的视图控制器控制。默认值YES）
        self.modalPresentationCapturesStatusBarAppearance = NO;
        //如果你不想让scroll view的内容自动调整，将这个属性设为NO（默认值YES）。
        //self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    //    [self.navigationController.navigationBar setBackgroundColor:nil];
    //    [self.navigationController.navigationBar setBarTintColor:Color_white];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = Color_white;
    
}

- (void)setViewControllerBackgroud:(UIColor *)color{
    [self.view setBackgroundColor:color];
}
- (void)setImageButtonForRightNaviagtion:(NSString *)image Action:(SEL)action{
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    btnRight.frame = CGRectMake(0, 0, 20, 20);
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
}
- (void)setImageButtonForNavigation:(NSArray *)images{
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setBackgroundImage:[UIImage imageNamed:[Static nullToString:[images firstObject]]] forState:UIControlStateNormal];
    
    btnLeft.frame = CGRectMake(0, 0, 20, 20);
    [btnLeft addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    btnLeft.tag = 101;
    UIBarButtonItem *navigationLeftItem = [[UIBarButtonItem alloc]initWithCustomView:btnLeft];
    self.navigationItem.leftBarButtonItem = navigationLeftItem;
    
    if ([[Static nullToString:[images lastObject]] length] <  1) {
        return;
    }
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setBackgroundImage:[UIImage imageNamed:[Static nullToString:[images lastObject]]] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    btnRight.frame = CGRectMake(0, 0, 24, 20);
    btnRight.tag = 102;
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
    
}


- (void)setWapNavigationBar{
    
    UIButton *leftBtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn1.frame=CGRectMake(0, 0, 48, 20);
    leftBtn1.tag=101;
    leftBtn1.backgroundColor=Color_clear;
    [leftBtn1 addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    insertImage(leftBtn1, [UIImage imageNamed:@"back_1"], CGRectMake(-10, 0, 22, 20));
    insertLabel(leftBtn1, Color_white, Color_clear, [UIFont systemFontOfSize:16], NSTextAlignmentLeft, @"返回", CGRectMake(15, 0, 33, 20));
    UIBarButtonItem *navigationLeft1Item = [[UIBarButtonItem alloc]initWithCustomView:leftBtn1];
    
    UIButton *leftBtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn2.frame=CGRectMake(0, 0, 33, 20);
    leftBtn2.tag=105;
    leftBtn2.backgroundColor=Color_clear;
    [leftBtn2 addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn2 setTitle:@"关闭" forState:UIControlStateNormal];
    leftBtn2.titleLabel.font=[UIFont systemFontOfSize:16];
    UIBarButtonItem *navigationLeft2Item = [[UIBarButtonItem alloc]initWithCustomView:leftBtn2];
    self.navigationItem.leftBarButtonItems=[NSArray arrayWithObjects:navigationLeft1Item,navigationLeft2Item, nil];
    
    
    
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.tag=102;
    rightBtn.frame=CGRectMake(0, 0, 60, 20);
    rightBtn.backgroundColor=Color_clear;
    [rightBtn addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:@"分享" forState:UIControlStateNormal];
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
    
}


-(void)setNavigationLeftAndRightbarFrame:(CGRect)leftFrame RightBarFrame:(CGRect)rightFrame LeftAndRightImages:(NSArray *)images{
    
    
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnLeft setBackgroundImage:[UIImage imageNamed:[Static nullToString:[images firstObject]]] forState:UIControlStateNormal];
    btnLeft.frame = leftFrame;
    [btnLeft addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    btnLeft.tag = 101;
    UIBarButtonItem *navigationLeftItem = [[UIBarButtonItem alloc]initWithCustomView:btnLeft];
    self.navigationItem.leftBarButtonItem = navigationLeftItem;
    
    
    if ([[Static nullToString:[images lastObject]] length] <  1) {
        return;
    }
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setBackgroundImage:[UIImage imageNamed:[Static nullToString:[images lastObject]]] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(OnclickNavigationButton:) forControlEvents:UIControlEventTouchUpInside];
    btnRight.frame = rightFrame;
    btnRight.tag = 102;
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
    
    
}
- (void)setNavigationBarColor:(UIColor *)color{
    [self setNavigationBarColor:color title:nil TitleColor:nil TitleFont:nil];
}

- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title{
    [self setNavigationBarColor:color title:title TitleColor:nil TitleFont:nil];
}



-(void)setNavigationRightTitleItem:(UIColor *)color title:(NSString*)title  Action:(SEL)action{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor=[UIColor clearColor];
    [rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitle:title forState:UIControlStateSelected];
    rightBtn.frame=CGRectMake(0, 0, title.length*18, 20);
    [rightBtn setTitleColor:color forState:UIControlStateSelected];
    [rightBtn setTitleColor:color forState:UIControlStateNormal];
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:16 weight:0.2];
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
}
-(void)setNavigationLeftTitleItem:(UIColor *)color Img:(UIImage *)img Action:(SEL)action WithIsJump:(BOOL)jump{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    
    leftBtn.backgroundColor=Color_clear;
    if (jump == YES){
        [leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }else{
        [leftBtn addTarget:self action:@selector(leftClickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [leftBtn setImage:img forState:UIControlStateNormal];
    //    [leftBtn setTitle:title forState:UIControlStateNormal];
    //    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    //    leftBtn.titleLabel.font=[UIFont systemFontOfSize:18 weight:0.2];
    UIBarButtonItem *navigationleftItem = [[UIBarButtonItem alloc]initWithCustomView: leftBtn];
    self.navigationItem.leftBarButtonItem = navigationleftItem;
    
}
-(void)setLeftItem:(UIColor *)color title:(NSString*)title Img:(UIImage *)img Action:(SEL)action WithIsJump:(BOOL)jump{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (title!=nil){
        leftBtn.frame = CGRectMake(0, 0, 60, 15);
    }else{
        leftBtn.frame = CGRectMake(0, 0, 20, 20);
    }
    leftBtn.backgroundColor=Color_clear;
    if (jump!=YES){
        [leftBtn addTarget:self action:@selector(leftClickButton) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    [leftBtn setImage:img forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitleColor:color forState:UIControlStateNormal];
    leftBtn.titleLabel.font=Medium_32;
    UIBarButtonItem *navigationleftItem = [[UIBarButtonItem alloc]initWithCustomView: leftBtn];
    self.navigationItem.leftBarButtonItem = navigationleftItem;
    
}
- (void)leftClickButton{
    [self.navigationController popViewControllerAnimated:YES];
}
//设置上导航栏右边ButtonItem以Icon的形式展示
-(void)setNavigationRightIconItem:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor=Color_clear;
    [rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:image forState:UIControlStateNormal];
    [rightBtn setImage:image forState:UIControlStateHighlighted];
    rightBtn.frame=frame;
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
    
}
-(void)setNavigationRightIconnotSelectItem:(UIImage *)image  Action:(SEL)action WithTitle:(NSString *)title{
    UIView * mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    mainView.backgroundColor = Color_clear;
    
    UILabel * mainLabel = insertAutoLabel(mainView, Color_white, Color_clear, [UIFont systemFontOfSize:18], NSTextAlignmentLeft, title);
    UIImageView * mainImg = insertAutoImage(mainView,image, Color_clear);
    
    [mainImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(mainView.mas_centerY).offset(0);
        make.right.equalTo(mainView.mas_right).offset(0);
        make.width.height.mas_offset(20);
    }];
    [mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(mainView.mas_centerY).offset(0);
        make.left.equalTo(mainView.mas_left).offset(0);
        make.right.equalTo(mainImg.mas_left).offset(-2);
    }];
    UIButton * mainButton = insertAutoButton(mainView, nil, nil, Color_clear, nil, nil, nil, nil,UIControlContentHorizontalAlignmentCenter);
    [mainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mainView.mas_left).offset(0);
        make.right.equalTo(mainView.mas_right).offset(0);
        make.top.equalTo(mainView.mas_top).offset(0);
        make.bottom.equalTo(mainView.mas_bottom).offset(0);
    }];
    [mainButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:mainView];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
    
}
/**设置搜索导航栏*/
//- (void)setNavigationBarWithSearchTextFieldWithplaceHodel:(NSString *)text Action:(SEL)action{
//    UIView * centerView = insertAutoView(self.navigationController.navigationBar, Color_white);
//    centerView.frame = CGRectMake(50, 0, SCREEN_WIDTH-60, 40);
//    centerView.layer.masksToBounds = YES;
//    centerView.layer.cornerRadius = 5;
//    UITextField * editTextField = insertAutoTextField(centerView, text, Regular_30, NSTextAlignmentLeft, MainText_Color, Color_white);
//    editTextField.frame = CGRectMake(10, 0, centerView.frame.size.width, centerView.frame.size.height);
////    editTextField.keyboardType = UIReturnKeySearch;
//    editTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
//    editTextField.tintColor= [UIColor blueColor];
//    editTextField.returnKeyType = UIReturnKeySearch;
//    [editTextField becomeFirstResponder];
//    [editTextField addTarget:self action:action forControlEvents:UIControlEventEditingChanged];
//
//    if (bIOS7) {
//        self.navigationController.navigationBar.barTintColor = Nav_Color;
//    }else{
//        self.navigationController.navigationBar.tintColor = Nav_Color;
//    }
//}
//设置上导航栏右边ButtonItem以View的形式展示
-(void)setNavigationRightView:(UIColor *)color Image:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action{
    UIView * iconView = [[UIView alloc]initWithFrame:frame];
    iconView.backgroundColor = Color_clear;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(iconView.frame.size.width-2, 0, 6, 6)];
    view.backgroundColor = color;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 3;
    [iconView addSubview:view];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor=Color_clear;
    [rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setImage:image forState:UIControlStateNormal];
    [rightBtn setImage:image forState:UIControlStateHighlighted];
    rightBtn.frame=CGRectMake(0, 2, iconView.frame.size.width-2, iconView.frame.size.height-2);
    [iconView addSubview:rightBtn];
    UIBarButtonItem *navigationRightItem = [[UIBarButtonItem alloc]initWithCustomView:iconView];
    self.navigationItem.rightBarButtonItem = navigationRightItem;
}
//设置上导航栏左边ButtonItem以View的形式展示
-(void)setNavigationLeftView:(UIColor *)color Image:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action{
    UIView * iconView = [[UIView alloc]initWithFrame:frame];
    iconView.backgroundColor = Color_clear;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(iconView.frame.size.width-2, 0, 6, 6)];
    view.backgroundColor = color;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 3;
    [iconView addSubview:view];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor=Color_clear;
    [leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn setImage:image forState:UIControlStateHighlighted];
    leftBtn.frame=CGRectMake(0, 2, iconView.frame.size.width-2, iconView.frame.size.height-2);
    [iconView addSubview:leftBtn];
    UIBarButtonItem *navigationleftItem = [[UIBarButtonItem alloc]initWithCustomView:iconView];
    self.navigationItem.leftBarButtonItem = navigationleftItem;
}
//设置上导航栏右边ButtonItem以视图形式展示
-(void)setNavigationRightIconView:(UIImage *)image Action:(SEL)action{
    UIView * rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    rightView.backgroundColor = Color_clear;
    
    UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
    rightButton.backgroundColor = Color_clear;
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:image forState:UIControlStateHighlighted];
    [rightView addSubview:rightButton];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
//设置上导航栏左边ButtonItem以Icon的形式展示
-(void)setNavigationLeftIconItem:(UIImage *)image Frame:(CGRect)frame Action:(SEL)action{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.backgroundColor=Color_clear;
    [leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn setImage:image forState:UIControlStateHighlighted];
    leftBtn.frame=frame;
    UIBarButtonItem *navigationLeftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = navigationLeftItem;
}
-(void)setNavigationbarTitleAndTitleColor:(UIColor *)color title:(NSString *)title{
    
    [self setNavigationBarColor:nil title:title TitleColor:color TitleFont:nil];
}
- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title TitleColor:(UIColor *)titleColor{
    [self setNavigationBarColor:color title:title TitleColor:titleColor TitleFont:nil];
}

- (void)setNavigationBarColor:(UIColor *)color title:(NSString *)title TitleColor:(UIColor *)titleColor TitleFont:(UIFont *)titleFont{
    
    
    if (color == Color_white){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    }else{
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    }
    if ([color isKindOfClass:[UIColor class]]) {
        if (bIOS7) {
            self.navigationController.navigationBar.barTintColor = color;
        }else{
            self.navigationController.navigationBar.tintColor = color;
        }
    }
    self.navigationItem.title = [Static nullToString:title];
    
    if ([titleColor isKindOfClass:[UIColor class]]) {[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];}
    
    if ([titleFont isKindOfClass:[UIFont class]]) {[self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];}
}

- (void)pushController:(UIViewController *)view{
    [self.navigationController pushViewController:view animated:YES];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)pushCustomAutoController:(UIViewController *)view{
    
    [self.navigationController pushViewController:view animated:NO];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}
- (void)OnclickNavigationButton:(UIButton *)sender{
    if (sender.tag == 101) {
        [self.navigationController popViewControllerAnimated:YES];
        //        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        
    }
}
-(void)leftClickBack:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

/**设置导航栏右边ButtonItem以View的形式展示*/
-(void)setNewNavRightView:(UIColor *)color Image:(UIImage *)image TitleNum:(NSString *)titleNum TitleBgColor:(UIColor *)bgColor Action:(SEL)action
{
    
    UIView * rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    rightView.backgroundColor = color;
    
    UIButton * rightButton = [[UIButton alloc]init];
    rightButton.backgroundColor = Color_clear;
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:image forState:UIControlStateHighlighted];
    [rightView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightView.mas_top).offset(5);
        if (titleNum.integerValue > 99){
            make.right.equalTo(rightView.mas_right).offset(-5);
        }else{
            make.right.equalTo(rightView.mas_right).offset(0);
        }
        make.width.mas_offset(30);
        make.height.mas_offset(30);
    }];
    
    [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    NSString * num = titleNum;
    if (titleNum.integerValue > 99){
        titleNum = @"99+";
    }
    UILabel * rightLabel = insertAutoLabel(rightView, Color_white, Color_white, Regular_24, NSTextAlignmentCenter, titleNum);
    
    rightLabel.layer.masksToBounds = YES;
    rightLabel.layer.cornerRadius = 9;
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightView.mas_top).offset(0);
        make.right.equalTo(rightView.mas_right).offset(0);
        if (![num isEqualToString:@"0"]){
            make.height.mas_offset(18);
            if (num.integerValue >= 99){
                make.width.mas_offset(35);
            }else{
                make.width.mas_offset(20);
            }
            
        }else{
            make.height.mas_offset(0);
            make.width.mas_offset(0);
        }
    }];
    UIButton * mainButton = insertAutoButton(rightView, nil, nil, Color_clear, nil, nil, nil, nil,UIControlContentHorizontalAlignmentCenter);
    [mainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightView.mas_top).offset(0);
        make.right.equalTo(rightView.mas_right).offset(0);
        make.left.equalTo(rightView.mas_left).offset(0);
        make.bottom.equalTo(rightView.mas_bottom).offset(0);
    }];
    [mainButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightItem;
}
@end
