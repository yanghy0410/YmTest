//
//  AppDelegate.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/2.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"
#import "AppManager.h"


@interface AppDelegate ()

@property (nonatomic,strong) NSTimer *adTimer;
@property (nonatomic,weak)   UIButton *adSkinButton;//跳过按钮
@property (nonatomic, assign) int count;

@end
// 广告显示的时间
static int const showtime = 5;
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController=[BaseTabBarViewController new];
    
    //[AppManager appStart];
    //http://ls.qingting.fm/live/1133/24k.m3u8
    
    [self appVendorsInit];
    
    [self checkAppVersion];
    
    //[self appAd];
    
    
    return YES;
}
- (void) appAd{
    
    UIView *view=[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.tag=7777777;
    
    // 1.广告图片
    UIImageView *adView = [[UIImageView alloc] initWithFrame:view.frame];
    adView.userInteractionEnabled = YES;
    adView.contentMode = UIViewContentModeScaleAspectFill;
    adView.clipsToBounds = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
    [adView addGestureRecognizer:tap];
    
    // 2.跳过按钮
    CGFloat btnW = 60;
    CGFloat btnH = 30;
    UIButton *countBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth - btnW - 24, kTopHeight-44, btnW, btnH)];
    [countBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [countBtn setTitle:[NSString stringWithFormat:@"跳过%d", showtime] forState:UIControlStateNormal];
    countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [countBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    countBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
    countBtn.layer.cornerRadius = 4;
    
    self.adSkinButton=countBtn;
    
    [view addSubview:adView];
    [view addSubview:countBtn];
    
    adView.image=[UIImage imageNamed:@"timg.jpeg"];
    
    [self.window addSubview:view];
    self.count=showtime;
    if (!self.adTimer) {
        self.adTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    
    
}

- (void)countDown{
    
    if (self.count<=0) {
        [self.adTimer invalidate];
        self.adTimer=nil;
        
        UIView *view=[self.window viewWithTag:7777777];
        [view removeFromSuperview];
    }else{
        
        
        [self.adSkinButton setTitle:[NSString stringWithFormat:@"跳过%d", self.count] forState:UIControlStateNormal];
        self.count --;
    }
    
    
}

-(void)dismiss{
    
    [self.adTimer invalidate];
    self.adTimer=nil;
    
    UIView *view=[self.window viewWithTag:7777777];
    [view removeFromSuperview];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
