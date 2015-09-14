//
//  UIImage+TezStetch.m
//  TezAlertViewExample
//
//  Created by Taesun Park on 2015. 5. 27..
//  Copyright (c) 2015년 TezLab. All rights reserved.
//

#import "UIImage+TezStetch.h"

@implementation UIImage (TezStetch)

- (UIImage *)stretchableImageForAnyOSwithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight {
	if ([self respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
		return [self resizableImageWithCapInsets:UIEdgeInsetsMake(topCapHeight, leftCapWidth, topCapHeight, leftCapWidth)];
	}
	else {
		return [self stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
	}
}

- (UIImage *)stretchableImageForAnyOSwithCenterCap {
	if ([self respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
		return [self resizableImageWithCapInsets:UIEdgeInsetsMake(self.size.height / 2, self.size.width / 2, self.size.height / 2, self.size.width / 2)];
	}
	else {
		return [self stretchableImageWithLeftCapWidth:self.size.width / 2 topCapHeight:self.size.height / 2];
	}
}

@end
