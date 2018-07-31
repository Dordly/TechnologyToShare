//
//  FirstViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewCell.h"
#import "FirstSearchViewController.h"//内容搜索页面
#import "FirstContentViewController.h"//具体内容展示页
#import "FirstContentShowViewController.h"//内容显示页面
#import "FirstAnnouncementViewController.h"//公告页面
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView * topView;
@property (nonatomic, strong)UIView * topLabelView;
@property (nonatomic, strong)UIScrollView * topLabelScrollView;
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)UIView * topContentView;
@property (nonatomic, strong)UIView * centerTitleView;
@property (nonatomic, strong)UITableView * contentTableView;
@property (nonatomic, strong)NSMutableArray * titleArray;
@property (nonatomic, strong)NSMutableArray * contentArray;
@property (nonatomic, strong)NSMutableArray * topTitleArray;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"首页" TitleColor:Color_white];
    [super setNavigationRightIconView:Img_Name(@"search") Action:@selector(searchContent:)];
    
    self.titleArray = [NSMutableArray arrayWithCapacity:0];
    self.contentArray = [NSMutableArray arrayWithCapacity:0];
    self.topTitleArray = [NSMutableArray arrayWithObjects:@"标签一",@"标签二",@"标签三",@"标签四", nil];
    self.titleArray = [NSMutableArray arrayWithObjects:@"标签一",@"标签二",@"标签三", nil];
    [self createMainView];
}
#pragma mark - Search -
- (void)searchContent:(UIButton *)sender {
    FirstSearchViewController * searchVC = [[FirstSearchViewController alloc]init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [super pushController:searchVC];
}

#pragma mark - createMainView -
- (void)createMainView {
    self.topView = insertAutoView(self.view, Color_clear);
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 320);
    
    self.topLabelView = insertAutoView(self.topView, Color_white);
    self.topLabelView.layer.masksToBounds = YES;
    self.topLabelView.layer.cornerRadius = 20;
    self.topLabelView.layer.borderColor = Main_Color.CGColor;
    self.topLabelView.layer.borderWidth = 0.5;
    
    self.topContentView = insertAutoView(self.topView, Color_white);
    
    
    self.topLabelScrollView = [[UIScrollView alloc]init];
    self.topLabelScrollView.backgroundColor = Color_white;
    self.topLabelScrollView.showsVerticalScrollIndicator = NO;
    [self.topView addSubview:self.topLabelScrollView];
    
    
    self.contentLabel = insertAutoLabel(self.topLabelView, MainText_Color, Color_clear, Regular_28, NSTextAlignmentLeft, @"最新公告：积分可以兑换东西哦！");
    self.contentLabel.numberOfLines = 0;
    [self.topLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.topView);
        make.height.mas_offset(40);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.topLabelView);
        make.left.equalTo(self.topLabelView.mas_left).offset(20);
        make.right.equalTo(self.topLabelView.mas_right).offset(-20);
    }];
    [self.topContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.topLabelView);
        make.top.equalTo(self.topLabelView.mas_bottom);
        make.height.mas_offset(200);
    }];
    [self.topLabelScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topLabelView);
        make.top.equalTo(self.topContentView.mas_bottom);
        make.bottom.equalTo(self.topView.mas_bottom);
        make.width.mas_offset(SCREEN_WIDTH);
        make.height.mas_offset(80);
    }];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpNewPage)];
    [self.topLabelView addGestureRecognizer:tap];
    
    for (int i = 0; i < self.topTitleArray.count; i++) {
        self.centerTitleView = [self setTitleBtWithWidth:(SCREEN_WIDTH/4-20)*i WithVWidth:SCREEN_WIDTH/4-20 WithHeight:40 WithTag:i WithView:self.topLabelScrollView WithImg:nil WithTitle:self.topTitleArray[i]];
    }
    self.topLabelScrollView.contentSize = CGSizeMake((SCREEN_WIDTH/4-20)*self.topTitleArray.count, 80);
    
    self.contentTableView = [[UITableView alloc]init];
    self.contentTableView.tableHeaderView = self.topView;
    self.contentTableView.tableFooterView = [[UIView alloc]init];
