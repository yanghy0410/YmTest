//
//  NSString+SizeWithFont.m
//  With
//
//  Created by openthread on 5/16/16.
//  Copyright © 2016 Wish Wood. All rights reserved.
//

#import "NSString+SizeWithFont.h"
#import <UIKit/UIKit.h>

@implementation NSString (SizeWithFont)

- (CGSize)sizeWithFontIniOS7:(UIFont *)font {
    
    CGSize textSize = [self sizeWithFontIniOS7:font constrainedToSize:CGSizeMake(DBL_MAX, DBL_MAX)];
    return textSize;
}

- (CGSize)sizeWithFontIniOS7:(UIFont *)font constrainedToSize:(CGSize)size {
    
    CGRect textRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName: font} context:nil];
    return textRect.size;
}

@end
