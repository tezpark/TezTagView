//
//  ViewController.m
//  TezTagViewExample
//
//  Created by Taesun Park on 2015. 6. 16..
//  Copyright (c) 2015년 TezLab. All rights reserved.
//

#import "ViewController.h"
#import "TezTagView.h"

@interface ViewController () <TezTagViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray* strArr = @[@"test1", @"test2", @"blablablablabla", @"TezTagView",@"Tag view example", @"This tutorial is center align tags"];
    TezTagView* tagView = [[TezTagView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) tagStrings:strArr delegate:self];
    [tagView setAlignCenter:YES];
    [tagView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:tagView];

    
    CGFloat tagViewHeight = [TezTagView getTotalHeightWithDefaultValuesAndWords:strArr];
    
    NSArray* strArr2 = @[@"test3", @"test4", @"blablablablabla", @"TezTagView",@"Tag view example", @"This tutorial is left align tags"];
    TezTagView* tagViewForLeftAlign = [[TezTagView alloc] initWithFrame:CGRectMake(0, tagViewHeight + 150, self.view.frame.size.width, 300) tagStrings:strArr2 delegate:self];
    [tagViewForLeftAlign setAlignCenter:NO];
    [tagViewForLeftAlign setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:tagViewForLeftAlign];

}

#pragma mark - TezTagView delegate
- (void)responseOfClickTag:(NSInteger)index {
    NSLog(@"Button index - %lu", index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
