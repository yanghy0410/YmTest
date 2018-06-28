//
//  BaseViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/3.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "BaseViewController.h"
#import "NSString+SizeWithFont.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)settingNavTitle:(NSString *)title TitleSize:(CGFloat)size{
    
    
    CGRect rcTileView = CGRectMake(90, 0, 100, 44);
    
    UILabel *titleTextLabel = [[UILabel alloc] initWithFrame:rcTileView];
    titleTextLabel.backgroundColor = [UIColor clearColor];
    titleTextLabel.textAlignment = NSTextAlignmentCenter;
    titleTextLabel.textColor = [UIColor greenColor];
    if (size == 0) {
        [titleTextLabel setFont:[UIFont systemFontOfSize:20.0f]];
    }else {
        [titleTextLabel setFont:[UIFont systemFontOfSize:size]];
    }
    [titleTextLabel setText:title];
    CGSize sizeTitle = [title sizeWithFontIniOS7:titleTextLabel.font];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.frame = CGRectMake(rcTileView.size.width/2+sizeTitle.width/2+10, 12, 20, 20);
    [indicatorView setHidesWhenStopped:YES];
    [titleTextLabel addSubview:indicatorView];
    
    self.navigationItem.titleView = titleTextLabel;
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