//    self.contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.view addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.contentTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"FirstTableViewCell"];
}
#pragma mark - TitleButton -
- (UIView *)setTitleBtWithWidth:(CGFloat)width WithVWidth:(CGFloat)Vwidth WithHeight:(CGFloat)height WithTag:(NSInteger)tag WithView:(UIView *)Mainview WithImg:(NSString *)img WithTitle:(NSString *)title {
    UIView * mainView = insertAutoView(Mainview, Color_clear);
    //标签，后台传
    UIButton * mainBt = insertAutoButton(mainView, nil, nil, Color_clear, MainText_Color, MainText_Color, Regular_26, title, UIControlContentHorizontalAlignmentCenter);
    mainBt.layer.masksToBounds = YES;
    mainBt.layer.cornerRadius = 5;
    mainBt.layer.borderWidth = 0.5;
    mainBt.layer.borderColor = Main_Color.CGColor;
    
//    UIButton * mainBt = insertAutoButton(mainView, Img_Name(img), Img_Name(img), Color_clear, nil, nil, nil, nil, UIControlContentHorizontalAlignmentCenter);
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(Mainview.mas_centerY);
        make.left.equalTo(Mainview.mas_left).offset(width);
        make.width.mas_offset(Vwidth);
        make.height.mas_offset(height);
    }];
    [mainBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(mainView.mas_centerY);
        make.left.equalTo(mainView.mas_left).offset(10);
        make.right.equalTo(mainView.mas_right).offset(-10);
        make.height.mas_offset(height-10);
    }];
    mainBt.tag = 10+tag;
    [mainBt addTarget:self action:@selector(jumpNextPage:) forControlEvents:UIControlEventTouchUpInside];
    return mainView;
}
#pragma mark - 公告列表 -
- (void)jumpNewPage {
    FirstAnnouncementViewController * announcementVC = [[FirstAnnouncementViewController alloc]init];
    announcementVC.hidesBottomBarWhenPushed = YES;
    [super pushController:announcementVC];
}
#pragma mark - UITableViewDelegate & UITableViewDataSoure -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 2){
        return 200;
    }else{
        return 150;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headerView.backgroundColor = Color_white;
    
    UIView * leftView = insertAutoView(headerView, RGBA(216, 245, 32, 0.5));
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).offset(10);
        make.top.equalTo(headerView.mas_top).offset(5);
        make.bottom.equalTo(headerView.mas_bottom).offset(-5);
        make.width.mas_offset(5);
    }];
    
    UILabel * titleLabel = insertAutoLabel(headerView, MainText_Color, Color_clear, Regular_30, NSTextAlignmentLeft, self.titleArray[section]);
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(leftView);
        make.left.equalTo(leftView.mas_right).offset(5);
    }];
    
    UIView * lineView = insertAutoView(headerView, Line_Color);
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headerView);
        make.bottom.equalTo(headerView.mas_bottom);
        make.height.mas_offset(0.5);
    }];
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];
    if (!cell){
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstTableViewCell"];
        cell.backgroundColor = Color_white;
    }
    if (indexPath.row == 2){
        cell.lineView.hidden = NO;
        cell.moreButton.hidden = NO;
        cell.moreButton.tag = indexPath.section;
        [cell.moreButton addTarget:self action:@selector(jumpNextPage:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        cell.lineView.hidden = YES;
        cell.moreButton.hidden = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstContentShowViewController * showVC = [[FirstContentShowViewController alloc]init];
    showVC.hidesBottomBarWhenPushed = YES;
    [super pushController:showVC];
}
- (void)jumpNextPage:(UIButton *)sender {
    
    FirstContentViewController * contetnVC = [[FirstContentViewController alloc]init];
    if(sender.tag >= 10){
        contetnVC.navTitle = self.topTitleArray[sender.tag-10];
        
    }else{
        contetnVC.navTitle = self.titleArray[sender.tag];
        
    }
    contetnVC.hidesBottomBarWhenPushed = YES;
    [super pushController:contetnVC];
}
@end
