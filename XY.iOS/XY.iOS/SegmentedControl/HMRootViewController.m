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
//    self.view.backgroundColor = [UIColor yellowColor];
    [self setupUIView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupUIView {
    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
    segmentedControl.frame = CGRectMake(0, 64, kScreenWidth, 60);
    segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    segmentedControl.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    [segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName: [UIFont systemFontOfSize:17.f]}];
    [segmentedControl setSelectedTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]}];
    [segmentedControl addTarget:self action:@selector(titleSegmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
}

- (void)titleSegmentControlChanged:(HMSegmentedControl *)segmentedControl {
    NSLog(@"%ld", segmentedControl.selectedSegmentIndex);
}

@end
