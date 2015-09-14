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
    
    NSArray* strArr = @[@"test1", @"test2", @"blablablablabla", @"blablablablabla",@"blablablablabla", @"qweqfasf", @"123123123", @"test1", @"test2", @"blablablablabla", @"qweqfasf", @"123123123"];

    TezTagView* tagView = [[TezTagView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) tagStrings:strArr delegate:self];
    [tagView setAlignCenter:YES];
    [tagView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:tagView];
    
}

#pragma mark - TezTagView delegate
- (void)responseOfClickTag:(NSInteger)index {
    NSLog(@"Button index - %lu", index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
