//
//  XYSearchViewController.m
//  XY.iOS
//
//  Created by Lix on 2017/9/13.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import "XYSearchViewController.h"
#import "XYDeviceManager.h"
#import "XYSearchDeviceCell.h"
#import "LSEDevice.h"

@interface XYSearchViewController ()<LSScanDeviceDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XYSearchDeviceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    XYSearchDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"XYSearchDeviceCell" owner:self options:nil] firstObject];
//    }
    
    XYSearchDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LSEDevice *device = [[LSEDevice alloc] init];
    device.deviceInfo = [[LSScanDeviceInfo alloc] init];
    device.deviceInfo.name = @"name!!!!";
    device.deviceInfo.macAddress = @"12312312312";
    device.deviceInfo.rssi = 2150;
    [cell setContent:device];
    return cell;
}

@end
