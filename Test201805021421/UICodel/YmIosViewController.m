//
//  YmIosViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/6/26.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "YmIosViewController.h"
#import "YmLineView.h"

#define JDCOLOR_FROM_RGB_OxFF_ALPHA(rgbValue,al)                    \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]

#define rc [[UIApplication sharedApplication] keyWindow].bounds

@interface YmIosViewController ()


@end

@implementation YmIosViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title=@"IOS";
    self.view.backgroundColor=[UIColor whiteColor];
    [self createUI];
}

- (void)createUI{
   //JDCOLOR_FROM_RGB_OxFF_ALPHA(0x323232, 0.7);
    
    UIView *ve=[[YmLineView alloc] initWithFrame:self.view.frame];
    ve.backgroundColor=[UIColor whiteColor];
    
    
    [self.view addSubview:ve];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
