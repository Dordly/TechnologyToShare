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
@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIView * topView;
@property (nonatomic, strong)UIView * topLabelView;
@property (nonatomic, strong)UIView * topContentView;
@property (nonatomic, strong)UIView * centerTitleView;
@property (nonatomic, strong)UIView * bottomContrentView;
@property (nonatomic, strong)UITableView * contentTableView;
@property (nonatomic, strong)NSMutableArray * titleArray;
@property (nonatomic, strong)NSMutableArray * contentArray;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:@"首页" TitleColor:Color_white];
    [super setNavigationRightIconView:Img_Name(@"search") Action:@selector(searchContent:)];
    self.titleArray = [NSMutableArray arrayWithCapacity:0];
    self.contentArray = [NSMutableArray arrayWithCapacity:0];
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
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 490);
    self.topLabelView = insertAutoView(self.topView, Color_white);
    self.topLabelView.layer.masksToBounds = YES;
    self.topLabelView.layer.cornerRadius = 20;
    self.topLabelView.layer.borderColor = Main_Color.CGColor;
    self.topLabelView.layer.borderWidth = 0.5;
    
    self.topContentView = insertAutoView(self.topView, Color_white);
    self.centerTitleView = insertAutoView(self.topView, Color_white);
    self.bottomContrentView = insertAutoView(self.view, Color_white);
    
    [self.topLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.topView);
        make.height.mas_offset(40);
    }];
    [self.topContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.topLabelView);
        make.top.equalTo(self.topLabelView.mas_bottom);
        make.height.mas_offset(250);
    }];
    [self.centerTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.topLabelView);
        make.top.equalTo(self.topContentView.mas_bottom);
        make.bottom.equalTo(self.topView.mas_bottom);
        make.height.mas_offset(100);
    }];
    [self.bottomContrentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.left.equalTo(self.view);
    }];
    
    self.contentTableView = [[UITableView alloc]init];
    self.contentTableView.tableHeaderView = self.topView;
    self.contentTableView.tableFooterView = [[UIView alloc]init];
//    self.contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.bottomContrentView addSubview:self.contentTableView];
    [self.contentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.bottomContrentView);
    }];
    [self.contentTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"FirstTableViewCell"];
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
    NSLog(@"%ld-点击跳转下一页",sender.tag);
    FirstContentViewController * contetnVC = [[FirstContentViewController alloc]init];
    contetnVC.navTitle = self.titleArray[sender.tag];
    contetnVC.hidesBottomBarWhenPushed = YES;
    [super pushController:contetnVC];
}
@end
