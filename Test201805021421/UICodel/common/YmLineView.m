//
//  YmLineView.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/6/27.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "YmLineView.h"

@implementation YmLineView


- (void)drawRect:(CGRect)rect {
    
    CGRect rc=[[UIApplication sharedApplication] keyWindow].bounds;
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    path.lineCapStyle=kCGLineCapRound;
    path.lineJoinStyle=kCGLineJoinRound;
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path moveToPoint:CGPointMake(rc.size.width/2, 64+50*1)];//起点
    
    [path addLineToPoint:CGPointMake(rc.size.width/2-50, 64+50*2)];
    
    [path addLineToPoint:CGPointMake(rc.size.width/2, 64+50*3)];
    
    [path addLineToPoint:CGPointMake(rc.size.width/2+50, 64+50*2)];
    
   // [path closePath];

    
    [path stroke];
    self.backgroundColor=[UIColor whiteColor];
}

@end
