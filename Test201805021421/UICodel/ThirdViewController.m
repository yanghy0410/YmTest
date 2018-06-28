//
//  ThirdViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/3.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "ThirdViewController.h"
#import "MJRefresh.h"

@interface ThirdViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
@property (nonatomic ,strong) UITableView *tableview;

@property (assign, nonatomic) int count;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count=10;
    [self settingNavTitle:@"tableview" TitleSize:0];
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    
    
    UITableView* tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tbView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tbView.backgroundColor = [UIColor clearColor];
    tbView.dataSource = self;
    tbView.delegate = self;
    tbView.estimatedRowHeight = 0;
    tbView.estimatedSectionHeaderHeight = 0;
    tbView.estimatedSectionFooterHeight = 0;
    
    self.tableview=tbView;
    self.tableview.mj_header.automaticallyChangeAlpha=YES;
    self.tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadListData)];
    self.tableview.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreListData)];
    [self.tableview.mj_header beginRefreshing];
   
    
    
    
    UIView *tabHeard = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,150)];
    tabHeard.backgroundColor = [UIColor grayColor];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,50)];
    [tabHeard addSubview:view1];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0,50,self.view.bounds.size.width,50)];
    [tabHeard addSubview:view2];
    view2.backgroundColor = [UIColor blackColor];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0,100,self.view.bounds.size.width,50)];
    [tabHeard addSubview:view3];
    view3.backgroundColor = [UIColor orangeColor];
    
    
    
    self.tableview.tableHeaderView=tabHeard;
    
    [self.view addSubview:self.tableview];
    [self.tableview reloadData];
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadListData{
    NSLog(@"reloadListData");
    self.count=10;
    [self.tableview reloadData];
    [self.tableview.mj_header endRefreshing];
}

- (void)loadMoreListData{
    NSLog(@"loadMoreListData");
    
    self.count=self.count+5;
    [self.tableview reloadData];
    [self.tableview.mj_footer endRefreshing];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor=[UIColor whiteColor];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld---%ld",indexPath.section,indexPath.row];
    
    return cell;
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.tableview.contentOffset.y > 2*self.view.frame.size.height) {
     
    }else {
       
    }
    
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    view.backgroundColor=[UIColor greenColor];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yhyHeaderClick)];
    
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    
    [view addGestureRecognizer:tap];
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width/4, 0, view.frame.size.width/2, view.frame.size.height)];
    lab.text=[NSString stringWithFormat:@"ForHeaderInSection--%ld",section];
    [view addSubview:lab];
    
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    
    view.backgroundColor=[UIColor orangeColor];
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(view.frame.size.width/4, 0, view.frame.size.width/2, view.frame.size.height)];
    lab.text=[NSString stringWithFormat:@"FooterInSection--%ld",section];
    [view addSubview:lab];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示"
                                                                 message:[NSString stringWithFormat:@"用于显示的消息%ld---%ld",indexPath.section,indexPath.row]
                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }];
    
    [alert addAction:action1];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

        [tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationAutomatic];
   
   
}



#pragma mark - clickEvent
- (void)yhyHeaderClick{
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"多指点击" message:@"测试下header多点触控" delegate:self cancelButtonTitle:@"calcel" otherButtonTitles:@"ok", nil];
    
    [alert show];
}




@end
