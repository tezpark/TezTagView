//
//  TezTagView.m
//  TezTagViewExample
//
//  Created by Taesun Park on 2015. 6. 16..
//  Copyright (c) 2015년 TezLab. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TezTagView.h"
#import "NSString+TezSize.h"
#import "UIImage+TezStetch.h"

static const CGFloat kSideMargin = 20.0f;
static const CGFloat kTagHeight = 28.0f;
static const CGFloat kTagVerticalMargin = 7.0f;
static const CGFloat kTagHorizontalMargin = 7.0f;
static const CGFloat kButtonInsideMargin = 9.0f;
#define kFont [UIFont systemFontOfSize:14]

#pragma mark - Private
@interface TezTagView ()
@property (nonatomic, strong) NSArray* strArr;
@property (nonatomic, weak) id<TezTagViewDelegate>delegate;
@end


#pragma mark - Public
@implementation TezTagView

- (id)initWithFrame:(CGRect)rect tagStrings:(NSArray*)strArr delegate:(id<TezTagViewDelegate>)delegate {
    self = [super initWithFrame:rect];
    if (self) {
        self.delegate = delegate;
        self.strArr = strArr;
        
        [self initValues];
    }
    
    return self;
}

- (void)initValues {
    self.sideMargin = -1;
    self.tagHeight = -1;
    self.tagVerticalMargin = -1;
    self.tagHorizontalMargin = -1;
}

- (void)drawRect:(CGRect)rect {
    if (self.sideMargin == -1)  self.sideMargin = kSideMargin;
    if (self.tagHeight == -1)   self.tagHeight = kTagHeight;
    if (self.tagVerticalMargin == -1)     self.tagVerticalMargin = kTagVerticalMargin;
    if (self.tagHorizontalMargin == -1)     self.tagHorizontalMargin = kTagHorizontalMargin;

    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - self.sideMargin*2;
    CGFloat lineWidth = 0;
    int line = 0;
    
    UIView* lineView = [[UIView alloc] initWithFrame:CGRectMake(self.sideMargin, 0, self.frame.size.width-self.sideMargin*2, self.tagHeight)];
    
    for (int i = 0; i < [self.strArr count]; i++) {
        NSString* tagWord = [self.strArr objectAtIndex:i];
        CGFloat width = [tagWord getWidthWithFont:(self.font?:kFont)] + kButtonInsideMargin*2;

        // Create tag button
        UIButton* tagBtn = [[UIButton alloc] initWithFrame:CGRectMake(lineWidth, 0, width, self.tagHeight)];
        [tagBtn setTitle:tagWord forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [tagBtn.titleLabel setFont:(self.font?:kFont)];
        [tagBtn setTag:i];
        [tagBtn addTarget:self action:@selector(onClickTag:) forControlEvents:UIControlEventTouchUpInside];

        // Setting background image or border
        if (self.bgImage)
            [tagBtn setBackgroundImage:[self.bgImage stretchableImageForAnyOSwithCenterCap] forState:UIControlStateNormal];
        else {
            tagBtn.layer.cornerRadius = 5;
            tagBtn.layer.borderWidth = 1;
            tagBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        }

        // Add view on lineView or self view
        if ((lineWidth + (width + kTagVerticalMargin)) <= maxWidth) {
            lineWidth += (width + kTagVerticalMargin);
            [lineView addSubview:tagBtn];
        }
        else {
            // Align center
            if (self.alignCenter) {
                CGRect frame = lineView.frame;
                frame.size.width = lineWidth - kTagVerticalMargin;
                [lineView setFrame:frame];
                lineView.center = CGPointMake(self.center.x, lineView.center.y);
            }
            [self addSubview:lineView];

            lineWidth += (width + kTagVerticalMargin);
            
            line++;
            lineWidth = 0;
            [tagBtn setFrame:CGRectMake(lineWidth, 0, width, self.tagHeight)];
            
            lineView = [[UIView alloc] initWithFrame:CGRectMake(self.sideMargin, (self.tagHeight+self.tagHorizontalMargin)*line, self.frame.size.width-self.sideMargin*2, self.tagHeight)];

            lineWidth += (width + kTagVerticalMargin);
            [lineView addSubview:tagBtn];
        }
    }

    // Align center
    if (self.alignCenter) {
        CGRect frame = lineView.frame;
        frame.size.width = lineWidth - kTagVerticalMargin;
        [lineView setFrame:frame];
        lineView.center = CGPointMake(self.center.x, lineView.center.y);
    }

    [self addSubview:lineView];
}


#pragma mark - onClick action

- (void)onClickTag:(id)sender {
    UIButton* button = (UIButton*)sender;
    NSInteger tag = button.tag;
    
    if ([self.delegate respondsToSelector:@selector(responseOfClickTag:)]) {
        [self.delegate responseOfClickTag:tag];
    }
}


#pragma mark - Calculator height
+ (CGFloat)getTotalHeightWithDefaultValuesAndWords:(NSArray*)words {
    return [TezTagView getTotalHeightWithWords:words sideMargin:kSideMargin verticalMargin:kTagVerticalMargin horizontalMargin:kTagHorizontalMargin topMargin:kTagHorizontalMargin bottomMargin:kTagHorizontalMargin font:kFont];
}

+ (CGFloat)getTotalHeightWithWords:(NSArray*)words
                        sideMargin:(CGFloat)sMargin
                    verticalMargin:(CGFloat)vMargin
                  horizontalMargin:(CGFloat)hMargin
                         topMargin:(CGFloat)tMargin
                      bottomMargin:(CGFloat)bMargin
                              font:(UIFont*)font {
    CGFloat height = (tMargin + bMargin);
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - sMargin*2;
    CGFloat lineWidth = 0;
    int line = ([words count]==0)?0:1;
    
    for (int i = 0; i < [words count]; i++) {
        NSString* rcmdWord = [words objectAtIndex:i];
        CGFloat margin = 9.0f;
        CGFloat width = [rcmdWord getWidthWithFont:font] + margin*2;
        if (i != 0) {
            lineWidth += vMargin;
        }
        lineWidth += width;
        
        if (lineWidth > maxWidth) {
            line++;
            lineWidth = 0;
            
            if (i != 0) {
                lineWidth += vMargin;
            }
            lineWidth += width;
        }
    }
    
    height += ((line*28) + ((line-1)*vMargin));
    
    return height;
}

@end
