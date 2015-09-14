//
//  NSString+TezSize.h
//  test
//
//  Created by Taesun Park on 2015. 3. 26..
//  Copyright (c) 2015년 12Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TezSize)

#pragma mark - Get CGSize
/**
 *  Get string size with font and max size.
 *
 *  @param font Text font
 *  @param maxSize Max frame size
 *
 *  @return Text size
 */
- (CGSize)getSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  Get string size with font.
 *
 *  @param font Text font
 *
 *  @return Text size
 */
- (CGSize)getSizeWithFont:(UIFont *)font;


#pragma mark - Get Width/Height

/**
 *  Get string width with font
 *
 *  @param font Text font
 *
 *  @return Text width
 */
- (CGFloat)getWidthWithFont:(UIFont *)font;

/**
 *  Get string height with font
 *
 *  @param font Text font
 *
 *  @return Text height
 */
- (CGFloat)getHeightWithFont:(UIFont *)font;

/**
 *  Get string width with font and max size.
 *
 *  @param font Text font
 *  @param maxSize Max frame size
 *
 *  @return Text width
 */
- (CGFloat)getWidthWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  Get string height with font and max size.
 *
 *  @param font Text font
 *  @param maxSize Max frame size
 *
 *  @return Text height
 */
- (CGFloat)getHeightWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end
