//
//  BaseTabBarViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/2.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "MeViewController.h"
#import "YMAudioViewController.h"
#import "YMTestScrollerViewController.h"
#import "FourViewController.h"
#import "YmIosViewController.h"
@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createMainUI];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createMainUI{
    

    NSArray *normalImageArray =[NSArray arrayWithObjects:@"feed_tab_butten_normal.png",@"movie_tab_butten_normal.png",@"me_tab_butten_normal.png",nil];
    NSArray *selectImageArray =[NSArray arrayWithObjects:@"feed_tab_butten_press.png",@"movie_tab_butten_press.png",@"me_tab_butten_press.png", nil];
    [self setChildVC:[YmIosViewController new] title:@"ios" image:normalImageArray[2] selectedImage:selectImageArray[2]];
//    [self setChildVC:[FirstViewController new] title:@"我的" image:normalImageArray[0] selectedImage:selectImageArray[0]];
    [self setChildVC:[ThirdViewController new] title:@"维权" image:normalImageArray[1] selectedImage:selectImageArray[1]];
    [self setChildVC:[YMTestScrollerViewController new] title:@"个人" image:normalImageArray[0] selectedImage:selectImageArray[0]];
    [self setChildVC:[FourViewController new] title:@"测试" image:normalImageArray[0] selectedImage:selectImageArray[0]];
    
}


- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) logo selectedImage:(NSString *) selectedLogo{
    

    
    UITabBarItem *tabBarItem=childVC.tabBarItem;
    
    UIImage *normalImage=[[UIImage imageNamed:logo] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImage=[[UIImage imageNamed:selectedLogo] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childVC.tabBarItem.image = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
    tabBarItem.title = title;
    
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,nil] forState:UIControlStateNormal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    nav.title=@"1111";
    [self addChildViewController:nav];
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
