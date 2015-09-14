//
//  UIImage+TezStetch.h
//  TezAlertViewExample
//
//  Created by Taesun Park on 2015. 5. 27..
//  Copyright (c) 2015년 TezLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TezStetch)

/**
 *  UIImage를 늘려준다
 *
 *  @param leftCapWidth leftCapWidth
 *  @param topCapHeight topCapHeight
 *
 *  @return UIImage
 */
- (UIImage *)stretchableImageForAnyOSwithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;

/**
 *  UIImage를 늘려준다. Center 기준으로.
 *
 *  @return UIImage
 */
- (UIImage *)stretchableImageForAnyOSwithCenterCap;

@end
