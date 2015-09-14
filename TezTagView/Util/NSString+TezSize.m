//
//  NSString+TezSize.m
//  test
//
//  Created by Taesun Park on 2015. 3. 26..
//  Copyright (c) 2015년 12Corporation. All rights reserved.
//

#import "NSString+TezSize.h"

@implementation NSString (TezSize)

#pragma mark - Get CGSize
- (CGSize)getSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          font, NSFontAttributeName,
                                          nil];
    
    CGRect textFrame = [self boundingRectWithSize:maxSize
                                      options:NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributesDictionary
                                      context:nil];
    CGSize stringSize = textFrame.size;
    return stringSize;
}

- (CGSize)getSizeWithFont:(UIFont *)font {
	CGSize maxSize = CGSizeMake(310, CGFLOAT_MAX);

	return [self getSizeWithFont:font maxSize:maxSize];
}

#pragma mark - Get Width/Height
- (CGFloat)getWidthWithFont:(UIFont *)font {
	CGFloat width = [self getSizeWithFont:font].width;

	return width;
}

- (CGFloat)getHeightWithFont:(UIFont *)font {
	CGFloat height = [self getSizeWithFont:font].height;

	return height;
}

- (CGFloat)getWidthWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
	CGFloat width = [self getSizeWithFont:font maxSize:maxSize].width;

	return width;
}

- (CGFloat)getHeightWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
	CGFloat height = [self getSizeWithFont:font maxSize:maxSize].height;

	return height;
}

@end
