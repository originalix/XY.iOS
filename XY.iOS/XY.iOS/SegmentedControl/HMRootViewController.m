//
//  HMRootViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/12/16.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "HMRootViewController.h"
#import "HMSegmentedControl.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface HMRootViewController ()

@end

@implementation HMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUIView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupUIView {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
    segmentedControl.frame = CGRectMake(0, 0, kScreenWidth, 60);
    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
}

- (void)segmentedControlChangedValue:(NSInteger)index {
    NSLog(@"%ld", index);
}

@end
