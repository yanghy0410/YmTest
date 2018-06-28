//
//  FourViewController.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/6/26.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView *adView;
@property (nonatomic,strong) UIScrollView *scroView;
@property (nonatomic,strong) NSTimer *scroTimer;
@property (nonatomic,strong) UIScrollView *labScro;
@property (nonatomic,strong) UILabel *labSc;


@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"Hello World";
    self.view.backgroundColor=[UIColor blueColor];
    
    [self.view addSubview:self.collectionView];
    
    [self createUI];
}

- (void)createUI{
    
    
    
    CGSize size=self.adView.bounds.size;
    
    
    UIScrollView *scroView=[[UIScrollView alloc] initWithFrame:CGRectMake(5, 5, size.width-10, size.height-10)];
    self.scroView=scroView;
    scroView.backgroundColor=[UIColor greenColor];
    scroView.contentSize=CGSizeMake(scroView.frame.size.width, scroView.frame.size.height*3);
    
    
    for (int i=0; i<3; i++) {
   
        UILabel *lab=[[UILabel alloc] initWithFrame:CGRectMake(0, scroView.frame.size.height*i, scroView.frame.size.width, scroView.frame.size.height)];
        lab.text=[NSString stringWithFormat:@"%d",i];
        
        lab.textAlignment=NSTextAlignmentCenter;
        lab.textColor=[UIColor redColor];
        
        [scroView addSubview:lab];
    }
    
  
    
    
    [self.adView addSubview:scroView];
    [self.view addSubview:self.adView];
    
    [[NSRunLoop currentRunLoop] addTimer:self.scroTimer forMode:NSRunLoopCommonModes];
    
    
    UIScrollView *labScro=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 500, KScreenWidth, 30)];
    labScro.backgroundColor=[UIColor whiteColor];
    
    labScro.contentSize=CGSizeMake(KScreenWidth, 30);
    
    UILabel *labSc=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, scroView.frame.size.width, scroView.frame.size.height)];
    labSc.text=@"0123456789abcdefghigklmnopqrstuvwxyz";
    
    labSc.textAlignment=NSTextAlignmentCenter;
    labSc.textColor=[UIColor redColor];
    self.labSc=labSc;
    [labScro addSubview:labSc];
    [self.view addSubview:labScro];
    
    [UIView animateWithDuration:10 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        
          self.labSc.frame=CGRectMake(self.labSc.frame.origin.x+100, self.labSc.frame.origin.y, self.labSc.frame.size.width, self.labSc.frame.size.height);
        
    } completion:nil];
    
}


- (void)scroChange{
    CGFloat height=self.scroView.frame.size.height;
    CGFloat pointY=self.scroView.contentOffset.y;
    
    if (pointY>=height*2) {
        pointY=0;
        self.scroView.contentOffset = CGPointMake(0, 0);
    }else{
        pointY=pointY+height;
        
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        
        self.scroView.contentOffset = CGPointMake(0, pointY);
        
    }completion:^(BOOL finished) {
        
    }];
    
    
    
   
    
    
    NSLog(@"-------%f",pointY);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





- (UIView *)adView{
    
    if (!_adView) {
        _adView=[[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame)+100, KScreenWidth, 50)];
        _adView.backgroundColor=[UIColor whiteColor];
    }
    
    return _adView;
}

- (NSTimer *)scroTimer{
    if (!_scroTimer) {
        _scroTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scroChange) userInfo:nil repeats:YES];
    }
    return _scroTimer;
}








- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout=[UICollectionViewFlowLayout new];
        layout.itemSize=CGSizeMake(KScreenWidth/3, KScreenWidth/3);
        layout.minimumLineSpacing=5;
        layout.minimumInteritemSpacing=5;
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, KScreenWidth, KScreenWidth/3) collectionViewLayout:layout];
        _collectionView.backgroundColor=[UIColor yellowColor];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.showsHorizontalScrollIndicator=NO;
        _collectionView.showsVerticalScrollIndicator=NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionView;
}

#pragma mark - Delegate DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.backgroundColor=YMRandomColor;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}



@end
