//
//  AdPageView.h
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/22.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 启动广告页面
 */


typedef void(^TapBlock)(void);

@interface AdPageView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTapBlock:(TapBlock)tapBlock;



/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@end
