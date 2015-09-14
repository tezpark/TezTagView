//
//  TezTagView.h
//  TezTagViewExample
//
//  Created by Taesun Park on 2015. 6. 16..
//  Copyright (c) 2015년 TezLab. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TezTagViewDelegate <NSObject>

/**
 *  Tag button click event response method.
 *
 *  @param index button index
 */
- (void)responseOfClickTag:(NSInteger)index;

@end



@interface TezTagView : UIView

/********************************************************
 optional - If value is not setting, apply default value.
 ********************************************************/
/**
*  (Optional) Left and right side margin. If value is not setting, apply TezTagView value.
*/
@property (nonatomic, assign) CGFloat sideMargin;

/**
 *  (Optional) Tag item button height. If value is not setting, apply TezTagView value.
 */
@property (nonatomic, assign) CGFloat tagHeight;

/**
 *  (Optional) Vertical margin with tag item buttons. If value is not setting, apply TezTagView value.
 */
@property (nonatomic, assign) CGFloat tagVerticalMargin;

/**
 *  (Optional) Horizontal margin with tag item buttons. If value is not setting, apply TezTagView value.
 */
@property (nonatomic, assign) CGFloat tagHorizontalMargin;

/**
 *  (Optional) Title font with tag item buttons. If value is not setting, apply TezTagView value.
 */
@property (nonatomic, strong) UIFont* font;

/**
 *  (Optional) Tag button background image. If value is not setting, draw border.
 */
@property (nonatomic, strong) UIImage* bgImage;

/**
 *  (Optional) TagView set align center.
 */
@property (nonatomic, assign) BOOL alignCenter;


/**
 *  Initialize TezTagView
 *
 *  @param rect     view frame rect
 *  @param strArr   string array
 *  @param delegate delegate
 *
 *  @return tezTagView
 */
- (id)initWithFrame:(CGRect)rect tagStrings:(NSArray*)strArr delegate:(id<TezTagViewDelegate>)delegate;

/**
 *  Get height with default values and words
 *
 *  @param words words for tag
 *
 *  @return Total height value
 */
+ (CGFloat)getTotalHeightWithDefaultValuesAndWords:(NSArray*)words;

/**
 *  Get height with custom values and words
 *
 *  @param words   words for tag
 *  @param sMargin side margin
 *  @param vMargin vertical margin
 *  @param hMargin horizontal margin
 *  @param tMargin top margin
 *  @param bMargin bottom margin
 *  @param font    words font
 *
 *  @return Total height value
 */
+ (CGFloat)getTotalHeightWithWords:(NSArray*)words
                        sideMargin:(CGFloat)sMargin
                    verticalMargin:(CGFloat)vMargin
                  horizontalMargin:(CGFloat)hMargin
                         topMargin:(CGFloat)tMargin
                      bottomMargin:(CGFloat)bMargin
                              font:(UIFont*)font;


@end
