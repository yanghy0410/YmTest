//
//  YMAlert.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/7.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "YMAlert.h"

@implementation YMAlert


+ (UIAlertController *) YMAlertWithTitle:(NSString *)title
                             withMessage:(NSString *) message
                               withOkBtn:(NSString *) okTitle
                           withCancleBtn:(NSString *) cancleTitle
                             withOkBlock:(okBlock ) okB
                         withCancleBlock:(cancleBlock ) cancleB

{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okBtn=[UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        okB();
    }];
    
    UIAlertAction *cancleBtn=[UIAlertAction actionWithTitle:cancleTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancleB();
    }];
    
    [alert addAction:okBtn];
    [alert addAction:cancleBtn];
    
    
    
    return alert;
}

@end
