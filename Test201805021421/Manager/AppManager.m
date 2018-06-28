//
//  AppManager.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/4.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "AppManager.h"
#import "AdPageView.h"
#import "SecondViewController.h"

@implementation AppManager



+(void)appStart{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:kScreen_Bounds withTapBlock:^{
        UINavigationController *loginNavi =[[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
}

@end
