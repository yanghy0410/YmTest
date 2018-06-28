//
//  YMTestScrollerViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/14.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "YMTestScrollerViewController.h"

@interface YMTestScrollerViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) UIScrollView  *scrollView;

@property (nonatomic ,strong) UILabel *lab;

@property (nonatomic, assign) int count;

@end

@implementation YMTestScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    scr.backgroundColor=[UIColor yellowColor];
    scr.contentSize=CGSizeMake(200, 400);
    
    self.count=0;
    
    
    
    
    
    
    
    
    UIView *cv=[[UIView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    cv.backgroundColor=[UIColor greenColor];
    
    [scr addSubview:cv];
    
    
    self.lab = [[UILabel alloc] initWithFrame:CGRectMake(100, 400, 200, 120)];
    
    
    self.lab.text = @"hellow word";
    
    [self.view addSubview:self.lab];
    

    self.scrollView=scr;
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(yhyTimer) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    
    [self.view addSubview:scr];
    
    //[self alertMes];
}

- (void)alertMes{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *b1 = [UIAlertAction actionWithTitle:@"1111" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *b2 = [UIAlertAction actionWithTitle:@"2222" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:b1];
    [alert addAction:b2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)yhyTimer{
    self.count=self.count+1;
    
    self.lab.text = [NSString stringWithFormat:@"%d",self.count];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    NSLog(@"self.scrollView.contentOffset.x = %f, self.scrollView.contentOffset.y = %f",self.scrollView.contentOffset.x,self.scrollView.contentOffset.y);
    
    NSLog(@"self.scrollView.bounds.origin.x = %f, self.scrollView.bounds.origin.y = %f",self.scrollView.bounds.origin.x,self.scrollView.bounds.origin.y);
    
    NSLog(@"********************************************************************************************");
}


@end
