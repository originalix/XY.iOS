//
//  LSDeviceManagerDelegate.h
//  LSDeviceComponent
//
//  Created by lifesense－mac on 17/6/20.
//  Copyright © 2017年 lifesense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSConstant.h"
#import "lsmodels_inc.h"

@class LSBatteryInfo;

/**
 设备组件代理
 */
@protocol LSDeviceManagerDelegate <NSObject>

/**
 设备组件初始化回调

 @param bSuccess 初始化是否成功
 */
- (void)deviceManagerInitFinish:(BOOL)bSuccess;

/**
 蓝牙改变状态回调
 
 @param state 蓝牙状态
 */
- (void)deviceManagerBleState:(LSBluetoothState)state;

/**
 设备连接状态回调
 
 @param deviceId 设备标识
 @param state 连接状态
 */
- (void)deviceManagerDeviceConnectionChanged:(LSDeviceId)deviceId state:(LSDeviceConnectState)state;

/**
 设备详细信息回调
 
 @param deviceId 设备标识
 @param deviceInfo 设备详细信息
 */
- (void)deviceManagerReceiveDeviceInfo:(LSDeviceId)deviceId deviceInfo:(LSDeviceInfo *)deviceInfo;

/**
 设备上传电量信息

 @param deviceId 设备标识
 @param batteryInfo 电量信息
 */
- (void)deviceManagerReceiveBatteryInfo:(LSDeviceId)deviceId batteryInfo:(LSBatteryInfo *)batteryInfo;

/**
 设备上传步数数据回调
 
 @param deviceId 设备
 @param data 步数数据
 */
- (void)deviceManagerReceiveWalkingData:(LSDeviceId)deviceId data:(LSWalkingData *)data;

/**
 设备上传睡眠数据回调
 
 @param deviceId 设备
 @param data 睡眠数据
 */
- (void)deviceManagerReceiveSleepingData:(LSDeviceId)deviceId data:(LSSleepingData *)data;

/**
 设备上传心率数据回调
 
 @param deviceId 设备
 @param data 心率数据
 */
- (void)deviceManagerReceiveHeartRateData:(LSDeviceId)deviceId data:(LSHeartRateData *)data;

/**
设备上传运动心率数据回调

@param deviceId 设备
@param data 运动心率数据
*/
- (void)deviceManagerReceiveSportHeartRateData:(LSDeviceId)deviceId data:(LSSportHeartRateData *)data;

/**
 设备上传跑步卡路里数据回调
 
 @param deviceId 设备
 @param data 卡路里数据
 */
- (void)deviceManagerReceiveSportCalorieData:(LSDeviceId)deviceId data:(LSSportCalorieData *)data;

/**
 设备上传心率区间统计数据回调
 
 @param deviceId 设备
 @param data 心率区间数据
 */
- (void)deviceManagerReceiveHeartRateSectionData:(LSDeviceId)deviceId data:(LSHeartRateSectionData *)data;

/**
 设备上传运动数据回调
 
 @param deviceId 设备
 @param data 运动数据
 */
- (void)deviceManagerReceiveSportData:(LSDeviceId)deviceId data:(LSSportData *)data;

/**
 设备上传运动模式状态数据回调
 
 @param deviceId 设备
 @param data 运动模式状态数据
 */
- (void)deviceManagerReceiveSportModeStateData:(LSDeviceId)deviceId data:(LSSportModeStateData *)data;

/**
 设备上传运动配速数据回调
 
 @param deviceId 设备
 @param data 运动配速数据
 */
- (void)deviceManagerReceiveSportSpeedData:(LSDeviceId)deviceId data:(LSSportSpeedData *)data;

/**
 称上传体重数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveWeightData:(LSDeviceId)deviceId data:(LSWeightData *)data;

/**
 称上传单位设置回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveWeightUnitData:(LSDeviceId)deviceId data:(LSWeightUnitData *)data;

/**
 称上传体脂数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveBodyCompositionData:(LSDeviceId)deviceId data:(LSBodyCompositionData *)data;

/**
 血压计上传体测量数据回调
 
 @param deviceId 设备
 @param data 体重数据
 */
- (void)deviceManagerReceiveBloodPressureData:(LSDeviceId)deviceId data:(LSBloodPressureData *)data;

@end
