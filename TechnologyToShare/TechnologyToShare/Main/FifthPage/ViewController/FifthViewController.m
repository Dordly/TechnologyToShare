//
//  FifthViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/20.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FifthViewController.h"
#import "FifthTableViewCell.h"
@interface FifthViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UIView * topView;
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSArray * contentArray;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentArray = @[@{@"img":@"manuscripts",@"title":@"我的存稿"},@{@"img":@"editword",@"title":@"我的文集"},@{@"img":@"like",@"title":@"喜欢的文章"},@{@"img":@"history",@"title":@"历史记录"},@{@"img":@"feedback",@"title":@"问题反馈"},@{@"img":@"print",@"title":@"打印文章"}];
    [self createMainView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}
- (void)createMainView {
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 220)];
    self.topView.backgroundColor = Color_white;
    
    self.mainTableView = [[UITableView alloc]init];
    self.mainTableView.tableHeaderView = self.topView;
    self.mainTableView.tableFooterView = [[UIView alloc]init];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.backgroundColor = Color_white;
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.view);
    }];
    [self.mainTableView registerClass:[FifthTableViewCell class] forCellReuseIdentifier:@"FifthTableViewCell"];
}
#pragma mark - UITableViewDelegate & UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FifthTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FifthTableViewCell" forIndexPath:indexPath];
    if (!cell){
        cell = [[FifthTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FifthTableViewCell"];
        cell.backgroundColor = Color_white;
    }
    [cell.leftImgView setImage:Img_Name(self.contentArray[indexPath.row][@"img"])];
    cell.centerTitleLabel.text = self.contentArray[indexPath.row][@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
