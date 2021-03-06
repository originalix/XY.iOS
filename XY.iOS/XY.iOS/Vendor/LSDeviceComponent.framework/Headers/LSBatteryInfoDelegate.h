//
//  LSBatteryInfoDelegate.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/27.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"

#pragma mark LSBatteryInfo

/**
 电量信息
 */
@interface LSBatteryInfo : NSObject

/**
 *  是否正在充电
 */
@property (nonatomic, assign) BOOL isCharging;

/**
 *  电量(正常范围范围:0~100, -1:表示设备不支持或读取出错)
 */
@property (nonatomic, assign) NSInteger battery;

@end

#pragma mark LSBatteryInfoDelegate

/**
 电量信息回调委托
 */
@protocol LSBatteryInfoDelegate <NSObject>

@required

/**
 电量回调

 @param deviceId 设备标识
 @param batteryInfo 电量信息，如果设备不支持读取或出错，则该变量为nil
 */
- (void)didUploadBatteryInfo:(LSDeviceId)deviceId batteryInfo:(LSBatteryInfo *)batteryInfo;

@end
