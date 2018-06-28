//
//  NSString+SizeWithFont.h
//  With
//
//  Created by openthread on 5/16/16.
//  Copyright © 2016 Wish Wood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SizeWithFont)

- (CGSize)sizeWithFontIniOS7:(UIFont *)font;
- (CGSize)sizeWithFontIniOS7:(UIFont *)font constrainedToSize:(CGSize)size;

@end
