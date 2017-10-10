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

@interface XYMainViewController ()<LSDeviceDataDelegate>

@end

@implementation XYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[XYDeviceManager shared] initializeSDK];
    [XYDeviceManager shared].delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button Action
- (IBAction)searchDevice:(id)sender {
    XYSearchViewController *searchVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XYSearchViewController"];
    [self.navigationController pushViewController:searchVC animated:true];
}

- (void)didReceiveData:(NSString *)tag content:(NSString *)content {
    SGLog(@"tag = %@, content = %@", tag, content);
}

@end
