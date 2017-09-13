//
//  XYMainViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYMainViewController.h"
#import "XYSearchViewController.h"
#import "XYDeviceManager.h"

@interface XYMainViewController ()

@end

@implementation XYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[XYDeviceManager shared] initializeSDK];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Action
- (IBAction)searchDevice:(id)sender {
    XYSearchViewController *searchVC = [[XYSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:true];
}

@end
