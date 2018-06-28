//
//  AppDelegate+AppService.m
//  Test201805021421
//
//  Created by 请加我杨先生 on 2018/5/4.
//  Copyright © 2018年 请加我杨先生. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import <AVFoundation/AVFoundation.h>

@implementation AppDelegate (AppService)


- (void) checkAppVersion{
    
    NSString *version=@"4.0";//请求获取
    
    NSString *curVersion=[kUserDefaults objectForKey:yVersion];
    
    if (![curVersion isEqualToString:version]) {
        [kUserDefaults setValue:version forKey:yVersion];
        UIAlertController *alert=[YMAlert YMAlertWithTitle:@"新版本提示" withMessage:@"修复了相关bug" withOkBtn:@"OK" withCancleBtn:@"Cancle" withOkBlock:^{
             NSLog(@"okClick");
        } withCancleBlock:^{
            NSLog(@"cancleBtn");
        }];
        
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void) appVendorsInit{
    //获取音频会话
    AVAudioSession *session = [AVAudioSession sharedInstance];
    //设置类型是播放。
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    //激活音频会话。
    [session setActive:YES error:nil];
}


@end
