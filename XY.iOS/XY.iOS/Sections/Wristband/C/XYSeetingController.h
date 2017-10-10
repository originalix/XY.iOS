//
//  XYSeetingController.h
//  XY.iOS
//
//  Created by Lix on 2017/10/10.
//  Copyright © 2017年 Lix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LSDeviceComponent/LSDeviceComponent.h>
#import "LSEDevice.h"

@interface XYSeetingController : UITableViewController

@property (nonatomic, strong) LSDevice *device;
@property (nonatomic, assign) LSEDeviceConnectState connectState;
@property (nonatomic, assign) LSDeviceInfo *detailInfo;

@end
