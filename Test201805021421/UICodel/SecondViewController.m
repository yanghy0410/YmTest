//
//  SecondViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/3.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "SecondViewController.h"
#import "CBAutoScrollLabel.h"


#define HUIApplicationFrame()        ([[UIScreen mainScreen] applicationFrame])
@interface SecondViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSArray* tbData;



@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *children1=@[@"1-1",@"1-2",@"1-3"];
    NSArray *children2=@[@"2-1",@"2-2",@"2-3"];
    NSArray *children3=@[@"3-1",@"3-2",@"3-3"];
    
    self.tbData=@[children1,children2,children3];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self settingNavTitle:@"weiquan" TitleSize:20];
    
    [self createUI];
    

}

- (void)createUI{
    
    UITableView *tb=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tb.dataSource=self;
    tb.delegate=self;
    
    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellYM"];
    
    
    [self.view addSubview:tb];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellYM" forIndexPath:indexPath];
    
    NSArray *chil=_tbData[indexPath.section];
    
    cell.textLabel.text=chil[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *chil=_tbData[section];
    
    NSInteger count=[chil count];
    
    return  count;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_tbData count];
}


@end
