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
@property (nonatomic, strong) NSMutableArray *searchList;
@property (nonatomic, assign) NSInteger filterRSSI;
@property (nonatomic, copy) NSString *filterName;

@end

@implementation XYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchList = [NSMutableArray array];
    self.filterRSSI = -100;
    self.filterName = @"";
    [self.tableView registerNib:[UINib nibWithNibName:@"XYSearchDeviceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self startSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startSearch {
    [[LSDeviceManager shared] stopScan];
    [self.searchList removeAllObjects];
    [self.tableView reloadData];
    [[LSDeviceManager shared] scanDevice:self];
}

- (void)stopSearch {
    [[LSDeviceManager shared] stopScan];
}

#pragma mark - LSScanDeviceDelegate
- (void)onScanResult:(LSScanDeviceInfo *)deviceInfo {
    NSLog(@"deviceInfo = %@", [deviceInfo description]);
    if (deviceInfo.rssi == 127) {
        return;
    }
    
    if (self.filterRSSI == 0 && self.filterName.length == 0) {
        [self addDeviceToList:deviceInfo];
        
    } else if (self.filterRSSI == 0 && self.filterName.length > 0) {
        if ([deviceInfo.name isEqualToString:self.filterName]) {
            [self addDeviceToList:deviceInfo];
        }
        
    } else if (self.filterRSSI != 0 && self.filterName.length == 0) {
        if (deviceInfo.rssi >= self.filterRSSI) {
            [self addDeviceToList:deviceInfo];
        }
        
    } else if (self.filterRSSI != 0 && self.filterName.length > 0) {
        if (deviceInfo.rssi >= self.filterRSSI && [deviceInfo.name isEqualToString:self.filterName]) {
            [self addDeviceToList:deviceInfo];
        }
    }
}

- (void)addDeviceToList:(LSScanDeviceInfo *)deviceInfo {
    for (LSEDevice *item in self.searchList) {
        if ([item.deviceInfo.macAddress isEqualToString:deviceInfo.macAddress]) {
            item.deviceInfo.rssi = deviceInfo.rssi;
            return;
        }
    }
    
    LSEDevice *device = [[LSEDevice alloc] init];
    device.deviceInfo = deviceInfo;
    device.connectState = LSEDeviceStateDisConnect;
    [self.searchList addObject:device];
    
    NSArray *result = [self.searchList sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id  _Nonnull obj2) {
        LSEDevice *item1 = (LSEDevice *)obj1;
        LSEDevice *item2 = (LSEDevice *)obj2;
        return item1.deviceInfo.rssi < item2.deviceInfo.rssi;
    }];
    self.searchList = [NSMutableArray arrayWithArray:result];
    
    NSArray *position = @[[NSIndexPath indexPathForRow:[self.searchList indexOfObject:device] inSection:0]];
    [self.tableView insertRowsAtIndexPaths:position withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XYSearchDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LSEDevice *device = [self.searchList objectAtIndex:indexPath.row];
    [cell setContent:device];
    return cell;
}

@end
