//
//  MeViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/9.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "MeViewController.h"


@interface MeViewController () <UITableViewDelegate,UITableViewDelegate>
@property (assign, nonatomic) int count;
@property (nonatomic ,strong) UITableView *tableview;
@end

@implementation MeViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.count=10;
    [self settingNavTitle:@"tableview" TitleSize:0];
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    
    
    UITableView* tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbView.backgroundColor = [UIColor clearColor];
    tbView.dataSource = self;
    tbView.delegate = self;
    tbView.estimatedRowHeight = 0;
    tbView.estimatedSectionHeaderHeight = 0;
    tbView.estimatedSectionFooterHeight = 0;
    
    self.tableview=tbView;
//    self.tableview.mj_header=[MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadListData)];
//    self.tableview.mj_footer=[MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreListData)];
    [self.tableview.mj_header beginRefreshing];
    
    
    
    tbView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.count = 10;
            [self.tableview reloadData];
            [self.tableview.mj_header endRefreshing];
        });
    }];
    tbView.mj_header.automaticallyChangeAlpha = YES;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.count += 5;
            [self.tableview reloadData];
            [self.tableview.mj_footer endRefreshing];
        });
    }];
    //footer.hidden = YES;
    tbView.mj_footer = footer;
    
    
    
    
    
    
    [self.view addSubview:self.tableview];
    [self.tableview reloadData];
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.row % 2 && self.navigationController) {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld---%ld",indexPath.section,indexPath.row];;
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld---%ld",indexPath.section,indexPath.row];;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
