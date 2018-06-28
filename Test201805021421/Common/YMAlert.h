//
//  YMAlert.h
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/7.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMAlert : NSObject

typedef void(^okBlock)(void);
typedef void(^cancleBlock)(void);

+ (UIAlertController *) YMAlertWithTitle:(NSString *)title
                             withMessage:(NSString *) message
                               withOkBtn:(NSString *) okTitle
                           withCancleBtn:(NSString *) cancleTitle
                             withOkBlock:(okBlock) okB
                         withCancleBlock:(cancleBlock) cancleB;
@end
