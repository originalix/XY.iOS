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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建cell
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    // 设置cell数据
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", [self class], indexPath.row];
    
    return cell;
}

@end
