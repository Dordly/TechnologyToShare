//
//  FirstContentViewController.m
//  TechnologyToShare
//
//  Created by dordly on 2018/7/23.
//  Copyright © 2018年 dordly. All rights reserved.
//

#import "FirstContentViewController.h"
#import "FirstTableViewCell.h"
#import "FirstContentShowViewController.h"//内容显示页面
@interface FirstContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * mainTableView;
@property (nonatomic, strong)NSMutableArray * mainArray;
@end

@implementation FirstContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setNavigationBarColor:Main_Color title:self.navTitle TitleColor:Color_white];
    
    self.mainArray = [NSMutableArray arrayWithCapacity:0];
    self.mainTableView = [[UITableView alloc]init];
    self.mainTableView.tableFooterView = [[UIView alloc]init];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource =self;
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.mainTableView registerClass:[FirstTableViewCell class] forCellReuseIdentifier:@"FirstTableViewCell"];
}
#pragma mark - UITableViewDelegate && UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];
    if (!cell){
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstTableViewCell"];
    }
    cell.moreButton.hidden = YES;
    cell.lineView.hidden = YES;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstContentShowViewController * showVC = [[FirstContentShowViewController alloc]init];
    showVC.hidesBottomBarWhenPushed = YES;
    [super pushController:showVC];
}
@end
