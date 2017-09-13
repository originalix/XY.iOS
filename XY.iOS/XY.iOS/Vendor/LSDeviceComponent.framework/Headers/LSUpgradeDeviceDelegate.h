//
//  LSUpgradeDeviceDelegate.h
//  LSBleDevice
//
//  Created by lifesense－mac on 17/5/8.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lsmodels_inc.h"

/**
 升级设备回调
 */
@protocol LSUpgradeDeviceDelegate <NSObject>

/**
 设备升级状态回调

 @param deviceId 设备Id
 @param state 升级状态
 */
- (void)onUpgradeDeviceState:(NSString *)deviceId state:(LSUpgradeDeviceState)state;

/**
 设备升级进度回调,只有在升级状态为LSBUpgradeDeviceStateEnterUpgadeMode该回调才会生效

 @param deviceId 设备Id
 @param precent 进度(范围:0~100)
 */
- (void)onUpgradeDevicePrecent:(NSString *)deviceId precent:(NSUInteger)precent;

@end
