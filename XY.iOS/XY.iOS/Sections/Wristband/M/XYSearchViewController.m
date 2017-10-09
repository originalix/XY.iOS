//
//  XYSearchViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSearchViewController.h"
#import "XYDeviceManager.h"

@interface XYSearchViewController ()<LSScanDeviceDelegate>

@end

@implementation XYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[XYDeviceManager shared] initializeSDK];
    [self startSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startSearch {
    [[LSDeviceManager shared] scanDevice:self];
}

#pragma mark - LSScanDeviceDelegate
- (void)onScanResult:(LSScanDeviceInfo *)deviceInfo {
    NSLog(@"deviceInfo = %@", [deviceInfo description]);
}

@end
