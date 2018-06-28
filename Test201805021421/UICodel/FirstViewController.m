//
//  FirstViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/3.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "FirstViewController.h"
#import "NSString+SizeWithFont.h"
#import "CBAutoScrollLabel.h"

@interface FirstViewController ()
@property (nonatomic,strong) UIActivityIndicatorView *act;
@property (nonatomic,strong) CBAutoScrollLabel *autoScrollLabel;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self settingNavTitle:@"你好" TitleSize:0];
    
    UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 80)];
    lab.textColor=[UIColor greenColor];
    lab.text=@"123456789";
    lab.textAlignment=NSTextAlignmentCenter;
    lab.backgroundColor=[UIColor yellowColor];
    lab.userInteractionEnabled=YES;

    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yhyclick)];
    tap.numberOfTouchesRequired=1;
    tap.numberOfTapsRequired=3;
    
    [lab addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yhyclick2)];
    tap2.numberOfTouchesRequired=1;
    tap2.numberOfTapsRequired=5;
    
    [lab addGestureRecognizer:tap2];
    
    
    UIActivityIndicatorView *act=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    act.frame=CGRectMake(100, 100, 100, 100);
    act.color=[UIColor orangeColor];
    act.backgroundColor = [UIColor cyanColor];
    act.hidesWhenStopped=NO;
    self.act=act;
    
    [self.view addSubview:act];
    
    [self.view addSubview:lab];
    
    
    
    self.autoScrollLabel.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:self.autoScrollLabel];
    
}
- (CBAutoScrollLabel *)autoScrollLabel{
    if (!_autoScrollLabel) {
        _autoScrollLabel = [[CBAutoScrollLabel alloc]init];
        _autoScrollLabel.textColor = [UIColor redColor];
        _autoScrollLabel.font = [UIFont systemFontOfSize:14];
        _autoScrollLabel.text = @"诚招zoedear竹帝儿省、市、县独家代理商!财富热线:400-900-7688";
        [_autoScrollLabel observeApplicationNotifications];
    }
    return _autoScrollLabel;
}

- (void)yhyclick{
//    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"click" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"other", nil];
//
//    [alert show];
    
    [self.act startAnimating];
}

- (void)yhyclick2{
    [self.act stopAnimating];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
